import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  //IdentityServer
  registerUrl = 'http://192.168.179.194:5000/account/registerweb';
  adminUserUrl = 'http://192.168.179.194:5000/AdministrationUsers';


  //Api BeerUp
  urlBeerUpApi = 'http://192.168.179.194:5001/';
  urlIdentity = 'http://192.168.179.194:5000';
  apiUrl = this.urlBeerUpApi+'api/';
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
  apiImagesBiereUrl = this.apiUrl+'ImagesBiere/';
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


  //Parameter
  TypeTarifVueEtab = "Etab";
  TypeTarifVueBiere = "Biere";
  NoteMAX = 5;
  nombreMiniNotesAvis = 3;

  noImage = '/No_image_available.png'
  googleStorage = 'https://storage.googleapis.com/beerup/images';
  noImageAvailableUrl = this.googleStorage+this.noImage;
  imageEtabsUrl = this.googleStorage+'/Etabs';
  imageBieresUrl = this.googleStorage+'/Bieres';

  joursSemaine = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];

  //Pagination Parameters
  nextText="»";
  previousText="«"
  maxSize = 5;
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

