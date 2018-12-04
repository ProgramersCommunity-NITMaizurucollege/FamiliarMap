google.maps.event.addDomListener(window, 'load', function(mapObj)
{
  //-------------initialize---------------
  var lat=35.4747971;
  var lng=135.38599180000006;
  var zoom=13;
  var mapObj=initialize(lat,lng,zoom);


  console.log(mapObj);
  mapObj.panTo(new google.maps.LatLng(lat,lng));
  var today=get_today();
  console.log(today);
  var monthago=get_Xmonthago(3);
  console.log(monthago);
  //console.log(get_SelectTag('[name=category]'));

//---------------------------------------

/********************
カテゴリ変更時処理
********************/
  $('[name=category]').change(function() {
    // 選択されているvalue属性値を取り出す
    var val = $('[name=category]').val();
    console.log(val); // 出力：ABC
    if(val==1){

      mapObj=initialize(lat,lng,zoom);
      var e_lat=new Array(); var e_lng=new Array(); var e_msg=new Array(); var e_mk=new Array();
      Event_load('event_load.php',today,mapObj,e_mk,e_msg,e_lat,e_lng);
    }
    if(val==2){
      mapObj=initialize(lat,lng,zoom);
      TranceInfo_load('rosen_load.php','xml_load4.php',today,mapObj);
      Move_center(lat,lng,mapObj);
      console.log(lat);
      console.log(lng);
    }
    if(val==3){
      mapObj=initialize(lat,lng,zoom);
      fushinsya_load('fushinsya_load.php',monthago,today,'./h22ka26202.xml',mapObj);
    }
    if(val==4){
      mapObj=initialize(lat,lng,zoom);
      TranceInfo_load('rosen_load.php','xml_load4.php',today,mapObj);
      var e_lat=new Array(); var e_lng=new Array(); var e_msg=new Array(); var e_mk=new Array();
      Event_load('event_load.php',today,mapObj,e_mk,e_msg,e_lat,e_lng);
      fushinsya_load('fushinsya_load.php',monthago,today,'./h22ka26202.xml',mapObj);
      Move_center(lat,lng,mapObj);
    }
    Move_center(lat,lng,mapObj);
});

//-----------category select----------------

    var district_txt=$('[name=district] option:selected').text();
    var prefecture_txt=$('[name=prefecture] option:selected').text();
    var city_txt=$('[name=city] option:selected').text();
//    console.log(prefecture_txt+city_txt+district_txt);

    $('[name=district]').change(function() {

    district_txt = $('[name=district] option:selected').text();
    city_txt=$('[name=city] option:selected').text();
    console.log(district_txt);
    center_to_place(city_txt+district_txt,mapObj,lat,lng);
  });

  $('[name=prefecture]').change(function(){
    prefecture_txt=$('[name=prefecture] option:selected').text();
    console.log(prefecture_txt);
    center_to_place(prefecture_txt,mapObj,lat,lng);
  });
  $('[name=city]').change(function(){
    city_txt=$('[name=city] option:selected').text();
    console.log(city_txt);
    center_to_place(city_txt,mapObj,lat,lng);
  });

 $('[name=Search]').change(function(){
    var val=$('[name=Search]').val();
    console.log(val);
    mapObj=initialize(lat,lng,zoom);
  //  Event_load_Search('Event_load_search.php',today,mapObj,val);
    Move_center(lat,lng,mapObj);
    place_to_polygon(val,'./h22ka26202.xml',"#0000ff",mapObj);
  });


//-------------datepick---------------------

  $(function() {
  $("#datepicker").datepicker({
　　　dateFormat: 'yy-mm-dd' ,//日数の表示フォーマット
//      buttonImage: './img/calendar.png',
      showOn:'focus',
      showOtherMonths:'true',
      onSelect: function(dateText, inst) {
              dateText2=dateText.replace( /-/g,",")
              today=get_date(dateText2,0,0,0);
              monthago=get_date(dateText2,0,-3,0);
              console.log(today);
              console.log(monthago);
              }
　　});
});
});
