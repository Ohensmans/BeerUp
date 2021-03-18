import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { FactureModele } from 'src/app/models/facture-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class FacturesService {

  lFacture:Array<FactureModele>;
  lFacture$:BehaviorSubject<Array<FactureModele>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService,) { 
    this.lFacture = Array(0);
    this.lFacture$ = new BehaviorSubject<Array<FactureModele>>(this.lFacture);
  }

  addFacture(facture:FactureModele){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post<FactureModele>(
      this.util.apiFactures, facture,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  getAllOrga(orgId:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<FactureModele[]>(
      this.util.apiFacturesOrga+orgId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lFacture = value;
        this.lFacture$.next(this.lFacture);
      }
    );
  }

  getOne(id:number){
    const token = this.authSrv.getUser().id_token;

    let result = this.http.get<FactureModele>(
      this.util.apiFacturesOrga+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

}

