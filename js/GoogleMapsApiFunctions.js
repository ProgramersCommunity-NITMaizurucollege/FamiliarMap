function initialize(lat,lng,zoom){
    var mapOptions = {
        zoom: zoom,//15                                     //拡大率
        center: new google.maps.LatLng(lat, lng),     //画面の中心位置指定(google.maps.LatLng)
        mapTypeId: google.maps.MapTypeId.ROADMAP,     //マップのタイプを指定
        scaleControl: true                            //スケール(距離のめやす)を表示するかのフラグ
    };
    var Obj = new google.maps.Map(document.getElementById('gmap'), mapOptions);
    return Obj;
}

function marker(lat,lng,mapObj){
  var a =new google.maps.Marker({
       position: new google.maps.LatLng(lat,lng),
       map: mapObj
   });
   return a;
}

function Move_center(lat,lng,mapObj){
  var huga=0;
  var hoge=setInterval(function(){
    mapObj.panTo(new google.maps.LatLng(lat,lng));
    huga++;
    if(huga==1){
      clearInterval(hoge);
//      console.log("Move_end");
    }
  },1000);
}

function infowindow(lat,lng,contents,mapObj){
  var infowindow=new google.maps.InfoWindow({
    content:contents,
    position: new google.maps.LatLng(lat,lng)
  });
  infowindow.open(mapObj);
  return infowindow;
}
function kill_infowindow(infowindow,mapObj){
  infowindow.close(mapObj)
}

function polygon(points,Color,mapObj){
  var pps=new Array();
  pps=add_latlng(points);

  var Options ={
    path:pps,
    strokeWeight:1,
    strokeColor:"#0000ff",
    strokeOpacity:0.5,
    fillColor:Color,
    fillOpacity:0.5
  };
  var polygon =new google.maps.Polygon(Options);
  polygon.setMap(mapObj);
  return polygon;
}

function line(points,Color,mapObj){
  var pps=new Array();
  for(var i=0;i<points.length;i++)
  {
    pps[i]=new google.maps.LatLng(points[i][1],points[i][2]);
  }

  var Options ={
    path: pps,
    strokeWeight: 5,
    strokeColor: Color,
    strokeOpacity: "0.5"
  };
  var poly = new google.maps.Polyline(Options);
  poly.setMap(mapObj);
}

function markers(points,mapObj){
  jQuery.each(points, function(){
      var a=marker(this[1],this[2],mapObj);
    });
}
function infowindows(points,mapObj){
    jQuery.each(points, function()
      {
        var a=infowindow(this[1],this[2],this[3],mapObj);
      });
}
function infowindows2(points,mapObj){
    jQuery.each(points, function()
      {
        var info=(this[0]+"<BR>"+"運転再開");
        var a=infowindow(this[1],this[2],info,mapObj);
      });
}

function add_latlng(points){ // latlng情報の配列にnew.google.maps.LatLngを付け足すだけ
  var latlng=new Array();
  var elem=0;
  for(var i=0;i<points.length;i++){
    if(i%2==0){
      var lat=points[i];
    }else if(i%2!=0){
      var lng=points[i];
      latlng[elem]=new google.maps.LatLng(lat,lng);
      elem++;
    }
  }
  return latlng;
}
//add_latlngとlatlng_to_polygonが必要
function place_to_polygon(place_name,xml_handle,fill_Color,mapObj){ //add_latlngとlatlng_to_polygonが必要
    $(function(){
      $.ajax({
        type: "POST",
        url:    './xmlload2.php',
        data:{
          "place_name":place_name,
          "xml_handle":xml_handle
          },
        success: function(data){
          var pps=JSON.parse(data);
          console.log(pps);
          for(var i=0;i<pps.length;i++){
            polygon(pps[i],fill_Color,mapObj);
          }
        }
    });
  });
}


function station(line_name,mapObj){
  $(function(){
    $.ajax({
    type: "POST",
    url:    './xml_load3.php',
    data:{
      "line_name":line_name
      },
    success: function(data){
      var pps=JSON.parse(data);
      console.log(pps);
     markers(pps,mapObj);
     line(pps,"#0000ff",mapObj);

      }
    });
  });
}



function get_today(){
  var myd= new Date();
  var year  = myd.getFullYear();
  var month = myd.getMonth()+1;
  var date  = myd.getDate();
  var array = year +"-"+ month +"-"+ date ;
  return array;
}
function get_Xmonthago(month){
  var myd= new Date();
  myd.setMonth(myd.getMonth()-month);
  var year  = myd.getFullYear();
  var month = myd.getMonth()+1;
  var date  = myd.getDate();
  var array = year +"-"+ month +"-"+ date ;
  return array;
}
function get_date(dateText,year,month,date){
  var myd= new Date(dateText);
  myd.setFullYear(myd.getFullYear()+year);
  myd.setMonth(myd.getMonth()+month);
  myd.setDate(myd.getDate()+date);
  var year  = myd.getFullYear();
  var month = myd.getMonth()+1;
  var date  = myd.getDate();
  var array = year +"-"+ month +"-"+ date ;
  return array;
}

