import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  //Api BeerUp
  apiUrl = 'http://localhost:5001';
  apiTarifsBieresUrl = 'http://localhost:5001/api/TarifsVueBieres/';
  apiTarifsEtabsUrl = 'http://localhost:5001/api/TarifsVueEtabs/';
  apiEtabsOrgaUrl = 'http://localhost:5001/api/EtabOrga/';
  apiEtablissementsUrl = 'http://localhost:5001/api/Etablissements/';
  apiTypesEtabUrl = 'http://localhost:5001/api/TypesEtab/';
  apiImagesEtab = 'http://localhost:5001/api/ImagesEtab/';
  apiGetDeletablesBieres = 'http://localhost:5001/api/GetDeletablesBieres/';
  apiGetDeletablesEtabs = 'http://localhost:5001/api/GetDeletablesEtabs/';
  apiGetDeletablesTarifsBiere = 'http://localhost:5001/api/GetDeletablesTarifsBiere/';
  apiGetDeletablesTarifsEtab = 'http://localhost:5001/api/GetDeletablesTarifsEtab/';
  apiOrganisations = 'http://localhost:5001/api/Organisations/';
  apiHoraires = 'http://localhost:5001/api/Horaires/';
  apiJoursFermeture = 'http://localhost:5001/api/JoursFermeture/';
  
  //External Api
  VAT = "http://apilayer.net/api/validate";

  //IdentityServer
  registerUrl = 'http://localhost:5000/account/registerweb';
  adminUserUrl = 'http://localhost:5000/AdministrationUsers';

  //Parameter
  TypeTarifVueEtab = "Etab";
  TypeTarifVueBiere = "Biere";

  noImageAvailableUrl = 'http://localhost:5001/resources/images/no_image_available.png';

  joursSemaine = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];

  constructor() { }
}

