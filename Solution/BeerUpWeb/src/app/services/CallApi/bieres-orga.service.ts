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

  deleteBiere(id:string){
    const token:string = this.authSrv.getUser().id_token;

  this.http.delete<string>(
      this.util.apiBieresUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lAllowedBieresOrga.findIndex(x => x.bieId == id);
        if(this.lAllowedBieresOrga.length>1){
        this.lAllowedBieresOrga.splice(index,1);
        }
        else{
          this.lAllowedBieresOrga = new Array<BiereModele>();
        }
        this.lAllowedBieresOrga$.next(this.lAllowedBieresOrga);
      }
    )
  }

  getAllowedBiere(lBiere : Array<BiereModele>, achat : boolean){
    let lAllowBieres : Array<string>;
    this.lAllowedBieresOrga = Array(0);
    if(achat){
      lAllowBieres = this.authSrv.getUserGroupAchatBieres();
    }
    else{
      lAllowBieres = this.authSrv.getUserGroupBiereBieres();
    }

    if(this.authSrv.isAdminOrGroupAdmin()){
      this.lAllowedBieresOrga = lBiere;
    }
    
    else if(lAllowBieres!=null){
      if(Array.isArray(lAllowBieres)){
      lAllowBieres.forEach(element => {
        let index = lBiere.findIndex(x => x.bieId == element)
        if (index!=-1){
         this.lAllowedBieresOrga.push(lBiere[index]);
        }
      });
    }
    else{
      if(lAllowBieres!="All"){
      let aloneBieId = lAllowBieres;
      let index = lBiere.findIndex(x => x.bieId == aloneBieId)
      if (index!=-1){
       this.lAllowedBieresOrga.push(lBiere[index]);
      }}
      else{
        this.lAllowedBieresOrga = lBiere;
      }
    }
    }
    
  }

  getAll(OrgId:string, achat :boolean){
    const token = this.authSrv.getUser().id_token;
    let id;
    if(this.authSrv.isAdmin()){
      id = OrgId;
     }
     else{
      id = this.authSrv.getUserOrgId();
     }

    var result = this.http.get<BiereModele[]>(
      this.util.apiBieresOrgaUrl+id+","+achat,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lAllBieresOrga = value;
        this.getAllowedBiere(value, achat);
        this.getDeletablesBieres();
      }
    )
  }
}
