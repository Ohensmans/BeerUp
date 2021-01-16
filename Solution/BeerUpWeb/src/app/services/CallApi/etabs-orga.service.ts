import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class EtabsOrgaService {

  lEtabsOrga: Array<EtablissementModele>;
  lEtabsOrga$: BehaviorSubject<Array<EtablissementModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lEtabsOrga = Array(0);
    this.lEtabsOrga$ = new BehaviorSubject<Array<EtablissementModele>>(this.lEtabsOrga);
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;
    const id = this.authSrv.getUserOrgId();

    var result = this.http.get<EtablissementModele[]>(
      this.util.apiEtabsOrgaUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lEtabsOrga = value;
        this.lEtabsOrga$.next(this.lEtabsOrga);
      }
    )
  }
  
}
