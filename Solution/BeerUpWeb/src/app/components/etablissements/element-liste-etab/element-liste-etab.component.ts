import { Component, Input, OnInit } from '@angular/core';
import { EtablissementModele } from 'src/app/models/etablissement-modele';

@Component({
  selector: 'app-element-liste-etab',
  templateUrl: './element-liste-etab.component.html',
  styleUrls: ['./element-liste-etab.component.css']
})


export class ElementListeEtabComponent implements OnInit {
  
  @Input() etab:EtablissementModele;

  constructor() { 
    this.etab = new EtablissementModele();
  }

  ngOnInit(): void {
  }

  modifEtab(){

  }

  modifBieresEtab(){

  }

  activation(){

  }

  supprimer(){

  }

}
