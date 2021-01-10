import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TarifsEtabsService {

  constructor(private http:HttpClient, private util:UtilService) { }

  getAll(){
    const token = localStorage.getItem("jwt");

    return this.http.get<TarifModele[]>(
      this.util.apiTarifsBieresUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
  }

  addTarif(tarif:TarifModele){
    const token = localStorage.getItem("jwt");

    this.http.post<TarifModele>(
      this.util.apiTarifsEtabsUrl, tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
  }

  deleteTarif(id:string){
    const token = localStorage.getItem("jwt");

    this.http.delete<string>(
      this.util.apiTarifsEtabsUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
  }

  updateTarif(tarif:TarifModele, id:string){
    const token = localStorage.getItem("jwt");

    this.http.put<TarifModele>(
      this.util.apiTarifsEtabsUrl+id,tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
  }



}
