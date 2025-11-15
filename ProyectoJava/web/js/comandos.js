$(document).ready(function () {
    $("#btn2").click(function () {
        $('#contenido').slideToggle();
    });

});

$(document).ready(function () {
    $("#domicilio").click(function () {
        $("#seccion-domicilio").fadeToggle();
    });

    $("#tienda").click(function () {
        $("#seccion-tienda").fadeToggle();
    });

    $("#editar1").click(function(){
        $("#p1,#t1").show();
    });

    $("#eliminar1").click(function (){
        $("#p1,#t1").hide();
    });

    $("#editar2").click(function(){
        $("#p2,#t2").show();
    });

    $("#eliminar2").click(function (){
        $("#p2,#t2").hide();
    });
});

document.addEventListener("DOMContentLoaded", function () {
        const modal = document.getElementById("myModal");
        const btnOpen = document.getElementById("abrir");
        const btnClose = document.getElementsByClassName("btn-close")[0];

        function openModal() {
            modal.style.display = "block";
        } 
        function closeModal() {
            modal.style.display = "none";
        }

        btnOpen.addEventListener("click", openModal);
        btnClose.addEventListener("click", closeModal);

        window.addEventListener("click", function(event) {
            if (event.target == modal) {
                closeModal();
            }
     });
    });
    