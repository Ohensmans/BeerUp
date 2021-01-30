import { Component, OnInit } from '@angular/core';
import { Guid } from 'guid-typescript';
import { ToastrService } from 'ngx-toastr';
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

  subscr : Subscription;

  lTarifsBiere: Array<TarifModele>;
  lTarifsEtabs: Array<TarifModele>;

  TypeTarifVueEtab:string;
  TypeTarifVueBiere:string;

  constructor(private tarifBiereSrv:TarifsBieresService, private tarifEtabSrv:TarifsEtabsService, private util:UtilService, private toastr:ToastrService) {
    this.subscr = new Subscription();
    
    this.lTarifsBiere = Array(0);
    this.lTarifsEtabs = Array(0);

    this.TypeTarifVueEtab = this.util.TypeTarifVueEtab;
    this.TypeTarifVueBiere = this.util.TypeTarifVueBiere;
   }

  ngOnInit(): void {

    this.subscr.add(this.tarifBiereSrv.lTarifsBiere$.subscribe(
      (value) => {
        this.lTarifsBiere = value;
      }
    ));
    this.subscr.add(this.tarifEtabSrv.lTarifsEtabs$.subscribe(
      (value) => {
        this.lTarifsEtabs = value;
          }
        ));
    this.tarifBiereSrv.getAll();
    this.tarifEtabSrv.getAll();
  }


  addTarifBiere(){
    if (this.lTarifsBiere.find(x => x.id == Guid.createEmpty().toString())==undefined){
      this.tarifBiereSrv.addNewTarif();
    }
    else
    {
      this.infoToastr();
    }   
  }

  addTarifEtab(){
    if (this.lTarifsEtabs.find(x => x.id == Guid.createEmpty().toString())==undefined){
      this.tarifEtabSrv.addNewTarif();
    }
    else
    {
      this.infoToastr();
    }
  }

  infoToastr()
  {
    this.toastr.info("Veuillez créer le nouveau tarif avant d'en faire un nouveau", "Information");
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }



}
