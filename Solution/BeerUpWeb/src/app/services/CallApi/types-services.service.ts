import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { TypeServicesModele } from 'src/app/models/type-services-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TypesServicesService {

  lTypesService: Array<TypeServicesModele>;
  lTypesService$: BehaviorSubject<Array<TypeServicesModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lTypesService = Array(0);
    this.lTypesService$ = new BehaviorSubject<Array<TypeServicesModele>>(this.lTypesService);
  }


  getAll(){
    const token:string = this.authSrv.getUser().id_token;
    let result = this.http.get<TypeServicesModele[]>(this.util.apiTypesServicesUrl, { headers: new HttpHeaders({ "Authorization": "Bearer " + token })});
    result.subscribe(
      (value) => {
        this.lTypesService = value;
        this.lTypesService$.next(this.lTypesService);
      }
    )
  }
}
