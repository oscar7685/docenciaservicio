$(function() {
    location = "/docenciaservicio/#inicio";

    $(window).hashchange(function() {
        var hash = location.hash;
        url3 = hash.replace('#', "Controlador?action=");
        $("div.page-content").empty();
        $.ajax({
            type: "POST",
            url: url3,
            success: function(data)
            {
                $("div.page-content").append(data);
            } //fin success
        }); //fin del $.ajax 


    });


});
