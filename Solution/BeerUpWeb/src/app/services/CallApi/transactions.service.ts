import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TransactionModele } from 'src/app/models/transaction-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TransactionsService {

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { }

  addTransaction(transaction: TransactionModele){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post<TransactionModele>(
      this.util.apiTransactions, transaction,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

}
