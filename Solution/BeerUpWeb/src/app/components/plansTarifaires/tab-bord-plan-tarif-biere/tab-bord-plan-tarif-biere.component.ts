import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { UtilService } from 'src/app/services/util.service';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';

@Component({
  selector: 'app-tab-bord-plan-tarif-biere',
  templateUrl: './tab-bord-plan-tarif-biere.component.html',
  styleUrls: ['./tab-bord-plan-tarif-biere.component.css']
})
export class TabBordPlanTarifBiereComponent implements OnInit {

  subscr : Subscription;
  lTarifsBiere: Array<TarifModele>;
  TypeTarifVueBiere:string;
  lTarifsBierePagination: Array<TarifModele>;
  nextText:string;
  previousText:string;
  itemsPerPage:number;

  constructor(private tarifBiereSrv:TarifsBieresService,  private util:UtilService, private toastr:ToastrService) {
    this.subscr = new Subscription();
    
    this.lTarifsBiere = Array(0);
    this.TypeTarifVueBiere = this.util.TypeTarifVueBiere;
    this.lTarifsBierePagination = Array(0);
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
   }

  ngOnInit(): void {

    this.subscr.add(this.tarifBiereSrv.lTarifsBiere$.subscribe(
      (value) => {
        this.lTarifsBiere = value;
        this.lTarifsBierePagination = this.lTarifsBiere.slice(0, this.itemsPerPage);
      }
    ));
    this.tarifBiereSrv.getAll();
  }

  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.lTarifsBierePagination = this.lTarifsBiere.slice(startItem, endItem);
  }


  addTarifBiere(){
    if (this.lTarifsBiere.find(x => x.id =="")==undefined){
      this.tarifBiereSrv.addNewTarif();
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
