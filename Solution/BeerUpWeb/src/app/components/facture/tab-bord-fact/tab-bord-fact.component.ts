import { Component, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { Subscription } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AchatFactureService } from 'src/app/services/CallApi/achat-facture.service';
import { OrganisationsService } from 'src/app/services/CallApi/organisations.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-fact',
  templateUrl: './tab-bord-fact.component.html',
  styleUrls: ['./tab-bord-fact.component.css']
})
export class TabBordFactComponent implements OnInit {

  subscr:Subscription;
  lTotalAchats: Array<AchatFacture>;
  lTotalParFacture: Array<Array<AchatFacture>>;
  lTotalParFacturePagination: Array<Array<AchatFacture>>;
  orgId:string;
  lOrganisations:Array<OrganisationModele>;
  nextText:string;
  previousText:string;
  itemsPerPage:number;
  

  constructor(private achatFactureSrv:AchatFactureService, private authSrv:AuthentificationService, private orgSrv:OrganisationsService,
    private util :UtilService) {
    this.subscr = new Subscription();
    this.lTotalAchats = Array(0);
    this.lTotalParFacture = Array(0);
    this.lTotalParFacturePagination = Array(0);
    this.orgId = "";
    this.lOrganisations = Array(0);
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
   }

  ngOnInit(): void {
    this.subscr.add(this.achatFactureSrv.lAchatsFacture$.subscribe(
      (value)=> {
        this.lTotalAchats = value;
        this.getListesParFacture();
      }
    ));

    this.subscr.add(this.orgSrv.lOrganisation$.subscribe(
      (value) => {
        this.lOrganisations = value;
      }
    ))
    this.orgSrv.getAll();

    if(this.authSrv.isAdmin()){
      this.achatFactureSrv.getAll();
    }
    else{
      this.achatFactureSrv.getAllOrga(this.authSrv.getUserOrgId());
    }

    
  }

  getListesParFacture(){
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
    this.lTotalParFacturePagination = this.lTotalParFacture.slice(0, this.itemsPerPage);
  }

  selectOrga(orgId:string){
    this.orgId = orgId;
    if(orgId!=""){
      this.achatFactureSrv.getAllOrga(this.orgId);
    }
    else{
      this.achatFactureSrv.getAll();
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
