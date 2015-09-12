$(function() {
    var urlx;
    location = "/docenciaservicio/#inicio";

    var actualizaEnlaces = function(hash) {
        $("li").removeClass("active");
        $("a[href='" + hash + "']").parent().addClass("active");
    };

    $(window).hashchange(function() {
        var hash = location.hash;
        if (hash === "#CerrarSesion") {
            $.post('Login?action=CerrarSesion', function() {
                location.reload();

            }); //fin post
        } else if (hash.indexOf("#ejecutarPro") !== -1) {
            $('#modalCc1').modal();
            var cual = hash.split("&");
            hash = cual[0];
            var url3 = "/docenciaservicio/Controlador?action=";
            url3 = url3.concat(cual[0].substring(1), "&", cual[1]);
            urlx = url3;
        } else {
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

        }

    });

    $('#modalCc1b1').click(function() {
        $("div.page-content").empty();
        $.ajax({
            type: "POST",
            url: urlx,
            success: function(data)
            {
                if (data == 1) {
                    location = "#listarProcesos";
                } else {
                    $("#modalCc1").modal('hide');
                    $('#modalCp2').modal();
                    location = "#listarProcesos";
                }

            } //fin success
        }); //fin del $.ajax
    });

});
