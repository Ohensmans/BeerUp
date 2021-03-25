import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class AchatFactureBiereService {

  lAchatsBieresFacture:Array<AchatFacture>;
  lAchatsBieresFacture$:BehaviorSubject<Array<AchatFacture>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService,) { 
    this.lAchatsBieresFacture = Array(0);
    this.lAchatsBieresFacture$ = new BehaviorSubject<Array<AchatFacture>>(this.lAchatsBieresFacture);
  }


  getAllOrga(orgId:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatsBieresFacture+orgId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsBieresFacture = value;
        this.lAchatsBieresFacture$.next(this.lAchatsBieresFacture);
      }
    );
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatsBieresFacture,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsBieresFacture = value;
        this.lAchatsBieresFacture$.next(this.lAchatsBieresFacture);
      }
    );
  }

  getAllParFacture(facId:number){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatBieresFactureParFacture+facId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsBieresFacture = value;
        this.lAchatsBieresFacture$.next(this.lAchatsBieresFacture);
      }
    );
  }
}
