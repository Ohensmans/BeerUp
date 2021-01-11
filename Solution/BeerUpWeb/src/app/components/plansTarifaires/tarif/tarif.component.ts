import { Component, Input} from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tarif',
  templateUrl: './tarif.component.html',
  styleUrls: ['./tarif.component.css']
})

export class TarifComponent {
  
  @Input() tarif:TarifModele;
  @Input() type:string;

  TypeTarifVueUn:string;
  TypeTarifVueDeux:string;

  constructor(private tarifBiere:TarifsBieresService, private tarifEtab:TarifsEtabsService, private util:UtilService) { 
    this.tarif = new TarifModele();
    this.type = "";

    this.TypeTarifVueUn = this.util.TypeTarifVueUn;
    this.TypeTarifVueDeux = this.util.TypeTarifVueDeux;
  }

  activation(){
    //intervertit la valeur "Actif" du tarif
    this.tarif.Actif = !this.tarif.Actif;
    
    //n'enregistre la modification que si il s'agit d'un tarif déjà créé
    if(this.tarif.Id!=""){
      this.sauvegarder();
    }
  }

  sauvegarder(){
    //enregistre les modifications selon le "type" de tarif
    if(this.type == this.TypeTarifVueDeux){
      this.tarifBiere.updateTarif(this.tarif,this.tarif.Id);
    }

    if(this.type == this.TypeTarifVueUn){
      this.tarifEtab.updateTarif(this.tarif, this.tarif.Id);
    }
  }

  creer(){
    //ajoute le tarif selon son "type"
    if(this.type == this.TypeTarifVueDeux){
      this.tarifBiere.addTarif(this.tarif);
    }

    if(this.type == this.TypeTarifVueUn){
      this.tarifEtab.addTarif(this.tarif);
    }
    else{
      console.log("pouet");
    }
  }

  supprimer()
  {
    //suppprime le tarif selon son "type"
    if(this.type == this.TypeTarifVueDeux){
      this.tarifBiere.deleteTarif(this.tarif.Id);
    }

    if(this.type == this.TypeTarifVueUn){
      this.tarifEtab.deleteTarif(this.tarif.Id);
    }
  }


}
