import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class TarifsBieresService {


  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { }

  getAll(){
    const token:string = this.authSrv.getUser().id_token;

    var result = this.http.get<TarifModele[]>(
      this.util.apiTarifsBieresUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  addTarif(tarif:TarifModele){
    const token:string = this.authSrv.getUser().id_token;

    this.http.post<TarifModele>(
      this.util.apiTarifsBieresUrl, tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
  }

  deleteTarif(id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.delete<string>(
      this.util.apiTarifsBieresUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
  }

  updateTarif(tarif:TarifModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<TarifModele>(
      this.util.apiTarifsBieresUrl+id,tarif,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
  }
}
