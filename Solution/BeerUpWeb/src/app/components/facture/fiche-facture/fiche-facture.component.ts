import { getLocaleWeekEndRange } from '@angular/common';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import jsPDF from 'jspdf';
import { Subscription } from 'rxjs';
import { AchatFacture } from 'src/app/models/achat-facture';
import { AdresseFacturationModele } from 'src/app/models/adresse-facturation-modele';
import { FactureModele } from 'src/app/models/facture-modele';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AchatFactureService } from 'src/app/services/CallApi/achat-facture.service';
import { AdressesFacturationService } from 'src/app/services/CallApi/adresses-facturation.service';
import { FacturesService } from 'src/app/services/CallApi/factures.service';
import { OrganisationsService } from 'src/app/services/CallApi/organisations.service';
import { UtilService } from 'src/app/services/util.service';
import html2canvas from 'html2canvas';

@Component({
  selector: 'app-fiche-facture',
  templateUrl: './fiche-facture.component.html',
  styleUrls: ['./fiche-facture.component.css']
})
export class FicheFactureComponent implements OnInit {

  @ViewChild('htmlData') htmlData:ElementRef | undefined;

  id:number;
  facture:FactureModele;
  adresseNom:string;
  adresseRue:string;
  adresseVille:string;
  adressePays:string;
  numeroTVA:string;
  organisation:OrganisationModele;
  adresseFact:AdresseFacturationModele;
  lAchatEtab:Array<AchatFacture>;
  lAchatBiere:Array<AchatFacture>;
  lTotalAchats: Array<AchatFacture>;
  solde:number;
  soldeHtva:number;
  soldeTva:number;
  TVA:number;
  subscr:Subscription;


  constructor(private route:ActivatedRoute, private util :UtilService, private factSrv :FacturesService, private adrSrv : AdressesFacturationService,
    private achatFactureSrv:AchatFactureService, private orgaSrv:OrganisationsService) { 
    this.adresseNom = this.util.adresseNom;
    this.adresseRue = this.util.adresseRue;
    this.adresseVille = this.util.adresseVille;
    this.adressePays = this.util.adressePays;
    this.numeroTVA = this.util.numeroTVA;
    this.organisation = new OrganisationModele();
    this.adresseFact = new AdresseFacturationModele();
    this.lAchatEtab = new Array(0);
    this.lAchatBiere = new Array(0);
    this.lTotalAchats = new Array(0);
    this.solde = 0 ;
    this.soldeHtva = 0;
    this.soldeTva = 0;
    this.TVA = this.util.TVA;
    this.facture = new FactureModele();
    this.id = 0;
    this.subscr = new Subscription();
  }


  ngOnInit(): void {
    this.id = this.route.snapshot.params['id'];
    if(this.id!=0){
      this.subscr.add(this.factSrv.getOne(this.id).subscribe(
        (value) => {
          this.facture = value;
          this.getAdresse();
          this.getListTotalAchats();
        }
      ));
    }
    
  }

  getOrga(orgId:string){
    this.subscr.add(this.orgaSrv.getOne(orgId).subscribe(
      (value)=>{
        this.organisation = value;
      }
    ));
  }

  getListTotalAchats(){
    this.subscr.add(this.achatFactureSrv.lAchatsFacture$.subscribe(
      (value)=> {
        this.lTotalAchats = value;
        this.getListesParType();
      }
    ));
    this.achatFactureSrv.getAllParFacture(this.id);
  }

  getListesParType(){
    this.lTotalAchats.forEach(element => {
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
    this.getSoldes();
  }

  getSoldes(){
    this.soldeTva = this.solde*(this.TVA/100);
    this.soldeHtva = this.solde - this.soldeHtva;
  }

  getAdresse(){
    this.subscr.add(this.adrSrv.getOne(this.facture.facId).subscribe(
      (value) =>{
        this.adresseFact = value;
        this.getOrga(this.adresseFact.orgId);
      }
    ));
  }


  createPdf(): void {
    let DATA = document.getElementById('htmlData');
    if(DATA!=null)
    html2canvas(DATA).then(canvas => {
        
        let fileWidth = 208;
        let fileHeight = canvas.height * fileWidth / canvas.width;
        
        const FILEURI = canvas.toDataURL('image/png')
        let PDF = new jsPDF('p', 'mm', 'a4');
        let position = 0;
        PDF.addImage(FILEURI, 'PNG', 0, position, fileWidth, fileHeight)
        
        PDF.save('facture'+this.facture.facId+'.pdf');
    });  
  }   

}
