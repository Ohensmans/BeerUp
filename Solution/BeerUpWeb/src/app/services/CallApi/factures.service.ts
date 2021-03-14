import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { FactureModele } from 'src/app/models/facture-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class FacturesService {

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService,) { }

  addFacture(facture:FactureModele){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post<FactureModele>(
      this.util.apiFactures, facture,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }
}
