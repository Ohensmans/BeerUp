import { HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class MollieService {
  http: any;

  constructor(private util:UtilService) { }

  createPayment(solde:number, transactionId:string){
    const key = environment.MollieKey;

    let payment = {
      amount: {
        currency : 'EUR',
        value : solde,
      },
      description :this.util.referencePayment+transactionId,
      redirectUrl:this.util.RedirectUrl,
      webhookUrl:this.util.WebhookUrl,
      metadata:{
        transactionId:transactionId,
      },
    };

    var result = this.http.post(
      this.util.apiMollie, payment,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + key })}
    );
    result.observe(
      (value: { _links: { checkout: string; }; }) =>{
        return value._links.checkout;
      }
    )

  }

}
