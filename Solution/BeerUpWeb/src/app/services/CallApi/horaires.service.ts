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
      this.util.apiHorairesUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lHoraire = value;
        this.lHoraire$.next(this.lHoraire);
      }
    )
  }

  addNewHoraire(){
    this.lHoraire.push(new HoraireModele());
    this.lHoraire$.next(this.lHoraire);
  }

  addHoraire(horaire:HoraireModele){
    const token:string = this.authSrv.getUser().id_token;

    this.http.post<HoraireModele>(
      this.util.apiHorairesUrl, horaire,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      (value) => {
        let index = this.lHoraire.findIndex(x => x.horId == "")
        this.lHoraire[index] =  value;
        this.lHoraire$.next(this.lHoraire);
      }
    );
  }

  deleteHoraire(id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.delete<string>(
      this.util.apiHorairesUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        this.deleteHoraireObs(id);
      });
  }

  deleteHoraireObs(id:string){
    let index = this.lHoraire.findIndex(x => x.horId == id)
    if(this.lHoraire.length>1){
      this.lHoraire.splice(index,1);
    }
    else{
      this.lHoraire = new Array<HoraireModele>();
    }
    this.lHoraire$.next(this.lHoraire);
  }

  updateHoraire(horaire:HoraireModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<HoraireModele>(
      this.util.apiHorairesUrl+id,horaire,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lHoraire.findIndex(x => x.horId == id);
        this.lHoraire[index] = horaire;
        this.lHoraire$.next(this.lHoraire);
      }
    )
  }
   
}
