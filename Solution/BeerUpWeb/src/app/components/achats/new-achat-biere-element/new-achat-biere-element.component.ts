import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { AchatVuesModele } from 'src/app/models/achat-vues-modele';
import { BiereModele } from 'src/app/models/BiereModele';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AchatVueService } from 'src/app/services/CallApi/achat-vue.service';

@Component({
  selector: 'app-new-achat-biere-element',
  templateUrl: './new-achat-biere-element.component.html',
  styleUrls: ['./new-achat-biere-element.component.css']
})
export class NewAchatBiereElementComponent implements OnInit {
  
  @Input() lAllowedBiere:Array<BiereModele>;
  @Input() lTarifsBiere:Array<TarifModele>;
  @Input() achatBiere:AchatVuesModele;

  achatVueForm: FormGroup;
  nombreVuesRestantes:number;
  prix:number;
  submitted:boolean;


  constructor(private formBuilder:FormBuilder, private AchatVueSrv:AchatVueService) { 
    this.lAllowedBiere = Array(0);
    this.lTarifsBiere = Array(0);
    this.achatBiere = new AchatVuesModele();
    this.nombreVuesRestantes = 0;
    this.prix=0;
    this.submitted = false;

    this.achatVueForm = new FormGroup({
      bieId: new FormControl(''),
      tarifBieId: new FormControl(''),
    })
  }

  ngOnInit(): void {
    this.achatVueForm = this.formBuilder.group({
      bieId: [this.achatBiere.bieId,[Validators.required]],
      tarifBieId: [this.achatBiere.tarifsVueBieId, [Validators.required]],
      });
  }

  //mets en forme la ligne en cas de formulaire non valide
  getClass() {
    if (this.achatVueForm.invalid && this.submitted) return "bg-danger text-white";
    else return "";
  }

  //Affiche le nombre de vues restantes après sélection de la bière
  onBiereSelected(){
    let biere = this.lAllowedBiere.find(b => b.bieId == this.achatVueForm.value.bieId);
    if(biere!=undefined){
      this.nombreVuesRestantes = biere.bieNbVuesRestantes;
    }
  }

  //affiche le prix après sélection du tarif
  onTarifSelected(){
    let tarif = this.lTarifsBiere.find(t => t.id == this.achatVueForm.value.tarifBieId);
    if(tarif!=undefined){
      this.prix = tarif.prix;
    }
  }

  //met à jour l'item dans la liste des observables pour le composant parent.
  onSubmitForm(){
    this.submitted = true;
    if(this.achatVueForm.valid && this.achatVueForm.dirty){
      this.achatBiere.bieId = this.achatVueForm.value.bieId;
      this.achatBiere.tarifsVueBieId = this.achatVueForm.value.tarifBieId;
      this.achatBiere.prix = this.prix;
      this.achatBiere.isNew = false;
      this.AchatVueSrv.updateAchatBiere(this.achatBiere);
    }
  }

  supprimer(){
    this.AchatVueSrv.deleteAchatBiere(this.achatBiere);
  }
  
  isNew(){
    return this.achatBiere.isNew;
  }
}
