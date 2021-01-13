import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';
import { BehaviorSubject } from 'rxjs';
import { Guid } from 'guid-typescript';

@Injectable({
  providedIn: 'root'
})
export class TarifsEtabsService {

  lTarifsEtabs: Array<TarifModele>;
  lTarifsEtabs$: BehaviorSubject<Array<TarifModele>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) {
    this.lTarifsEtabs = Array(0);
    this.lTarifsEtabs$ = new BehaviorSubject<Array<TarifModele>>(this.lTarifsEtabs);
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
        this.lTarifsEtabs$.next(this.lTarifsEtabs);
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
        let index = this.lTarifsEtabs.findIndex(x => x.id == Guid.createEmpty().toString())
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
        let index = this.lTarifsEtabs.findIndex(x => x.id == id)
        this.lTarifsEtabs.splice(index,1);
        this.lTarifsEtabs$.next(this.lTarifsEtabs);
      });
  }

  updateTarif(tarif:TarifModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<TarifModele>(
      this.util.apiTarifsEtabsUrl+id,tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
  }



}
