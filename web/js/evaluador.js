$(function() {
    location = "/docenciaservicio/#inicio";
    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('Login?action=CerrarSesion', function() {
                location.reload();

            }); //fin post
        } else if (hash.indexOf("#responderEncuesta") !== -1) {
            var cual = hash.split("&");
            hash = cual[0];
            var url3 = "/docenciaservicio/Controlador?action=";
            url3 = url3.concat(cual[0].substring(1), "&", cual[1], "&", cual[2]);
            urlx = url3;
            $("div.container-fluid").empty();
            $(".fixedHeader").remove();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("div.container-fluid").html(data);
                } //fin success
            }); //fin del $.ajax 

        } else if (hash === "#inicio") {
            var url3 = "/docenciaservicio/Controlador?action=retornarListadoEncuestas";
            $("div.container-fluid").empty();
            $(".fixedHeader").remove();
            $.ajax({
                type: "POST",
                url: url3,
                success: function(data)
                {
                    $("div.container-fluid").html(data);
                } //fin success
            }); //fin del $.ajax 

        }
    });
});
