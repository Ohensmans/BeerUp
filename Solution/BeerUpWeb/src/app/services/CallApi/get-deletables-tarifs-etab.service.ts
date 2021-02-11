import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class GetDeletablesTarifsEtabService {
  lDeletablesTarifsEtab: Array<TarifModele>;
  lDeletablesTarifsEtab$: BehaviorSubject<Array<TarifModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lDeletablesTarifsEtab = Array(0);
    this.lDeletablesTarifsEtab$ = new BehaviorSubject<Array<TarifModele>>(this.lDeletablesTarifsEtab);
  }


  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<TarifModele[]>(
      this.util.apiGetDeletablesTarifsEtabUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
      return result;
  }
}
