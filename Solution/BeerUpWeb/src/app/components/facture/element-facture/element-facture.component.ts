import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { FactureModele } from 'src/app/models/facture-modele';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
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
  subscri:Subscription;
  orgNom:string;
  formattedDate:string;

  constructor(private factureSrv:FacturesService, private authSrv:AuthentificationService) { 
    this.factureContent = Array(0);
    this.lAchatBiere = Array(0);
    this.lAchatEtab = Array(0);
    this.lOrganisations = Array(0);
    this.solde = 0;
    this.factureId=0;
    this.facture = new FactureModele();
    this.subscri = new Subscription();
    this.orgNom = "";
    this.formattedDate = "";
  }

  //récupère le solde et le nom des orga
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
    this.subscri.add(this.factureSrv.getOne(this.factureId).subscribe(
      (value) => {
        this.facture = value;
        if(this.facture.facMotif!=null && this.facture.facMotif!=""){
          this.solde = 0;
        }
        let index = this.lOrganisations.findIndex(o => o.orgId == this.factureContent[0].orgId)
        if(index!=-1){
          this.orgNom = this.lOrganisations[index].orgNom;
        }      
      }
    ));

    this.dateFormat();

    
    
  }

  getClass(){
    if (this.solde==0) return "bg-success text-white";
    else return "";
  }

  onDestroy(){
    this.subscri.unsubscribe();
  }

  isAdmin(){
    return this.authSrv.isAdmin();
  }

  //met en forme la date
  dateFormat(){
    let pipe = new DatePipe('en-US');
    let formattedDate = pipe.transform(this.facture.facDate, 'dd/MM/yyyy');
    if(formattedDate !=null){
      this.formattedDate = formattedDate;
    }
  }


}
