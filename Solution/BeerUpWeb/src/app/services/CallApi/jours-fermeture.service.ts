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
      this.util.apiHoraires+id,
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
    
  }
}
