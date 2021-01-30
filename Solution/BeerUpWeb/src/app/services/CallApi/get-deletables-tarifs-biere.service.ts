import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class GetDeletablesTarifsBiereService {

  lDeletablesTarifsBiere: Array<TarifModele>;
  lDeletablesTarifsBiere$: BehaviorSubject<Array<TarifModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lDeletablesTarifsBiere = Array(0);
    this.lDeletablesTarifsBiere$ = new BehaviorSubject<Array<TarifModele>>(this.lDeletablesTarifsBiere);
  }


  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<TarifModele[]>(
      this.util.apiGetDeletablesTarifsBiere,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lDeletablesTarifsBiere = value;
        this.lDeletablesTarifsBiere$.next(this.lDeletablesTarifsBiere);
      }
    )
  }
}
