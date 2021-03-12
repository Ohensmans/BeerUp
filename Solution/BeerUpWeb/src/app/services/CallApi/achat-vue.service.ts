import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { AchatVuesModele } from 'src/app/models/achat-vues-modele';

@Injectable({
  providedIn: 'root'
})
export class AchatVueService {

  lAchatBiere: Array<AchatVuesModele>;
  lAchatBiere$: BehaviorSubject<Array<AchatVuesModele>>;
  lAchatEtab: Array<AchatVuesModele>;
  lAchatEtab$: BehaviorSubject<Array<AchatVuesModele>>;
  solde:number;
  solde$:BehaviorSubject<number>;

  constructor() { 
    this.lAchatBiere = Array(0);
    this.lAchatBiere$ = new BehaviorSubject<Array<AchatVuesModele>>(this.lAchatBiere);
    this.lAchatEtab = Array(0);
    this.lAchatEtab$ = new BehaviorSubject<Array<AchatVuesModele>>(this.lAchatEtab);
    this.solde = 0;
    this.solde$ = new BehaviorSubject<number>(this.solde);
  }

  addAchatBiere(){
    this.lAchatBiere.push(new AchatVuesModele());
    this.lAchatBiere$.next(this.lAchatBiere);
  }

  addAchatEtab(){
    this.lAchatEtab.push(new AchatVuesModele());
    this.lAchatEtab$.next(this.lAchatEtab);
  }

  updateAchatBiere(achat:AchatVuesModele){
    let index = this.lAchatBiere.findIndex(v => v.achId == achat.achId);
    if(index!=-1){
      this.lAchatBiere[index] = achat;
      this.lAchatBiere$.next(this.lAchatBiere);
      this.getSolde();
    }
  }

  updateAchatEtab(achat:AchatVuesModele){
    let index = this.lAchatEtab.findIndex(v => v.achId == achat.achId);
    if(index!=-1){
      this.lAchatEtab[index] = achat;
      this.lAchatEtab$.next(this.lAchatEtab);
      this.getSolde();
    }
  }

  deleteAchatBiere(achat:AchatVuesModele){
    let index = this.lAchatBiere.findIndex(v => v.achId == achat.achId);
    if(index!=-1){
      this.lAchatBiere = this.lAchatBiere.splice(index, 1);
      this.lAchatBiere$.next(this.lAchatBiere);
      this.getSolde();
    }
  }

  deleteAchatEtab(achat:AchatVuesModele){
    let index = this.lAchatEtab.findIndex(v => v.achId == achat.achId);
    if(index!=-1){
      this.lAchatEtab = this.lAchatEtab.splice(index, 1);
      this.lAchatEtab$.next(this.lAchatEtab);
      this.getSolde();
    }
  }

  getSolde(){
    this.solde = 0;
    this.lAchatEtab.forEach(element => {
      if(!element.isNew){
        this.solde = this.solde + element.prix;
      }
    });
    this.lAchatBiere.forEach(element => {
      if(!element.isNew){
        this.solde = this.solde + element.prix;
      }
    });
    this.solde$.next(this.solde);
  }

}
