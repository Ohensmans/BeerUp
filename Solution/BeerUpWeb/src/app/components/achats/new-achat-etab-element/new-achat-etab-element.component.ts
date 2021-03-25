import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { AchatVuesModele } from 'src/app/models/achat-vues-modele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { TarifModele } from 'src/app/models/tarif-modele';
import { AchatVueService } from 'src/app/services/CallApi/achat-vue.service';

@Component({
  selector: 'app-new-achat-etab-element',
  templateUrl: './new-achat-etab-element.component.html',
  styleUrls: ['./new-achat-etab-element.component.css']
})
export class NewAchatEtabElementComponent implements OnInit {
  
  @Input() lAllowedEtab:Array<EtablissementModele>;
  @Input() lTarifsEtab:Array<TarifModele>;
  @Input() achatEtab:AchatVuesModele;

  achatVueForm: FormGroup;
  nombreVuesRestantes:number;
  prix:number;
  submitted:boolean;


  constructor(private formBuilder:FormBuilder, private AchatVueSrv:AchatVueService) { 
    this.lAllowedEtab = Array(0);
    this.lTarifsEtab = Array(0);
    this.achatEtab = new AchatVuesModele();
    this.nombreVuesRestantes = 0;
    this.prix=0;
    this.submitted = false;

    this.achatVueForm = new FormGroup({
      etabId: new FormControl(''),
      tarifEtabId: new FormControl(''),
    })
  }

  ngOnInit(): void {
    this.achatVueForm = this.formBuilder.group({
      etabId: [this.achatEtab.etaId,[Validators.required]],
      tarifEtabId: [this.achatEtab.tarifsVueEtabId, [Validators.required]],
      });
  }

  //mets en forme la ligne en cas de formulaire non valide
  getClass() {
    if (this.achatVueForm.invalid && this.submitted) return "bg-danger text-white";
    else return "";
  }

  //Affiche le nombre de vues restantes après sélection de l'étab
  onEtabSelected(){
    let etab = this.lAllowedEtab.find(e => e.etaId == this.achatVueForm.value.etabId);
    if(etab!=undefined){
      this.nombreVuesRestantes = etab.etaNbVuesRestantes;
    }
  }

  //affiche le prix après sélection du tarif
  onTarifSelected(){
    let tarif = this.lTarifsEtab.find(t => t.id == this.achatVueForm.value.tarifEtabId);
    if(tarif!=undefined){
      this.prix = tarif.prix;
    }
  }

  //met à jour l'item dans la liste des observables pour le composant parent.
  onSubmitForm(){
    this.submitted = true;
    if(this.achatVueForm.valid && this.achatVueForm.dirty){
      this.achatEtab.etaId = this.achatVueForm.value.etabId;
      this.achatEtab.tarifsVueEtabId = this.achatVueForm.value.tarifEtabId;
      this.achatEtab.prix = this.prix;
      this.achatEtab.isNew = false;
      this.AchatVueSrv.updateAchatEtab(this.achatEtab);
    }
  }

  supprimer(){
    this.AchatVueSrv.deleteAchatEtab(this.achatEtab);
  }
  
  isNew(){
    return this.achatEtab.isNew;
  }
}
