import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class StripeService {
  
  constructor(private util:UtilService, private http:HttpClient, private authSrv :AuthentificationService) { }

  createPayment(solde:number, factureId:string){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.get<any>(
      this.util.apiStripe+solde+","+factureId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }
  
}
