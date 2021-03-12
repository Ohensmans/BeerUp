import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { VueAchat } from 'src/app/models/vue-achat';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class VuesAchatEtabService {

  lVuesAchatEtab: Array<VueAchat>;
  lVuesAchatEtab$: BehaviorSubject<Array<VueAchat>>;

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
  this.lVuesAchatEtab = Array(0);
  this.lVuesAchatEtab$ = new BehaviorSubject<Array<VueAchat>>(this.lVuesAchatEtab);
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
      this.util.apiVuesAchatsEtab,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );

    result.subscribe(
      (value) => {
        this.lVuesAchatEtab = value;
        this.lVuesAchatEtab$.next(this.lVuesAchatEtab);
      }
    )
  }

  getAllOneOrga(){
    const token = this.authSrv.getUser().id_token;
    let id = this.authSrv.getUserOrgId();

    var result = this.http.get<VueAchat[]>(
      this.util.apiVuesAchatsEtab+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );

    result.subscribe(
      (value) => {
        this.lVuesAchatEtab = value;
        this.lVuesAchatEtab$.next(this.lVuesAchatEtab);
      }
    )
  }

}
