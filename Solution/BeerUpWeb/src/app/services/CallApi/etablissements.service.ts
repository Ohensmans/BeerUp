import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BehaviorSubject } from "rxjs";
import { EtablissementModele } from "src/app/models/etablissement-modele";
import { AuthentificationService } from "../authentification.service";
import { UtilService } from "../util.service";
import { GetDeletablesEtabsService } from "./get-deletables-etabs.service";

  @Injectable({
    providedIn: 'root'
  })

  export class EtablissementsService {
  
    lEtablissement: Array<EtablissementModele>;
    lEtablissement$: BehaviorSubject<Array<EtablissementModele>>;
    
    constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, private DelEtasSrv:GetDeletablesEtabsService) { 
      this.lEtablissement = Array(0);
      this.lEtablissement$ = new BehaviorSubject<Array<EtablissementModele>>(this.lEtablissement);
    }

    getDeletablesEtab(){

      let result = this.DelEtasSrv.getAll().subscribe(
        (value) =>{
          //assigne true aux éléments de la liste tarifs qui sont dans la liste des deletables
          value.forEach(element =>{
            let index = this.lEtablissement.findIndex(x => x.etaId == element.etaId)
            if (index!=-1){
              this.lEtablissement[index].isDeletable = true;
            }
          });
          this.lEtablissement$.next(this.lEtablissement);
        }
      );  
    }
  
    getAll(){
      const token = this.authSrv.getUser().id_token;
  
      var result = this.http.get<EtablissementModele[]>(
        this.util.apiEtablissementsUrl,
        { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
      );
      result.subscribe(
        (value) => {
          this.lEtablissement = value;
          this.getDeletablesEtab();
        }
      )
    }
  
    getOne(id:string){
      const token = this.authSrv.getUser().id_token;
  
      let result = this.http.get<EtablissementModele>(
        this.util.apiEtablissementsUrl+id,
        { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
      );
      return result;
    }
  
    addEtab(etab:EtablissementModele){
      const token:string = this.authSrv.getUser().id_token;
  
      this.http.post<EtablissementModele>(
        this.util.apiEtablissementsUrl, etab,
        { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
      ).subscribe(
        (value) => {
          this.lEtablissement.push(value);
          this.lEtablissement$.next(this.lEtablissement)
        }
      );
    }
  
    deleteEtab(id:string){
      const token:string = this.authSrv.getUser().id_token;
  
    this.http.delete<string>(
        this.util.apiEtablissementsUrl+id,
        { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
      ).subscribe(
        () => {
          let index = this.lEtablissement.findIndex(x => x.etaId == id);
          this.lEtablissement.splice(index,1);
          this.lEtablissement$.next(this.lEtablissement);
        }
      )
    }
  
    updateEtab(etab:EtablissementModele, id:string){
      const token:string = this.authSrv.getUser().id_token;
  
      this.http.put<EtablissementModele>(
        this.util.apiEtablissementsUrl+id,etab,
        { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
      ).subscribe(
        () => {
          let index = this.lEtablissement.findIndex(x => x.etaId == id);
          this.lEtablissement[index] = etab;
          this.lEtablissement$.next(this.lEtablissement);
        }
      )
    }
  }
  