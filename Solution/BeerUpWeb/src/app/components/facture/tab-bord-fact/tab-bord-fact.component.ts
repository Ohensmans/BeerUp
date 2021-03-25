import { Component, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { Subscription } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AchatFactureBiereService } from 'src/app/services/CallApi/achat-facture-biere.service';
import { AchatFactureEtabService } from 'src/app/services/CallApi/achat-facture-etab.service';
import { OrganisationsService } from 'src/app/services/CallApi/organisations.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-fact',
  templateUrl: './tab-bord-fact.component.html',
  styleUrls: ['./tab-bord-fact.component.css']
})
export class TabBordFactComponent implements OnInit {

  subscr:Subscription;
  lAchatsBiere:Array<AchatFacture>;
  lAchatsEtab:Array<AchatFacture>;
  lTotalAchats: Array<AchatFacture>;
  lTotalParFacture: Array<Array<AchatFacture>>;
  lTotalParFacturePagination: Array<Array<AchatFacture>>;
  orgId:string;
  lOrganisations:Array<OrganisationModele>;
  nextText:string;
  previousText:string;
  itemsPerPage:number;
  

  constructor(private achatBieresFactureSrv:AchatFactureBiereService, private achatEtabFactureSrv:AchatFactureEtabService, 
    private authSrv:AuthentificationService, private orgSrv:OrganisationsService,
    private util :UtilService) {
    this.subscr = new Subscription();
    this.lTotalAchats = Array(0);
    this.lAchatsBiere = Array(0);
    this.lAchatsEtab = Array(0);
    
    this.lTotalParFacture = Array(0);
    this.lTotalParFacturePagination = Array(0);
    this.orgId = "";
    this.lOrganisations = Array(0);
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
   }

   //initialise les abonnements aux observables et lance la requête pour les récupérer dans la DB
   //varie en fonction si Admin ou non
  ngOnInit(): void {
    this.subscr.add(this.achatBieresFactureSrv.lAchatsBieresFacture$.subscribe(
      (value)=> {
        this.lAchatsBiere = value;
        this.getListesParFacture();
      }
    ));

    this.subscr.add(this.achatEtabFactureSrv.lAchatsEtabFacture$.subscribe(
      (value)=>{
        value.forEach(element => {
          this.lAchatsEtab = value;
          this.getListesParFacture();
        });
      }
    ));

    this.subscr.add(this.orgSrv.lOrganisation$.subscribe(
      (value) => {
        this.lOrganisations = value;
      }
    ))
    this.orgSrv.getAll();

    if(this.authSrv.isAdmin()){
      this.achatEtabFactureSrv.getAll();
      this.achatBieresFactureSrv.getAll();
    }
    else{
      this.achatEtabFactureSrv.getAllOrga(this.authSrv.getUserOrgId());
      this.achatBieresFactureSrv.getAllOrga(this.authSrv.getUserOrgId());
    }

    
  }

  //redistribue les achats par facture
  getListesParFacture(){
    this.lTotalAchats = this.lAchatsBiere;

    this.lAchatsEtab.forEach(element =>{
      this.lTotalAchats.push(element);
    });
    this.lTotalParFacture = Array(0);
    this.lTotalAchats.forEach(element => {
      let existAList = false;
      
      this.lTotalParFacture.forEach(facture => {
        let index = facture.findIndex(f => f.facId == element.facId);
        if(index!=-1){
          facture.push(element);
          existAList = true;
        }
      });
      if(!existAList){
        let newList = new Array<AchatFacture>();
        newList.push(element);
        this.lTotalParFacture.push(newList);
      }
    });
    this.lTotalParFacture.sort((a,b)=> b[0].facId - a[0].facId)
    this.lTotalParFacturePagination = this.lTotalParFacture.slice(0, this.itemsPerPage);
  }

  //gestion d'event lors de la sélection d'une organisation par l'Admin
  selectOrga(orgId:string){
    this.lTotalAchats = Array(0);
    this.orgId = orgId;
    if(orgId!=""&& orgId!="all"){
      this.achatEtabFactureSrv.getAllOrga(this.orgId);
      this.achatBieresFactureSrv.getAllOrga(this.orgId);
    }
    else{
      this.achatEtabFactureSrv.getAll();
      this.achatBieresFactureSrv.getAll();
    }
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

  isAdmin(){
    return this.authSrv.isAdmin();
  }

  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.lTotalParFacturePagination = this.lTotalParFacture.slice(startItem, endItem);
  }


}
