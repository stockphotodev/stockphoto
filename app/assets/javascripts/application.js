// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$( function() {
    // 料金プランからアカウント登録へのモーダル切り替え
    $('#planToRegistration').click( function () {
        $('#planModal').modal('hide');
    });

    // ログインからアカウント登録へのモーダル切り替え
    $('#logInToRegistration').click( function () {
        $('#logInModal').modal('hide');
    });

    // アカウント登録から契約手続きへのモーダル切り替え
    $('#registrationToAgreement').click( function () {
        $('#registrationModal').modal('hide');
    });

    // ログインからパスワードリマインダーへのモーダル切り替え
    $('#logInToPasswordReminder').click( function () {
        $('#logInModal').modal('hide');
    });

    // 料金プランのタブ切り替え
    $('#myTab li a').click( function () {
        $('.active').removeClass('active');
        $(this).addClass("active");
        $($(this).attr("href")).addClass("active");
    });
});
