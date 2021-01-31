import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject } from 'rxjs';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';
import { GetDeletablesTarifsBiereService } from './get-deletables-tarifs-biere.service';

@Injectable({
  providedIn: 'root'
})
export class TarifsBieresService {

  lTarifsBiere: Array<TarifModele>;
  lTarifsBiere$: BehaviorSubject<Array<TarifModele>>;
 
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, 
    private DelTarifBiereSrv: GetDeletablesTarifsBiereService) { 
    this.lTarifsBiere = Array(0);
    this.lTarifsBiere$ = new BehaviorSubject<Array<TarifModele>>(this.lTarifsBiere);
  }

  deleteTarifObs(id:string){
    let index = this.lTarifsBiere.findIndex(x => x.id == id)
    this.lTarifsBiere.splice(index,1);
    this.lTarifsBiere$.next(this.lTarifsBiere);
  }

  getDeletablesTarifs(){

    let result = this.DelTarifBiereSrv.getAll().subscribe(
      (value) =>{
        //assigne true aux éléments de la liste tarifs qui sont dans la liste des deletables
        value.forEach(element =>{
          let index = this.lTarifsBiere.findIndex(x => x.id == element.id)
          if (index!=-1){
            this.lTarifsBiere[index].isDeletable = true;
          }
        });
        this.lTarifsBiere$.next(this.lTarifsBiere);
      }
    );  
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<TarifModele[]>(
      this.util.apiTarifsBieresUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lTarifsBiere = value;
        this.getDeletablesTarifs();
      }
    )
  }

  addNewTarif(){
    this.lTarifsBiere.push(new TarifModele());
    this.lTarifsBiere$.next(this.lTarifsBiere);
  }

  getOne(id:string){
    const token = this.authSrv.getUser().id_token;

    let result = this.http.get<TarifModele[]>(
      this.util.apiTarifsBieresUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  addTarif(tarif:TarifModele){
    const token:string = this.authSrv.getUser().id_token;

    this.http.post<TarifModele>(
      this.util.apiTarifsBieresUrl, tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      (value) => {
        let index = this.lTarifsBiere.findIndex(x => x.id == "")
        this.lTarifsBiere[index] =  value;
        this.lTarifsBiere$.next(this.lTarifsBiere);
      }
    );
  }

  deleteTarif(id:string){
    const token:string = this.authSrv.getUser().id_token;

  this.http.delete<string>(
      this.util.apiTarifsBieresUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        this.deleteTarifObs(id);
      }
    )
  }

  updateTarif(tarif:TarifModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<TarifModele>(
      this.util.apiTarifsBieresUrl+id,tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lTarifsBiere.findIndex(x => x.id == id);
        this.lTarifsBiere[index] = tarif;
        this.lTarifsBiere$.next(this.lTarifsBiere);
      }
    )
  }
}
