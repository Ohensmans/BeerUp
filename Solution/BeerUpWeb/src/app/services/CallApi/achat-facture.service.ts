import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class AchatFactureService {

  lAchatsFacture:Array<AchatFacture>;
  lAchatsFacture$:BehaviorSubject<Array<AchatFacture>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService,) { 
    this.lAchatsFacture = Array(0);
    this.lAchatsFacture$ = new BehaviorSubject<Array<AchatFacture>>(this.lAchatsFacture);
  }


  getAllOrga(orgId:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatsFacture+orgId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsFacture = value;
        this.lAchatsFacture$.next(this.lAchatsFacture);
      }
    );
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatsFacture,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsFacture = value;
        this.lAchatsFacture$.next(this.lAchatsFacture);
      }
    );
  }

  getAllParFacture(facId:number){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<AchatFacture[]>(
      this.util.apiAchatFactureParFacture+facId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAchatsFacture = value;
        this.lAchatsFacture$.next(this.lAchatsFacture);
      }
    );
  }
}
