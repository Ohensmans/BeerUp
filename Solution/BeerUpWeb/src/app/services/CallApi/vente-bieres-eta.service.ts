import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { VenteBiereEtaModele } from 'src/app/models/vente-biere-eta-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class VenteBieresEtaService {

  lVentesBieresEtab: Array<VenteBiereEtaModele>;
  lVentesBieresEtab$: BehaviorSubject<Array<VenteBiereEtaModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lVentesBieresEtab = Array(0);
    this.lVentesBieresEtab$ = new BehaviorSubject<Array<VenteBiereEtaModele>>(this.lVentesBieresEtab);
  }

  getAllVentesBieresParEtab(id:string){
    const token:string = this.authSrv.getUser().id_token;
    var result = this.http.get<VenteBiereEtaModele[]>(
      this.util.apiVentesBieresEtaUrl+id, { headers: new HttpHeaders({ "Authorization": "Bearer " + token })});
    result.subscribe(
      (value) => {
        this.lVentesBieresEtab = value;
        this.lVentesBieresEtab$.next(this.lVentesBieresEtab);
      }
    )
  }

  addNewVente(){
    this.lVentesBieresEtab.push(new VenteBiereEtaModele());
    this.lVentesBieresEtab$.next(this.lVentesBieresEtab);
  }

  addVenteBieresParEtab(vente:VenteBiereEtaModele){
    const token:string = this.authSrv.getUser().id_token;

    this.http.post<VenteBiereEtaModele>(
      this.util.apiVentesBieresEtaUrl, vente,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      (value) => {
        let index = this.lVentesBieresEtab.findIndex(x => x.venteBiereEtaId == '')
        if(index!=1){
          if(this.lVentesBieresEtab.length>1){
            this.lVentesBieresEtab[index] = value;
            }
          else{
            this.lVentesBieresEtab = new Array<VenteBiereEtaModele>();
            this.lVentesBieresEtab.push(value);
            }
          this.lVentesBieresEtab$.next(this.lVentesBieresEtab);
        }
      }
    );
  }

  deleteVenteBieresParEtabObs(id:string){
    let index = this.lVentesBieresEtab.findIndex(x => x.venteBiereEtaId == id)
    if(this.lVentesBieresEtab.length>1){
      this.lVentesBieresEtab.splice(index,1);
    }
    else{
      this.lVentesBieresEtab = new Array<VenteBiereEtaModele>();
    }
    this.lVentesBieresEtab$.next(this.lVentesBieresEtab);
  }

  deleteVenteBieresParEtab(id:string){
    const token:string = this.authSrv.getUser().id_token;

  this.http.delete<string>(
      this.util.apiVentesBieresEtaUrl+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lVentesBieresEtab.findIndex(x => x.typServId == id);
        if(this.lVentesBieresEtab.length>1){
          this.lVentesBieresEtab.splice(index,1);
        }
        else{
          this.lVentesBieresEtab = new Array<VenteBiereEtaModele>();
        }
        this.lVentesBieresEtab$.next(this.lVentesBieresEtab);
      }
    )
  }

  updateVenteBieresParEtab(vente:VenteBiereEtaModele, id:string){
    const token:string = this.authSrv.getUser().id_token;

    this.http.put<VenteBiereEtaModele>(
      this.util.apiVentesBieresEtaUrl+id,vente,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    ).subscribe(
      () => {
        let index = this.lVentesBieresEtab.findIndex(x => x.bieId == id);
        this.lVentesBieresEtab[index] = vente;
        this.lVentesBieresEtab$.next(this.lVentesBieresEtab);
      }
    )
  }
}
