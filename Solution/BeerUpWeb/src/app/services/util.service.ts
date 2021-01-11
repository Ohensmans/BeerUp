import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  apiUrl = 'http://localhost:5001';
  apiTarifsBieresUrl = 'http://localhost:5001/api/TarifsVueBies/';
  apiTarifsEtabsUrl = 'http://localhost:5001/api/TarifsVueEtabs/';
  registerUrl = 'http://localhost:5000/account/registerweb';
  adminUserUrl = 'http://localhost:5000/AdministrationUsers';

  TypeTarifVueUn = "Etab";
  TypeTarifVueDeux = "Biere";

  constructor() { }
}

