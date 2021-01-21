import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { TypesEtabModele } from 'src/app/models/types-etab-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TypesEtabService {

  lTypesEtab: Array<TypesEtabModele>;
  lTypesEtab$: BehaviorSubject<Array<TypesEtabModele>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) {
    this.lTypesEtab = Array(0);
    this.lTypesEtab$ = new BehaviorSubject<Array<TypesEtabModele>>(this.lTypesEtab);
   }

  getAll(){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.get<TypesEtabModele[]>(
      this.util.apiTypesEtabUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value)=>{
        this.lTypesEtab = value;
        this.lTypesEtab$.next(this.lTypesEtab);
      }
    )
  }
}
