import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { HoraireModele } from 'src/app/models/horaire-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class HorairesService {

  lHoraire: Array<HoraireModele>;
  lHoraire$: BehaviorSubject<Array<HoraireModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lHoraire = Array(0);
    this.lHoraire$ = new BehaviorSubject<Array<HoraireModele>>(this.lHoraire);
  }


  getAllHorairesEtab(id:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<HoraireModele[]>(
      this.util.apiHoraires+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lHoraire = value;
        this.lHoraire$.next(this.lHoraire);
      }
    )
  }

  addNewHoraire(){}
   
}
