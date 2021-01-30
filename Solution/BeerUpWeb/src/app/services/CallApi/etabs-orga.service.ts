import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Guid } from 'guid-typescript';
import { BehaviorSubject } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';
import { GetDeletablesEtabsService } from './get-deletables-etabs.service';

@Injectable({
  providedIn: 'root'
})
export class EtabsOrgaService {

  lEtabsOrga: Array<EtablissementModele>;
  lEtabsOrga$: BehaviorSubject<Array<EtablissementModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, private DelEtasSrv:GetDeletablesEtabsService) { 
    this.lEtabsOrga = Array(0);
    this.lEtabsOrga$ = new BehaviorSubject<Array<EtablissementModele>>(this.lEtabsOrga);
  }

  getDeletablesEtab(){

    let result = this.DelEtasSrv.getOneOrga().subscribe(
      (value) =>{
        //assigne true aux éléments de la liste tarifs qui sont dans la liste des deletables
        value.forEach(element =>{
          let index = this.lEtabsOrga.findIndex(x => x.etaId == element.etaId)
          if (index!=-1){
            this.lEtabsOrga[index].isDeletable = true;
          }
        });
        this.lEtabsOrga$.next(this.lEtabsOrga);
      }
    );  
  }


  getAll(){
    const token = this.authSrv.getUser().id_token;
    const id = this.authSrv.getUserOrgId();

    var result = this.http.get<EtablissementModele[]>(
      this.util.apiEtabsOrgaUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lEtabsOrga = value;
        this.getDeletablesEtab();
      }
    )
  }
  
}
