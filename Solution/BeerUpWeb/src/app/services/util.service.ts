import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  apiUrl = 'http://localhost:5001';
  apiTarifsBieresUrl = 'http://localhost:5001/api/TarifsVueBies/';
  apiTarifsEtabsUrl = 'http://localhost:5001/api/TarifsVueEtabs/';
  apiEtabsOrgaUrl = 'http://localhost:5001/api/EtabOrga/';
  apiEtablissementsUrl = 'http://localhost:5001/api/Etablissements/';
  registerUrl = 'http://localhost:5000/account/registerweb';
  adminUserUrl = 'http://localhost:5000/AdministrationUsers';

  TypeTarifVueEtab = "Etab";
  TypeTarifVueBiere = "Biere";

  constructor() { }
}

