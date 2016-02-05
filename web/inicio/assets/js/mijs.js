/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
    $("#ingresar").click(function() {
        $(".page-content").hide();
        $(".footer-inverse").hide();
        $("#login-form").show();
    });
    $("#inicio").click(function() {
        $(".footer-inverse").show();
        $("#login-form").show();
    });
});