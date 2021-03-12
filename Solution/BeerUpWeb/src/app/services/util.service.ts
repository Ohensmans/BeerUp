import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  //Api BeerUp
  apiUrl = 'http://localhost:5001/api/';
  apiTarifsBieresUrl = this.apiUrl+'TarifsVueBieres/';
  apiTarifsEtabsUrl = this.apiUrl+'TarifsVueEtabs/';
  apiEtabsOrgaUrl = this.apiUrl+'EtabOrga/';
  apiEtablissementsUrl = this.apiUrl+'Etablissements/';
  apiTypesEtabUrl = this.apiUrl+'TypesEtab/';
  apiImagesEtabUrl = this.apiUrl+'ImagesEtab/';
  apiGetDeletablesBieresUrl = this.apiUrl+'GetDeletablesBieres/';
  apiGetDeletablesEtabsUrl = this.apiUrl+'GetDeletablesEtabs/';
  apiGetDeletablesTarifsBiereUrl = this.apiUrl+'GetDeletablesTarifsBiere/';
  apiGetDeletablesTarifsEtabUrl = this.apiUrl+'GetDeletablesTarifsEtab/';
  apiOrganisationsUrl = this.apiUrl+'Organisations/';
  apiHorairesUrl = this.apiUrl+'Horaires/';
  apiJoursFermetureUrl = this.apiUrl+'JoursFermeture/';
  apiBieresUrl = this.apiUrl+'Bieres/';
  apiBieresEtabUrl = this.apiUrl+'BieresEtab/';
  apiBieresOrgaUrl = this.apiUrl+'BieresOrga/';
  apiTypesServicesUrl = this.apiUrl+'TypesServices/';
  apiVentesBieresEtaUrl = this.apiUrl+'VentesBieresEta/';
  apiTypesBiereUrl = this.apiUrl+'TypesBiere/';
  apiImagesBiereUrl = this.apiUrl+'ImagesEtab/';
  apiAvisBiereUserUrl = this.apiUrl+'AvisBiereUser/';
  apiVuesAchatsBiere = this.apiUrl+'VuesAchatsBiere/';
  apiVuesAchatsEtab = this.apiUrl+'VuesAchatsEtab/';

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

  //Pagination Parameters
  nextText="»";
  previousText="«"
  itemsPerPage = 7;

  constructor() { }
}

