import { Component, Input, OnInit} from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { UtilService } from 'src/app/services/util.service';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { formatDate } from '@angular/common';
import { Guid } from "guid-typescript";
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ConfirmComponent } from '../../confirm/confirm.component';
import { IsIntegerAndPositiveDirective } from 'src/app/directives/validators/is-integer-and-positive.directive';
import { DateDebutIsOlderDirective } from 'src/app/directives/validators/date-debut-is-older.directive';
import { ToastrService } from 'ngx-toastr';
import { IsPositiveDirective } from 'src/app/directives/validators/is-positive.directive';


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
  isOld:boolean;

  constructor(private tarifBiere:TarifsBieresService, private tarifEtab:TarifsEtabsService, private util:UtilService, private formBuilder:FormBuilder, 
    private router:Router, private modalService:BsModalService, private toastr:ToastrService) { 

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
    this.isOld = false;
  }

  ngOnInit():void{

    this.tarifForm = this.formBuilder.group({
      nbVue: [this.tarif.nbVue,[Validators.required, IsIntegerAndPositiveDirective(), IsIntegerAndPositiveDirective()]],
      prix: [this.tarif.prix, [Validators.required, IsPositiveDirective()]],
      dateDebut: [formatDate(this.tarif.dateDebut, 'yyyy-MM-dd', 'en'), [Validators.required]],
      dateFin: [formatDate(this.tarif.dateFin, 'yyyy-MM-dd', 'en'), [Validators.required]]
      }, { validators: DateDebutIsOlderDirective() });
    //assigne la valuer isNew selon la valeur id du tarif (à la création l'id = "")
      if(this.tarif.id!=""){
      this.isNew = false;
      this.isOld = true;
    }
  }

  getIsNew()
  {
    return this.isNew;
  }

  getIsOld()
  {
    return this.isOld;
  }

  getClass() {
    if (this.tarifForm.invalid) return "bg-danger text-white";
    else return "";
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
    if(this.tarifForm.valid && this.tarifForm.dirty)
    {
      this.tarif.dateDebut = this.tarifForm.value.dateDebut;
      this.tarif.dateFin = this.tarifForm.value.dateFin;

      if(this.getIsNew())
      {
        this.tarif.nbVue = +this.tarifForm.value.nbVue;
        this.tarif.prix = +this.tarifForm.value.prix;
        this.creer(this.tarif);      
      }
      else
      {
        this.sauvegarder(this.tarif);     
      }
    }
    if(this.tarifForm.invalid)
    {
      this.toastrInvalid();
    }
  }

  toastrInvalid(){
    let message="";

    if (this.tarifForm.get("nbVue")?.invalid){
      message = "Le nombre de vue doit être un entier positif et supérieur à zéro";
      this.dangerToastr(message);
    }
    if (this.tarifForm.get("prix")?.invalid){
      message ="Le prix doit être positif et supérieur à zéro";
      this.dangerToastr(message);
    }
    if(this.tarifForm.errors!=null && this.tarifForm.errors.dateDebutIsOlder.value==true){
      message ="La date début doit être antérieure à la date de fin";
      this.dangerToastr(message);
    }
    
  }


  dangerToastr(message:string)
  {
    this.toastr.error(message, "Non-valide");
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
              if(this.isNew){
                this.tarifBiere.deleteTarifObs(this.tarif.id);
              }
              else{
                this.tarifBiere.deleteTarif(this.tarif.id);
              }
              
            }
      
            if(this.type == this.TypeTarifVueEtab){
              if(this.isNew){
                this.tarifEtab.deleteTarifObs(this.tarif.id);
              }
              else{
                this.tarifEtab.deleteTarif(this.tarif.id);
              }
            }
          }
        }
      });   
  }



}
