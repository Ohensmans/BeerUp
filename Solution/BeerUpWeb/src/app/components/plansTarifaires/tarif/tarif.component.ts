import { Component, Input} from '@angular/core';
import { TarifModele } from 'src/app/models/tarif-modele';

@Component({
  selector: 'app-tarif',
  templateUrl: './tarif.component.html',
  styleUrls: ['./tarif.component.css']
})

export class TarifComponent {
  
  @Input() tarif:TarifModele;

  constructor() { 
    this.tarif = new TarifModele();
  }

}
