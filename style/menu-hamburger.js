$(function(){
    // ===============================
    // ハンバーガーアイコン
    // ===============================

    // ナビアイコンをクリック
    $('.navIcon').click(function(){
        $('.overlay').toggle(); // オーバーレイ表示切替
        $('.menu').toggleClass('menuOn'); // サイドメニュー表示切替
        $('#wrap').toggleClass('fixed'); // コンテンツ固定

        if ($('.iconLayer').hasClass('arrow')) { // アイコンが矢印なら
            $('.iconLayer').removeClass('arrow').addClass('hamburger'); // ハンバーガーメニュー
        } else { // それ以外なら
            $('.iconLayer').removeClass('hamburger').addClass("arrow"); // 矢印
        }
        return false;
    });

    // オーバーレイ作成
    $('#contents').prepend('<div class="overlay"></div>');

    // オーバーレイをクリック
    $('.overlay').click(function(){
        $(this).fadeOut(100); // オーバーレイ非表示
        $('.menu').removeClass('menuOn'); // メニュー非表示
        $('#wrap').removeClass('fixed'); // 固定解除
        $('.iconLayer').removeClass('arrow').addClass('hamburger'); // ハンバーガーメニューに
    });

    // ===============================
    // メニュー動作関係
    // ===============================

    // サイドナビゲーション高さ指定
    function winHeight() {
        var winH = $(window).height();
        var headerH = $('header').height();
        var winH = winH - headerH; // ヘッダーの高さを引く
        $('.menu').css({
            'height': winH + 'px',
            'top': headerH + 'px'
        });
        $('#contents').css('marginTop', headerH + 30 + 'px');
    }
    winHeight();

    // リサイズしたら再度実行
    $(window).resize(function(){
        winHeight();
    });

    // サイドメニュー説明文
    $('.menuHeader figcaption').click(function(){
        $('.menu .txt').slideToggle();
    });

});
