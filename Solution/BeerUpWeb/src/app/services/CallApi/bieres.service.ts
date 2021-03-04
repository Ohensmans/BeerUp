import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';
import { GetDeletablesBieresService } from './get-deletables-bieres.service';

@Injectable({
  providedIn: 'root'
})
export class BieresService {

  lBiere: Array<BiereModele>;
  lBiere$: BehaviorSubject<Array<BiereModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, private delBiere :GetDeletablesBieresService) { 
    this.lBiere = Array(0);
    this.lBiere$ = new BehaviorSubject<Array<BiereModele>>(this.lBiere);
  }

  getDeletablesBieres(){

    let result = this.delBiere.getAll().subscribe(
      (value) =>{
        //assigne true aux éléments de la liste biere qui sont dans la liste des deletables
        value.forEach(element =>{
          let index = this.lBiere.findIndex(x => x.bieId == element.bieId)
          if (index!=-1){
            this.lBiere[index].isDeletable = true;
          }
        });
        this.lBiere$.next(this.lBiere);
      }
    );  
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<BiereModele[]>(
      this.util.apiBieresUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lBiere = value;
        this.getDeletablesBieres();
      }
    )
  }

  getOne(id:string){
    const token = this.authSrv.getUser().id_token;

    let result = this.http.get<BiereModele>(
      this.util.apiBieresUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  addBiere(biere:BiereModele){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post<BiereModele>(
      this.util.apiBieresUrl, biere,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  deleteBiere(id:string){
    const token:string = this.authSrv.getUser().id_token;

  this.http.delete<string>(
      this.util.apiEtablissementsUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lBiere.findIndex(x => x.bieId == id);
        this.lBiere.splice(index,1);
        this.lBiere$.next(this.lBiere);
      }
    )
  }

  updateBiere(biere:BiereModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.put<BiereModele>(
      this.util.apiEtablissementsUrl+id,biere,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lBiere.findIndex(x => x.bieId == id);
        this.lBiere[index] = biere;
        this.lBiere$.next(this.lBiere);
      }
    );
  }
}