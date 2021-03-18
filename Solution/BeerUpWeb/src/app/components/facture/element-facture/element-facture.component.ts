import { Component, Input, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { AchatVuesModele } from 'src/app/models/achat-vues-modele';
import { FactureModele } from 'src/app/models/facture-modele';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AchatFactureService } from 'src/app/services/CallApi/achat-facture.service';
import { FacturesService } from 'src/app/services/CallApi/factures.service';

@Component({
  selector: 'app-element-facture',
  templateUrl: './element-facture.component.html',
  styleUrls: ['./element-facture.component.css']
})
export class ElementFactureComponent implements OnInit {

  @Input() factureContent:Array<AchatFacture>;
  @Input() lOrganisations:Array<OrganisationModele>;
  lAchatEtab:Array<AchatFacture>;
  lAchatBiere:Array<AchatFacture>
  solde:number;
  factureId:number;
  facture:FactureModele;
  subscr:Subscription;
  orgNom:string;

  constructor(private factureSrv:FacturesService, private authSrv:AuthentificationService) { 
    this.factureContent = Array(0);
    this.lAchatBiere = Array(0);
    this.lAchatEtab = Array(0);
    this.lOrganisations = Array(0);
    this.solde = 0;
    this.factureId=0;
    this.facture = new FactureModele();
    this.subscr = new Subscription();
    this.orgNom = "";
  }

  ngOnInit(): void {
    this.factureContent.forEach(element => {
      if(element.etaNom!=null && element.etaNom!=""){
        this.lAchatEtab.push(element);
        if(element.etaPrix!=undefined)
          this.solde = this.solde + element.etaPrix;
      }
      else{
        this.lAchatBiere.push(element);
        if(element.biePrix!=undefined)
          this.solde = this.solde + element.biePrix;
      }
    });
    this.factureId = this.factureContent[0].facId;
    this.subscr.add(this.factureSrv.getOne(this.factureId).subscribe(
      (value) => {
        this.facture = value;
        let index = this.lOrganisations.findIndex(o => o.orgId == this.factureContent[0].orgId)
        if(index!=-1){
          this.orgNom = this.lOrganisations[index].orgNom;
        }      
      }
    ));
    
  }

  getClass(){
    if (this.solde==0) return "bg-success text-white";
    else return "";
  }

  onDestroy(){
    this.subscr.unsubscribe();
  }

  isAdmin(){
    return this.authSrv.isAdmin();
  }

  export(){}

}
