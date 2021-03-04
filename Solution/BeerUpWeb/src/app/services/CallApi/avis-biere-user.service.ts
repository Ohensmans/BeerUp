import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AvisBiereUserModele } from 'src/app/models/avis-biere-user-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class AvisBiereUserService {


  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) {
   }


   getOne(biereId:string){
    const token = this.authSrv.getUser().id_token;
    let orgId = this.authSrv.getUserOrgId();

    let params = new HttpParams()
      .set('userId', orgId)
      .set('biereId', biereId);

    let result = this.http.get<AvisBiereUserModele>(
      this.util.apiAvisBiereUserUrl+{params},
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  addAvis(avis:AvisBiereUserModele){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post<AvisBiereUserModele>(
      this.util.apiBieresUrl, avis,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

}