import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { VueAchat } from 'src/app/models/vue-achat';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class VuesAchatBiereService {

  lVuesAchatBiere: Array<VueAchat>;
  lVuesAchatBiere$: BehaviorSubject<Array<VueAchat>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
  this.lVuesAchatBiere = Array(0);
  this.lVuesAchatBiere$ = new BehaviorSubject<Array<VueAchat>>(this.lVuesAchatBiere);
  }

  get(){
    if(this.authSrv.isAdmin()){
      this.getAll();
    }
    else{
      this.getAllOneOrga();
    }
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<VueAchat[]>(
      this.util.apiVuesAchatsBiere,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );

    result.subscribe(
      (value) => {
        this.lVuesAchatBiere = value;
        this.lVuesAchatBiere$.next(this.lVuesAchatBiere);
      }
    )
  }

  getAllOneOrga(){
    const token = this.authSrv.getUser().id_token;
    let id = this.authSrv.getUserOrgId();

    var result = this.http.get<VueAchat[]>(
      this.util.apiVuesAchatsBiere+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );

    result.subscribe(
      (value) => {
        this.lVuesAchatBiere = value;
        this.lVuesAchatBiere$.next(this.lVuesAchatBiere);
      }
    )
  }





}
