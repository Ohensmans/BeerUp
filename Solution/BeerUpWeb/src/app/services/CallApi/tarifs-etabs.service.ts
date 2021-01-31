import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';
import { BehaviorSubject } from 'rxjs';
import { Guid } from 'guid-typescript';
import { GetDeletablesTarifsEtabService } from './get-deletables-tarifs-etab.service';

@Injectable({
  providedIn: 'root'
})
export class TarifsEtabsService {

  lTarifsEtabs: Array<TarifModele>;
  lTarifsEtabs$: BehaviorSubject<Array<TarifModele>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, 
   private DelTarifEtabSrv: GetDeletablesTarifsEtabService) {
    this.lTarifsEtabs = Array(0);
    this.lTarifsEtabs$ = new BehaviorSubject<Array<TarifModele>>(this.lTarifsEtabs);
   }

   deleteTarifObs(id:string){
    let index = this.lTarifsEtabs.findIndex(x => x.id == id)
    this.lTarifsEtabs.splice(index,1);
    this.lTarifsEtabs$.next(this.lTarifsEtabs);
  }

   getDeletablesTarifs(){

    let result = this.DelTarifEtabSrv.getAll().subscribe(
      (value) =>{
        //assigne true aux éléments de la liste tarifs qui sont dans la liste des deletables
        value.forEach(element =>{
          let index = this.lTarifsEtabs.findIndex(x => x.id == element.id)
          if (index!=-1){
            this.lTarifsEtabs[index].isDeletable = true;
          }
        });
        this.lTarifsEtabs$.next(this.lTarifsEtabs);
      }
    );
    
  }

  getAll(){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.get<TarifModele[]>(
      this.util.apiTarifsEtabsUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value)=>{
        this.lTarifsEtabs = value;
        this.getDeletablesTarifs();
      }
    )
  }

  addNewTarif(){
    this.lTarifsEtabs.push(new TarifModele());
    this.lTarifsEtabs$.next(this.lTarifsEtabs);
  }

  getOne(id:string){
    const token = this.authSrv.getUser().id_token;

    let result = this.http.get<TarifModele[]>(
      this.util.apiTarifsEtabsUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  addTarif(tarif:TarifModele){
    const token:string = this.authSrv.getUser().id_token;

    this.http.post<TarifModele>(
      this.util.apiTarifsEtabsUrl, tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      (value) => {
        let index = this.lTarifsEtabs.findIndex(x => x.id == "")
        this.lTarifsEtabs[index] =  value;
        this.lTarifsEtabs$.next(this.lTarifsEtabs);
      }
    );
  }

  deleteTarif(id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.delete<string>(
      this.util.apiTarifsEtabsUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        this.deleteTarifObs(id);
      });
  }

  updateTarif(tarif:TarifModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<TarifModele>(
      this.util.apiTarifsEtabsUrl+id,tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lTarifsEtabs.findIndex(x => x.id == id);
        this.lTarifsEtabs[index] = tarif;
        this.lTarifsEtabs$.next(this.lTarifsEtabs);
      }
    )
  }



}
