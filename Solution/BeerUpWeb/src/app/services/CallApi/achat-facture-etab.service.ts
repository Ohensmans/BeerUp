import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class AchatFactureEtabService {

  lAchatsEtabFacture:Array<AchatFacture>;
  lAchatsEtabFacture$:BehaviorSubject<Array<AchatFacture>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService,) { 
    this.lAchatsEtabFacture = Array(0);
    this.lAchatsEtabFacture$ = new BehaviorSubject<Array<AchatFacture>>(this.lAchatsEtabFacture);
  }


  getAllOrga(orgId:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatsEtabFacture+orgId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsEtabFacture = value;
        this.lAchatsEtabFacture$.next(this.lAchatsEtabFacture);
      }
    );
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatsEtabFacture,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsEtabFacture = value;
        this.lAchatsEtabFacture$.next(this.lAchatsEtabFacture);
      }
    );
  }

  getAllParFacture(facId:number){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatEtabFactureParFacture+facId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsEtabFacture = value;
        this.lAchatsEtabFacture$.next(this.lAchatsEtabFacture);
      }
    );
  }
}
