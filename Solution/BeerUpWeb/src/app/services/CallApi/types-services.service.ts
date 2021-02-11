import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { TypeServicesModele } from 'src/app/models/type-services-modele';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TypesServicesService {

  lTypesService: Array<TypeServicesModele>;
  lTypesService$: BehaviorSubject<Array<TypeServicesModele>>;
  
  constructor(private http:HttpClient, private util:UtilService) { 
    this.lTypesService = Array(0);
    this.lTypesService$ = new BehaviorSubject<Array<TypeServicesModele>>(this.lTypesService);
  }


  getAll(){

    let result = this.http.get<TypeServicesModele[]>(this.util.apiTypesServicesUrl);
    result.subscribe(
      (value) => {
        this.lTypesService = value;
        this.lTypesService$.next(this.lTypesService);
      }
    )
  }
}
