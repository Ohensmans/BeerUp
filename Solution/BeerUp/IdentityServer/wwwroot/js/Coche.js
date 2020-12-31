

$(document).ready(function () {

var lAccesBiereAll = $('#lAccesBiere[0]');

var lAccessEtabAll = $('#lAccesEtab[0]');

var lAccessBiere = $('[id*="lAccesBiere_"]');

var lAccessEtab = $("[id*='lAccesEtab_']");

if (lAccesBiereAll.val()) {
    for (var i = 1; i < lAccessBiere.length; i++){
        console.log(lAccesBiereAll.val());
}}


if (lAccessEtabAll.val()) {
    for (var i = 1; i < lAccessEtab.length; i++) {
        
    }
}

   

});