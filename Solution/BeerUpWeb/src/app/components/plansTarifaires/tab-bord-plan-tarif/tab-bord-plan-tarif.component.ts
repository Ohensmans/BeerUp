import { ThrowStmt } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-plan-tarif',
  templateUrl: './tab-bord-plan-tarif.component.html',
  styleUrls: ['./tab-bord-plan-tarif.component.css']
})
export class TabBordPlanTarifComponent implements OnInit {

  lTarifsBiere: Array<TarifModele>;
  lTarifsEtabs: Array<TarifModele>;
  subscr : Subscription;
  TypeTarifVueUn:string;
  TypeTarifVueDeux:string;

  constructor(private tarifBiere:TarifsBieresService, private tarifEtab:TarifsEtabsService, private util:UtilService) {
    this.lTarifsBiere = [];
    this.lTarifsEtabs = [];
    this.subscr = new Subscription();

    this.TypeTarifVueUn = this.util.TypeTarifVueUn;
    this.TypeTarifVueDeux = this.util.TypeTarifVueDeux;
   }

  ngOnInit(): void {
    this.subscr.add(this.tarifBiere.getAll().subscribe(
      (value)=> this.lTarifsBiere = value
    ))
    this.subscr.add(this.tarifEtab.getAll().subscribe(
      (value)=> this.lTarifsEtabs = value
    ))
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

  addTarifBiere(){
    this.lTarifsBiere.push(new TarifModele())
  }

  addTarifEtab(){
    this.lTarifsEtabs.push(new TarifModele())
  }



}