function php_load(php_handle){
  $(function(){
    $.ajax({
    type: "GET",
    url:    php_handle,
    success: function(data){
      var pps=JSON.parse(data);
      console.log(pps);
      }
    });
  });
}

function TranceInfo_load(php_handle,php_handle2,today,mapObj){
    $.ajax({
    type: "POST",
    url:    php_handle,
    data:{
      "today":today
      },
    success: function(data){
      var pps=JSON.parse(data);
      console.log("pps");
      console.log(pps[0][3]);
      console.log(pps.length);
      for(var i=0;i<pps.length;i++){
            if(pps[i][3]=="運転再開"){
            StationXML_load(php_handle2,pps[i][0],pps[i][1],pps[i][2]).done(function (result){
            var pps2=JSON.parse(result);
            console.log("pps2");
            infowindows2(pps2,mapObj);
            line(pps2,"#0000FF",mapObj);
            });
          }

        }
      }
    });
  }
function StationXML_load(php_handle,line,station1,station2){
  return $.ajax({
    type: "POST",
    url:  php_handle,
    data:{
      'line':line,
      'station1':station1,
      'station2':station2
    }
  });
}
function fushinsya_load(php_handle,date1,date2,xml_handle,mapObj){
  $.ajax({
    type: "POST",
    url:  php_handle,
    data:{
      'date1':date1,
      'date2':date2
    },
    success:  function(data){
        var pps = JSON.parse(data);
        var Markers=new Array();
        console.log('fushinsya');
        console.log(pps);
        for(var i=0;i<pps.length;i++){
          Markers[i]=marker(pps[i][4],pps[i][5],mapObj);
        }
        for(var i=0;i<pps.length;i++){
          var lat=pps[i][4];
          var lng=pps[i][5];
          var str=pps[i][3];
          place_to_polygon(pps[i][1],xml_handle,"#800080",mapObj);
          console.log(pps[i][4],pps[i][5]);
          var Mk=marker(lat,lng,mapObj);
          google.maps.event.addListener(Mk, 'click', function()
          {
            // info Windowを作成
            infowindow(lat,lng,str,mapObj);
          });
        }
      }
  });
}


function addinfowindow(mk,lat,lng,msg,mapObj){
  google.maps.event.addListener(mk, 'click', function()
      {
        // info Windowを作成
        infowindow(lat,lng,msg,mapObj);
      });
}

function Event_load(php_handle,date,mapObj){
  $.ajax({
    type: "POST",
    url:  php_handle,
    data:{
      'date':date
    },
    success:  function(data){
      var pps=JSON.parse(data);
      console.log(pps);
      for(var i=0;i<pps.length;i++){
          var lat=pps[i][4];
          var lng=pps[i][5];
          var msg="<dt>"+pps[i][0]+"</dt><br>◆日時<br>"+pps[i][2]+"<br>◆場所<br>"+pps[i][1]+"<br>"+pps[i][3];
          var mk=marker(lat,lng,mapObj);
          addinfowindow(mk,lat,lng,msg,mapObj);
//        infowindow(lat,lng,str,mapObj);
      }
    }
  });
}



function route(start,goal,Color,mapObj){
  var request = {
    origin: start,
    destination: goal,
    travelMode: google.maps.DirectionsTravelMode.DRIVING
};
// ルート検索を行う
var directionsService = new google.maps.DirectionsService();
directionsService.route(request, function(result, status){
    if (status == google.maps.DirectionsStatus.OK){
        var directionsRenderer = new google.maps.DirectionsRenderer();
        directionsRenderer.setDirections(result);
        directionsRenderer.draggable = true;
        directionsRenderer.setOptions ({
          polylineOptions: { strokeColor:Color},
          suppressMarkers:true
        });
        directionsRenderer.setMap(mapObj);
    }
});
}

//'[name=alphabet]'
function get_SelectTag(str){
  $(str).change(function() {
    // 選択されているvalue属性値を取り出す
    var val = $(str).val();
    console.log(val); // 出力：ABC
});
//return val;
}

function center_to_place(txt,mapObj,lat,lng){
  var request = {
    address: txt
  };
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode(request, function(results, status)
  {
    // ステータスがOKならマーカーを表示する。
        if (status == google.maps.GeocoderStatus.OK) {
              //console.log(txt,results[0].geometry.location);
                mapObj.panTo(results[0].geometry.location);
                lat=results[0].geometry.location.lat();
                lng=results[0].geometry.location.lng();
                console.log(lat);
                console.log(lng);

          }
        });
}
