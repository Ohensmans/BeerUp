import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { JourFermetureModele } from 'src/app/models/jour-fermeture-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class JoursFermetureService {
  
  lJours: Array<JourFermetureModele>;
  lJours$: BehaviorSubject<Array<JourFermetureModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lJours = Array(0);
    this.lJours$ = new BehaviorSubject<Array<JourFermetureModele>>(this.lJours);
  }


  getAllJoursEtab(id:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<JourFermetureModele[]>(
      this.util.apiJoursFermetureUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lJours = value;
        this.lJours$.next(this.lJours);
      }
    )
  }

  addNewJour(){
      this.lJours.push(new JourFermetureModele());
      this.lJours$.next(this.lJours);
  }

  addJour(jour:JourFermetureModele){
    const token:string = this.authSrv.getUser().id_token;

    this.http.post<JourFermetureModele>(
      this.util.apiJoursFermetureUrl, jour,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      (value) => {
        let index = this.lJours.findIndex(x => x.etaId == "")
        this.lJours[index] =  value;
        this.lJours$.next(this.lJours);
      }
    );
  }

  deleteJour(id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.delete<string>(
      this.util.apiJoursFermetureUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        this.deleteJourObs(id);
      });
  }

  deleteJourObs(id:string){
    let index = this.lJours.findIndex(x => x.jouId == id)
    if(this.lJours.length>1){
      this.lJours.splice(index,1);
    }
    else{
      this.lJours = new Array<JourFermetureModele>();
    }
    this.lJours$.next(this.lJours);
  }

  updateJour(jour:JourFermetureModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<JourFermetureModele>(
      this.util.apiJoursFermetureUrl+id,jour,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lJours.findIndex(x => x.jouId == id);
        this.lJours[index] = jour;
        this.lJours$.next(this.lJours);
      }
    )
  }
}
