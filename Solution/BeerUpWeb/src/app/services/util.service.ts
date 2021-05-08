import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  //Api BeerUp
  urlBeerUpApi = 'http://192.168.179.134:5001/';
  apiUrl = 'http://192.168.179.134:5001/api/';
  apiTarifsBieresUrl = this.apiUrl+'TarifsVueBieres/';
  apiTarifsEtabsUrl = this.apiUrl+'TarifsVueEtabs/';
  apiEtabsOrgaUrl = this.apiUrl+'EtabsOrga/';
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
  apiAdressesFacturation = this.apiUrl+'AdressesFacturation/';
  apiAdressesFacturationOrga = this.apiUrl+'AdressesFacturationOrga/';
  apiFactures = this.apiUrl+'Factures/';
  apiFacturesOrga = this.apiUrl+'FacturesOrga/';
  apiAchatsVues = this.apiUrl+'AchatsVues/';
  apiMollie = this.apiUrl+'Mollie/';
  apiStripe= this.apiUrl+'Stripe/';

  apiAchatsBieresFacture = this.apiUrl+'AchatsBieresFacture/';
  apiAchatBieresFactureParFacture= this.apiUrl+'AchatsBieresFactureParFacture/';

  apiAchatsEtabFacture = this.apiUrl+'AchatsEtabFacture/';
  apiAchatEtabFactureParFacture= this.apiUrl+'AchatsEtabFactureParFacture/';

  apiTransactions= this.apiUrl+'Transactions/';
  

  //External Api
  VATUrl = "http://apilayer.net/api/validate";

  //IdentityServer
  registerUrl = 'http://192.168.179.134:5000/account/registerweb';
  adminUserUrl = 'http://192.168.179.134:5000/AdministrationUsers';

  //Parameter
  TypeTarifVueEtab = "Etab";
  TypeTarifVueBiere = "Biere";
  NoteMAX = 5;
  nombreMiniNotesAvis = 3;

  noImage = '/resources/images/no_image_available.png'
  noImageAvailableUrl = this.urlBeerUpApi+'/resources/images/no_image_available.png';

  joursSemaine = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];

  //Pagination Parameters
  nextText="»";
  previousText="«"
  itemsPerPage = 7;

  //BeerUp Properties
  adresseNom = "BeerUp!";
  adresseRue = "17, Rue de la bière";
  adresseVille = "Bruxelles";
  adressePays = "Belgique";
  numeroTVA = "BE01 0203 0405 0607"
  TVA = 21;

  constructor() { }
}

