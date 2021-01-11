import { Component, Input, OnInit} from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { UtilService } from 'src/app/services/util.service';
import { FormBuilder, FormGroup, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { formatDate } from '@angular/common';
import { Guid } from "guid-typescript";

@Component({
  selector: 'app-tarif',
  templateUrl: './tarif.component.html',
  styleUrls: ['./tarif.component.css']

})

export class TarifComponent implements OnInit {
  
  @Input() tarif!:TarifModele;
  @Input() type!:string;

  tarifForm: FormGroup;
  TypeTarifVueUn:string;
  TypeTarifVueDeux:string;
  emptyGuid:Guid;
  isNew:boolean;

  constructor(private tarifBiere:TarifsBieresService, private tarifEtab:TarifsEtabsService, private util:UtilService, private formBuilder:FormBuilder, private router:Router) { 

    this.TypeTarifVueUn = this.util.TypeTarifVueUn;
    this.TypeTarifVueDeux = this.util.TypeTarifVueDeux;
    this.tarif = new TarifModele();
    this.type = "";
    this.tarifForm = new FormGroup({
      nbVue: new FormControl(''),
      prix: new FormControl(''),
      dateDebut: new FormControl(''),
      dateFin: new FormControl(''),
    })
    this.emptyGuid = Guid.createEmpty();
    this.isNew = true;

  }

  ngOnInit():void{

    this.tarifForm = this.formBuilder.group({
      nbVue: [this.tarif.nbVue],
      prix: [this.tarif.prix],
      dateDebut: [formatDate(this.tarif.dateDebut, 'yyyy-MM-dd', 'en')],
      dateFin: [formatDate(this.tarif.dateFin, 'yyyy-MM-dd', 'en')]
      });
    if(this.tarif.id.equals(this.emptyGuid)){
      this.isNew = false;
    }
  }

  getIsNew()
  {
    return this.isNew;
  }

  activation(){
    //n'enregistre la modification que si il s'agit d'un tarif déjà créé
    if(this.tarif.id.equals(this.emptyGuid)){
      //intervertit la valeur "Actif" du tarif
      this.tarif.actif = !this.tarif.actif;
      this.sauvegarder(this.tarif);
    }
  }

  onSubmitForm(){
    let tar = new TarifModele();
    tar.nbVue = +this.tarifForm.value.nbVue;
    tar.prix = +this.tarifForm.value.prix;
    tar.dateDebut = this.tarifForm.value.dateDebut;
    tar.dateFin = this.tarifForm.value.dateFin;
    tar.id = this.tarif.id;

    if(!this.tarif.id.equals(this.emptyGuid))
    {
      this.sauvegarder(tar);
    }
    else
    {
      this.creer(tar);
    }
  }

  sauvegarder(tarif:TarifModele){
    //enregistre les modifications selon le "type" de tarif
    if(this.type == this.TypeTarifVueDeux){
      this.tarifBiere.updateTarif(tarif,tarif.id.toString()).subscribe(
        () => {
          this.router.navigate(['/PlansTarifaires']);
        }
      );
    }

    if(this.type == this.TypeTarifVueUn){
      this.tarifEtab.updateTarif(tarif, tarif.id.toString()).subscribe(
        () => {
          this.router.navigate(['/PlansTarifaires']);
        }
      );
    }
  }

  creer(tarif:TarifModele){
    //ajoute le tarif selon son "type"
    if(this.type == this.TypeTarifVueDeux){
      this.tarifBiere.addTarif(tarif).subscribe(
        () => {
          this.router.navigate(['/PlansTarifaires']);
        }
      );
    }

    if(this.type == this.TypeTarifVueUn){
      this.tarifEtab.addTarif(tarif).subscribe(
        () => {
          this.router.navigate(['/PlansTarifaires']);
        }
      );
    }
  }

  supprimer()
  {
    //suppprime le tarif selon son "type"
    if(this.type == this.TypeTarifVueDeux){
      this.tarifBiere.deleteTarif(this.tarif.id.toString()).subscribe(
        () => {
          this.router.navigate(['/PlansTarifaires']);
        }
      );
    }

    if(this.type == this.TypeTarifVueUn){
      this.tarifEtab.deleteTarif(this.tarif.id.toString()).subscribe(
        () => {
          this.router.navigate(['/PlansTarifaires']);
        }
      );
    }
  }


}
