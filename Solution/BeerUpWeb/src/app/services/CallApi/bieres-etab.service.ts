import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class BieresEtabService {

  lBieresServies: Array<BiereModele>;
  lBieresServies$: BehaviorSubject<Array<BiereModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lBieresServies = Array(0);
    this.lBieresServies$ = new BehaviorSubject<Array<BiereModele>>(this.lBieresServies);
  }

  addNewBiere(){
    this.lBieresServies.push(new BiereModele(this.util));
    this.lBieresServies$.next(this.lBieresServies);
  }


  getAll(id:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<BiereModele[]>(
      this.util.apiBieresEtabUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lBieresServies = value;
        this.lBieresServies$.next(this.lBieresServies);
      }
    )
  }
}
