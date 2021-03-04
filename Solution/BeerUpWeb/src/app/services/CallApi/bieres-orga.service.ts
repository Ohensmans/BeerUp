import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';
import { GetDeletablesBieresService } from './get-deletables-bieres.service';

@Injectable({
  providedIn: 'root'
})
export class BieresOrgaService {

  lAllBieresOrga: Array<BiereModele>;
  lAllBieresOrga$: BehaviorSubject<Array<BiereModele>>;

  lAllowedBieresOrga:Array<BiereModele>;
  lAllowedBieresOrga$:BehaviorSubject<Array<BiereModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService, private delBiereSrv:GetDeletablesBieresService) { 
    this.lAllBieresOrga = Array(0);
    this.lAllBieresOrga$ = new BehaviorSubject<Array<BiereModele>>(this.lAllBieresOrga);
    this.lAllowedBieresOrga = Array(0);
    this.lAllowedBieresOrga$ = new BehaviorSubject<Array<BiereModele>>(this.lAllowedBieresOrga);
  }

  getDeletablesBieres(){

    let result = this.delBiereSrv.getOneOrga().subscribe(
      (value) =>{
        //assigne true aux éléments de la liste bières qui sont dans la liste des deletables
        value.forEach(element =>{

          let index = this.lAllBieresOrga.findIndex(x => x.bieId== element.bieId)
          if (index!=-1){
            this.lAllBieresOrga[index].isDeletable = true;
          }

          index = this.lAllowedBieresOrga.findIndex(x => x.bieId== element.bieId)
          if (index!=-1){
            this.lAllowedBieresOrga[index].isDeletable = true;
          }
        });
        this.lAllBieresOrga$.next(this.lAllBieresOrga);
        this.lAllowedBieresOrga$.next(this.lAllowedBieresOrga);
      }
    );  
  }

  getAllowedBiere(lBiere : Array<BiereModele>){
    let lAllowBieres : Array<string>;
    lAllowBieres = this.authSrv.getUserGroupBiereBieres();

    
    if(this.authSrv.isAdminOrGroupAdmin()){
      this.lAllowedBieresOrga = lBiere;
    }
    
    else if(lAllowBieres!=null && lAllowBieres[0]!="All"){
      lAllowBieres.forEach(element => {
        let index = lBiere.findIndex(x => x.etaId == element)
        if (index!=-1){
         this.lAllowedBieresOrga.push(lBiere[index]);
        }
      });
    }
    
  }

  getAll(OrgId:string){
    const token = this.authSrv.getUser().id_token;
    let id;
    if(this.authSrv.isAdmin()){
      id = OrgId;
     }
     else{
      id = this.authSrv.getUserOrgId();
     }

    var result = this.http.get<BiereModele[]>(
      this.util.apiBieresOrgaUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAllBieresOrga = value;
        this.getAllowedBiere(value);
        this.getDeletablesBieres();
      }
    )
  }
}
