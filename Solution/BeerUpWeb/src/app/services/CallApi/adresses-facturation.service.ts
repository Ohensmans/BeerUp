import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { AdresseFacturationModele } from 'src/app/models/adresse-facturation-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class AdressesFacturationService {

  lAdresseOrga: Array<AdresseFacturationModele>;
  lAdresseOrga$: BehaviorSubject<Array<AdresseFacturationModele>>;
  lastAdresse: AdresseFacturationModele;
  lastAdresse$: BehaviorSubject<AdresseFacturationModele>;
  lAdressesReception : Array<Array<AdresseFacturationModele>>;
  adresse: AdresseFacturationModele;
  adresse$: BehaviorSubject<AdresseFacturationModele>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lAdresseOrga = Array(0);
    this.lAdresseOrga$ = new BehaviorSubject<Array<AdresseFacturationModele>>(this.lAdresseOrga);
    this.lastAdresse = new AdresseFacturationModele();
    this.lastAdresse$ = new BehaviorSubject<AdresseFacturationModele>(this.lastAdresse);
    this.lAdressesReception = Array(0);
    this.adresse = new AdresseFacturationModele();
    this.adresse$ = new BehaviorSubject<AdresseFacturationModele>(this.adresse);
  }

  getAll(id:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<Array<Array<AdresseFacturationModele>>>(
      this.util.apiAdressesFacturationOrga+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAdressesReception = value;
        this.lAdresseOrga = this.lAdressesReception[0];
        this.lastAdresse = this.lAdressesReception[1][0];
        this.lAdresseOrga$.next(this.lAdresseOrga);
        this.lastAdresse$.next(this.lastAdresse);
      },
      (error) =>{
        this.lAdresseOrga$.next(this.lAdresseOrga);
        this.lastAdresse$.next(this.lastAdresse);
      }
    )
  }

  addAdresse(adresse:AdresseFacturationModele){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post<AdresseFacturationModele>(
      this.util.apiAdressesFacturation, adresse,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  updateChoosenAdresse(adresse:AdresseFacturationModele){
    this.adresse = adresse;
    this.adresse$.next(this.adresse);
  }


}
