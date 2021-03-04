import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { TypesBieresModele } from 'src/app/models/types-biere-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TypesBiereService {

  lTypesBiere: Array<TypesBieresModele>;
  lTypesBiere$: BehaviorSubject<Array<TypesBieresModele>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) {
    this.lTypesBiere = Array(0);
    this.lTypesBiere$ = new BehaviorSubject<Array<TypesBieresModele>>(this.lTypesBiere);
   }


  getAll(){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.get<TypesBieresModele[]>(
      this.util.apiTypesBiereUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value)=>{
        this.lTypesBiere = value;
        this.lTypesBiere$.next(this.lTypesBiere);
      }
    )
  }
}