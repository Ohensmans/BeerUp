window.onload = function () {

    var nbre = $("#NbreUser").attr("value");
    if (nbre != 0) {
        infoUserAValider(nbre)
    }

}

function infoUserAValider(num) {

    var message = "Il y a " + num + " utilisateurs qui attendent d'être validés";

    Command: toastr["info"](message, "Validation")

    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}
