

$(document).ready(function () {

    var lAccesBiereAll = $('input[name ="lAccesBiere[0]"]').first();
    var lAccessBiere = $('[id*="lAccesBiere_"]');

    var lAccessEtabAll = $('input[name ="lAccesEtab[0]"]').first();
    var lAccessEtab = $("[id*='lAccesEtab_']");

    if (lAccessBiere.length) {
        CheckAll(lAccessBiere);
    }

    if (lAccessEtab.length) {
        CheckAll(lAccessEtab);
    }

    lAccesBiereAll.change(function () {
        CheckAll(lAccessBiere);
    });

    lAccessEtabAll.change(function () {
        CheckAll(lAccessEtab);
    });
});

function CheckAll(listeCheckBox) {

    

    if (listeCheckBox.length) {

        if (listeCheckBox.get(0).checked) {
            for (var i = 1; i < listeCheckBox.length; i++) {

                listeCheckBox.get(i).checked = false;
                listeCheckBox.get(i).disabled = true;
            }
        }
        else {
            for (var i = 1; i < listeCheckBox.length; i++) {
                listeCheckBox.get(i).disabled = false;
            }
        }

    }

}