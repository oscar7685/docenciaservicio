$(function() {
    location = "/docenciaservicio/#inicio";

    var actualizaEnlaces = function(hash) {
        $("li").removeClass("active");
        $("a[href='" + hash + "']").parent().addClass("active");
    };


    $(window).hashchange(function() {
        var hash = location.hash;


            url3 = hash.replace('#', "Controlador?action=");
            $("div.page-content").empty();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("div.page-content").html(data);
                    actualizaEnlaces(hash);
                } //fin success
            }); //fin del $.ajax 




    });


});
