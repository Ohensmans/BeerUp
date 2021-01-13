import { ThisReceiver, ThrowStmt } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import { Guid } from 'guid-typescript';
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
  TypeTarifVueEtab:string;
  TypeTarifVueBiere:string;

  constructor(private tarifBiereSrv:TarifsBieresService, private tarifEtabSrv:TarifsEtabsService, private util:UtilService) {
    this.lTarifsBiere = Array(0);
    this.lTarifsEtabs = Array(0);

    this.TypeTarifVueEtab = this.util.TypeTarifVueEtab;
    this.TypeTarifVueBiere = this.util.TypeTarifVueBiere;
   }

  ngOnInit(): void {

    this.tarifBiereSrv.lTarifsBiere$.subscribe(
      value => {
        this.lTarifsBiere = value;
      }
    );
    this.tarifEtabSrv.lTarifsEtabs$.subscribe(
      (value) => {
        this.lTarifsEtabs = value;
      }
    )  
    this.tarifBiereSrv.getAll();
    this.tarifEtabSrv.getAll();
  }


  addTarifBiere(){
    if (this.lTarifsBiere.find(x => x.id == Guid.createEmpty().toString())==undefined){
      this.tarifBiereSrv.addNewTarif();
    }
    
  }

  addTarifEtab(){
    if (this.lTarifsEtabs.find(x => x.id == Guid.createEmpty().toString())==undefined){
      this.tarifEtabSrv.addNewTarif();
    }
  }



}
