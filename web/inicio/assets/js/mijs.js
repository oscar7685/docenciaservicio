/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#login-form").hide();
    $("#ingresar").click(function() {
        $(".page-content").hide();
        $(".footer-inverse").hide();
        $("#login-form").show();
    });
    $("#inicio").click(function() {
        $(".footer-inverse").show();
        $("#login-form").hide();
        $(".page-content").show();


    });
});