import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class GetDeletablesEtabsService {
 
  lDeletablesEtabs: Array<EtablissementModele>;
  lDeletablesEtabs$: BehaviorSubject<Array<EtablissementModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lDeletablesEtabs = Array(0);
    this.lDeletablesEtabs$ = new BehaviorSubject<Array<EtablissementModele>>(this.lDeletablesEtabs);
  }

  getOneOrga(){
    const token = this.authSrv.getUser().id_token;
    const id = this.authSrv.getUserOrgId();

    var result = this.http.get<EtablissementModele[]>(
      this.util.apiGetDeletablesEtabs+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<EtablissementModele[]>(
      this.util.apiGetDeletablesEtabs,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }
}
