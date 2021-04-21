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

  lAllEtabsOrga: Array<EtablissementModele>;
  lAllEtabsOrga$: BehaviorSubject<Array<EtablissementModele>>;
  
  lAllowedEtabsOrga: Array<EtablissementModele>;
  lAllowedEtabsOrga$: BehaviorSubject<Array<EtablissementModele>>;


  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, private DelEtasSrv:GetDeletablesEtabsService) { 
    this.lAllEtabsOrga = Array(0);
    this.lAllEtabsOrga$ = new BehaviorSubject<Array<EtablissementModele>>(this.lAllEtabsOrga);

    this.lAllowedEtabsOrga = Array(0);
    this.lAllowedEtabsOrga$ = new BehaviorSubject<Array<EtablissementModele>>(this.lAllowedEtabsOrga);
  }

  getDeletablesEtab(){

    let result = this.DelEtasSrv.getOneOrga().subscribe(
      (value) =>{
        //assigne true aux éléments de la liste tarifs qui sont dans la liste des deletables
        value.forEach(element =>{
          let index = this.lAllEtabsOrga.findIndex(x => x.etaId == element.etaId)
          if (index!=-1){
            this.lAllEtabsOrga[index].isDeletable = true;
          }

          index = this.lAllowedEtabsOrga.findIndex(x => x.etaId == element.etaId)
          if (index!=-1){
            this.lAllowedEtabsOrga[index].isDeletable = true;
          }
        });
        this.lAllEtabsOrga$.next(this.lAllEtabsOrga);
        this.lAllowedEtabsOrga$.next(this.lAllowedEtabsOrga);
      }
    );  
  }

  getAllowedEtab(lEtab : Array<EtablissementModele>, achat : boolean){
    let lAllowEtab : Array<string>;
    this.lAllowedEtabsOrga = Array(0);
    if(achat){
      lAllowEtab = this.authSrv.getUserGroupAchatEtab();
    }
    else{
      lAllowEtab = this.authSrv.getUserGroupEtabEtab();
    }
    if(this.authSrv.isAdminOrGroupAdmin()){
      this.lAllowedEtabsOrga = lEtab;
    }
    
    else if(lAllowEtab!=null && lAllowEtab[0]!="All"){
      if(Array.isArray(lAllowEtab)){
      lAllowEtab.forEach(element => {
        let index = lEtab.findIndex(x => x.etaId == element)
        if (index!=-1){
         this.lAllowedEtabsOrga.push(lEtab[index]);
        }
      });
    }
      else{
        let aloneEtaId = lAllowEtab;
        let index = lEtab.findIndex(x => x.etaId == aloneEtaId)
        if (index!=-1){
         this.lAllowedEtabsOrga.push(lEtab[index]);
        }
      }
    }
    
  }

  getAll(achat:boolean, orgId:string){
    const token = this.authSrv.getUser().id_token;
    

    var result = this.http.get<EtablissementModele[]>(
      this.util.apiEtabsOrgaUrl+orgId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAllEtabsOrga = value;
        this.getAllowedEtab(value, achat);
        this.getDeletablesEtab();
      }
    )
  }
  
}
