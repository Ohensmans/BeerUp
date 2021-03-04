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
  apiImagesEtabUrl = 'http://localhost:5001/api/ImagesEtab/';
  apiGetDeletablesBieresUrl = 'http://localhost:5001/api/GetDeletablesBieres/';
  apiGetDeletablesEtabsUrl = 'http://localhost:5001/api/GetDeletablesEtabs/';
  apiGetDeletablesTarifsBiereUrl = 'http://localhost:5001/api/GetDeletablesTarifsBiere/';
  apiGetDeletablesTarifsEtabUrl = 'http://localhost:5001/api/GetDeletablesTarifsEtab/';
  apiOrganisationsUrl = 'http://localhost:5001/api/Organisations/';
  apiHorairesUrl = 'http://localhost:5001/api/Horaires/';
  apiJoursFermetureUrl = 'http://localhost:5001/api/JoursFermeture/';
  apiBieresUrl = 'http://localhost:5001/api/Bieres/';
  apiBieresEtabUrl = 'http://localhost:5001/api/BieresEtab/';
  apiBieresOrgaUrl = 'http://localhost:5001/api/BieresOrga/';
  apiTypesServicesUrl = 'http://localhost:5001/api/TypesServices/';
  apiVentesBieresEtaUrl = 'http://localhost:5001/api/VentesBieresEta/';
  apiTypesBiereUrl = 'http://localhost:5001/api/TypesBiere/';
  apiImagesBiereUrl = 'http://localhost:5001/api/ImagesEtab/';
  apiAvisBiereUserUrl = 'http://localhost:5001/api/AvisBiereUser/';

  //External Api
  VATUrl = "http://apilayer.net/api/validate";

  //IdentityServer
  registerUrl = 'http://localhost:5000/account/registerweb';
  adminUserUrl = 'http://localhost:5000/AdministrationUsers';

  //Parameter
  TypeTarifVueEtab = "Etab";
  TypeTarifVueBiere = "Biere";
  NoteMAX = 5;
  nombreMiniNotesAvis = 3;

  noImageAvailableUrl = 'http://localhost:5001/resources/images/no_image_available.png';

  joursSemaine = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];

  constructor() { }
}

