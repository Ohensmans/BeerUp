import { Component, Input, OnInit } from '@angular/core';
import { VueAchat } from 'src/app/models/vue-achat';

@Component({
  selector: 'app-element-liste-achat',
  templateUrl: './element-liste-achat.component.html',
  styleUrls: ['./element-liste-achat.component.css']
})
export class ElementListeAchatComponent implements OnInit {

  @Input() achat:VueAchat;

  solde:number;

  constructor() { 
    this.achat = new VueAchat();
    this.solde = 0;
  }

  //change la couleur de police selon le solde restant 
  getClass(){
    if(this.solde>0){
      return "class=' text-primary '";
    }
    else{
      return "class=' text-danger '";
    }
  }

  //calcule le solde restant
  ngOnInit(): void {
    this.solde = this.achat.nbVuesAch - this.achat.nbVu;
  }

}
