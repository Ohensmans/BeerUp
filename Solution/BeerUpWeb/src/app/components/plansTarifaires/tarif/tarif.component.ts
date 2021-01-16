import { Component, Input, OnInit} from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { UtilService } from 'src/app/services/util.service';
import { FormBuilder, FormGroup, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { formatDate } from '@angular/common';
import { Guid } from "guid-typescript";
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ConfirmComponent } from '../../confirm/confirm.component';


@Component({
  selector: 'app-tarif',
  templateUrl: './tarif.component.html',
  styleUrls: ['./tarif.component.css']

})

export class TarifComponent implements OnInit {
  
  @Input() tarif:TarifModele;
  @Input() type:string;

  modalRef!: BsModalRef;

  tarifForm: FormGroup;
  TypeTarifVueEtab:string;
  TypeTarifVueBiere:string;
  emptyGuid:string;
  isNew:boolean;

  constructor(private tarifBiere:TarifsBieresService, private tarifEtab:TarifsEtabsService, private util:UtilService, private formBuilder:FormBuilder, private router:Router, private modalService:BsModalService) { 

    this.TypeTarifVueEtab = this.util.TypeTarifVueEtab;
    this.TypeTarifVueBiere = this.util.TypeTarifVueBiere;
    this.tarif = new TarifModele();
    this.type = "";
    this.tarifForm = new FormGroup({
      nbVue: new FormControl(''),
      prix: new FormControl(''),
      dateDebut: new FormControl(''),
      dateFin: new FormControl(''),
    })
    this.emptyGuid = Guid.createEmpty().toString();
    this.isNew = true;

  }

  ngOnInit():void{

    this.tarifForm = this.formBuilder.group({
      nbVue: [this.tarif.nbVue],
      prix: [this.tarif.prix],
      dateDebut: [formatDate(this.tarif.dateDebut, 'yyyy-MM-dd', 'en')],
      dateFin: [formatDate(this.tarif.dateFin, 'yyyy-MM-dd', 'en')]
      });
    if(this.tarif.id!=this.emptyGuid){
      this.isNew = false;
    }
  }

  getIsNew()
  {
    return this.isNew;
  }

  activation(){
    //n'enregistre la modification que si il s'agit d'un tarif déjà créé
    if(!this.getIsNew()){
      //intervertit la valeur "Actif" du tarif
      this.tarif.actif = !this.tarif.actif;
      this.sauvegarder(this.tarif);
    }
  }

  onSubmitForm(){
    
    this.tarif.nbVue = +this.tarifForm.value.nbVue;
    this.tarif.prix = +this.tarifForm.value.prix;
    this.tarif.dateDebut = this.tarifForm.value.dateDebut;
    this.tarif.dateFin = this.tarifForm.value.dateFin;

    if(this.getIsNew())
    {
      this.creer(this.tarif);      
    }
    else
    {
      this.sauvegarder(this.tarif);     
    }
  }


  sauvegarder(tarif:TarifModele){
    //enregistre les modifications selon le "type" de tarif
    if(this.type == this.TypeTarifVueBiere){
      this.tarifBiere.updateTarif(tarif,tarif.id);
    }

    if(this.type == this.TypeTarifVueEtab){
      this.tarifEtab.updateTarif(tarif, tarif.id);
    }
  }

  creer(tarif:TarifModele){
    //ajoute le tarif selon son "type"
    if(this.type == this.TypeTarifVueBiere){
      this.tarifBiere.addTarif(tarif);
    }

    if(this.type == this.TypeTarifVueEtab){
      this.tarifEtab.addTarif(tarif);
    }
  }

  supprimer()
  {
    //lance le module de confirmation
    this.modalRef = this.modalService.show(ConfirmComponent, {
      initialState:{prompt: 'Etes-vous sûr de vouloir supprimer ce tarif ?'}});

    this.modalRef.content.onClose$.subscribe(
      (value: boolean) =>{
      if(value){
        {
          //suppprime le tarif selon son "type"
          if(this.type == this.TypeTarifVueBiere){
            this.tarifBiere.deleteTarif(this.tarif.id);
          }
    
          if(this.type == this.TypeTarifVueEtab){
            this.tarifEtab.deleteTarif(this.tarif.id);
          }
        }
      }
    });   
  }



}
