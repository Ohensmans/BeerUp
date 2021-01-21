import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { TypesEtabModele } from 'src/app/models/types-etab-modele';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { TypesEtabService } from 'src/app/services/CallApi/types-etab.service';

@Component({
  selector: 'app-fiche-etablissement',
  templateUrl: './fiche-etablissement.component.html',
  styleUrls: ['./fiche-etablissement.component.css']
})
export class FicheEtablissementComponent implements OnInit {

  etab:EtablissementModele;
  subsr:Subscription;
  lTypeEtab:TypesEtabModele[];
  etabForm: FormGroup;

  constructor(private EtablissementsSrv: EtablissementsService, private route:ActivatedRoute, private TypesEtabSrv : TypesEtabService, private formBuilder:FormBuilder) {
    this.etab = new EtablissementModele();
    this.subsr = new Subscription();
    this.lTypeEtab = new Array<TypesEtabModele>(0);

    this.etabForm = new FormGroup({
      etaNom:new FormControl(''),
      etaTva:new FormControl(''),
      etaRue:new FormControl(''),
      etaNum:new FormControl(''),
      etaCp:new FormControl(''),
      etaVille:new FormControl(''),
      etaPays:new FormControl(''),
      etaMail:new FormControl(''),
      etaWeb:new FormControl(''),
      etaPhoto:new FormControl(''),
    })
   }

  ngOnInit(): void {
    const id = this.route.snapshot.params['id'];

    //récupère l'établissement si il n'est pas nouveau
    if(id!="new")
    {
      this.subsr.add(this.EtablissementsSrv.getOne(id).subscribe(
        (value)=> this.etab = value));
    }

    //obtient la liste de type d'établissements
    this.subsr.add(this.TypesEtabSrv.lTypesEtab$.subscribe(
      (value) => this.lTypeEtab = value
    ));
    this.TypesEtabSrv.getAll();

    this.etabForm = this.formBuilder.group({
      etaNom:[this.etab.etaNom],
      etaTva:[this.etab.etaTva],
      etaRue:[this.etab.etaRue],
      etaNum:[this.etab.etaNum],
      etaCp:[this.etab.etaCp],
      etaVille:[this.etab.etaVille],
      etaPays:[this.etab.etaPays],
      etaMail:[this.etab.etaMail],
      etaWeb:[this.etab.etaWeb],
      etaPhoto:[this.etab.etaPhoto],
    })

  }

  ngOnDestroy(){
    this.subsr.unsubscribe();
  }

  onSubmitForm(){}



}
