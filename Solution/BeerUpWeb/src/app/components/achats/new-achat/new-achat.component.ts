import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { AchatVuesModele } from 'src/app/models/achat-vues-modele';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AchatVueService } from 'src/app/services/CallApi/achat-vue.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { VuesAchatBiereService } from 'src/app/services/CallApi/vues-achat-biere.service';
import { VuesAchatEtabService } from 'src/app/services/CallApi/vues-achat-etab.service';

@Component({
  selector: 'app-new-achat',
  templateUrl: './new-achat.component.html',
  styleUrls: ['./new-achat.component.css']
})
export class NewAchatComponent implements OnInit {

  lBiere:Array<BiereModele>;
  lEtab:Array<EtablissementModele>;
  lTarifBiere:Array<TarifModele>;
  lTarifEtab:Array<TarifModele>;
  lAchatEtab:Array<AchatVuesModele>;
  lAchatBiere:Array<AchatVuesModele>;
  solde:number;

  subscr:Subscription;

  constructor(private biereSrv:BieresService, private biereOrgaSrv:BieresOrgaService, private etabSrv:EtablissementsService,
    private etabOrgaSrv:EtabsOrgaService, private tarifBiereSrv : TarifsBieresService, private tarifEtabSrv : TarifsEtabsService,
    private vueAchatBiereSrv : VuesAchatBiereService, private vueAchatEtabSrv : VuesAchatEtabService, 
    private authSrv : AuthentificationService, private achatVueSrv:AchatVueService, private toastr:ToastrService) {
      this.lBiere = Array(0);
      this.lEtab = Array(0);
      this.lTarifBiere = Array(0);
      this.lTarifEtab = Array(0);
      this.lAchatEtab = Array(0);
      this.lAchatBiere = Array(0);
      this.subscr = new Subscription();
      this.solde = 0;
   }

  ngOnInit(): void {

    this.subscr.add(this.achatVueSrv.solde$.subscribe(
      (value)=>{
        this.solde = value;
      }
    ));

    this.subscr.add(this.achatVueSrv.lAchatBiere$.subscribe(
      (value)=>{
        this.lAchatBiere = value;
      }
    ));

    this.subscr.add(this.achatVueSrv.lAchatEtab$.subscribe(
      (value)=> {
        this.lAchatEtab = value;
      }
    ));

    //in case of Admin
    if(this.authSrv.isAdmin()){
      this.subscr.add(this.biereSrv.lBiere$.subscribe(
        (value) => {
          this.lBiere = value;
          this.getVuesRestantesBiere();
          this.getTarifsBiere();
        }
      ));
      this.subscr.add(this.etabSrv.lEtablissement$.subscribe(
        (value) => {
          this.lEtab = value;
          this.getVuesRestantesEtab();
          this.getTarifsEtab();
        }
      ));
    this.biereSrv.getAll();
    this.etabSrv.getAll();
    }

    //in case of customer
    else{
      this.subscr.add(this.biereOrgaSrv.lAllowedBieresOrga$.subscribe(
        (value) => {
          this.lBiere = value;
          this.getVuesRestantesBiere();
          this.getTarifsBiere();
        }
      ));
      
      this.subscr.add(this.etabOrgaSrv.lAllowedEtabsOrga$.subscribe(
        (value) => {
          this.lEtab = value;
          this.getVuesRestantesEtab();
          this.getTarifsEtab();
        }
      ));
      this.biereOrgaSrv.getAll(this.authSrv.getUserOrgId(), true);
      this.etabOrgaSrv.getAll(true);
    }

    
    

  }

  getVuesRestantesBiere(){
    this.subscr.add(this.vueAchatBiereSrv.lVuesAchatBiere$.subscribe(
      (value) => {
         value.forEach(element => {
            let index = this.lBiere.findIndex(x => x.bieId == element.id)
            if(index !=-1){
              this.lBiere[index].bieNbVuesRestantes = element.nbVuesAch - element.nbVu;
            }
          });
          this.lBiere.forEach(element => {
            if(element.bieNbVuesRestantes==null){
              element.bieNbVuesRestantes = 0;
            }
          });
      }
    ));
    this.vueAchatBiereSrv.get();
  }

  getVuesRestantesEtab(){
    this.subscr.add(this.vueAchatEtabSrv.lVuesAchatEtab$.subscribe(
      (value) => {
         value.forEach(element => {
          let index = this.lEtab.findIndex(x => x.etaId == element.id)
          if(index !=-1){
            this.lEtab[index].etaNbVuesRestantes = element.nbVuesAch - element.nbVu;
          }
        });
        this.lEtab.forEach(element => {
          if(element.etaNbVuesRestantes==null){
            element.etaNbVuesRestantes = 0;
          }
        });
      }
    ));
    this.vueAchatEtabSrv.get();
  }

  isAdmin(){}

  getTarifsBiere(){
    this.subscr.add(this.tarifBiereSrv.lTarifsBiere$.subscribe(
      (value) => {
        this.lTarifBiere = new Array<TarifModele>();
        let today = new Date().toISOString();
        value.forEach(element => {
          if(element.actif && element.dateDebut.toString()<=today && element.dateFin.toString()>=today){
            this.lTarifBiere.push(element);
          }
        });
      }
    ));

    this.tarifBiereSrv.getAll();
  }


  getTarifsEtab(){
    this.subscr.add(this.tarifEtabSrv.lTarifsEtabs$.subscribe(
      (value) => {
        this.lTarifEtab = new Array<TarifModele>();
        let today = new Date().toISOString();
        value.forEach(element => {
          if(element.actif && element.dateDebut.toString()<=today && element.dateFin.toString()>=today){
            this.lTarifEtab.push(element);
          }
        });
      }
    ));
    this.tarifEtabSrv.getAll();
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }


  addVueBiere(){
    let index = this.lAchatBiere.findIndex(a => a.isNew)
    if(index!=-1){
      this.infoToastr("Veuillez ajouter l'achat de vue pour bière en cours avant d'en créer un nouveau")
    }
    else{
      this.achatVueSrv.addAchatBiere();
    }
  }

  addVueEtab(){
    let index = this.lAchatEtab.findIndex(a => a.isNew)
    if(index!=-1){
      this.infoToastr("Veuillez ajouter l'achat de vue pour établissement en cours avant d'en créer un nouveau")
    }
    else{
      this.achatVueSrv.addAchatEtab();
    }
  }

  infoToastr(message:string)
  {
    this.toastr.info(message, "Information");
  }



  preparePayment(){}

}
