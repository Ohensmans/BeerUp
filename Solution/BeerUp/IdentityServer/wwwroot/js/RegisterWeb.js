window.onload = function () {

    if (!document.getElementById("OrgRegister").checked) {
        $("#registerOrga").hide();
    }
    
}

const OrgaRegister = document.getElementById("OrgRegister");

const OrgaExist = document.getElementById("OrgExiste");

OrgaRegister.addEventListener('change', (event) => {
    $("#registerOrga").toggle();

    // si la checkbox est check - met uncheck à l'autre
    if (OrgaRegister.checked) {
        $("#OrgExiste").prop("checked", false);
    }
});


OrgaExist.addEventListener('change', (event) => {

    // si la checkbox est check - met uncheck à l'autre et cache le formulaire orga
    if (OrgaExist.checked) {
        $("#registerOrga").hide();
        $("#OrgRegister").prop("checked", false);
        }       
    });

