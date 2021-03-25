import { Component, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-plan-tarif',
  templateUrl: './tab-bord-plan-tarif.component.html',
  styleUrls: ['./tab-bord-plan-tarif.component.css']
})
export class TabBordPlanTarifComponent implements OnInit {

  subscr : Subscription;

  lTarifsEtabs: Array<TarifModele>;
  lTarifsEtabsActifs: Array<TarifModele>;
  lTarifsEtabsPagination :Array<TarifModele>;

  TypeTarifVueEtab:string;
  nextText:string;
  previousText:string;
  itemsPerPage:number;
  onlyActif:boolean;

  constructor(private tarifEtabSrv:TarifsEtabsService, private util:UtilService, private toastr:ToastrService) {
    this.subscr = new Subscription();
    
    this.lTarifsEtabs = Array(0);
    this.lTarifsEtabsActifs = Array(0);
    this.lTarifsEtabsPagination = Array(0);

    this.TypeTarifVueEtab = this.util.TypeTarifVueEtab;
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
    this.onlyActif = false;
   }

  ngOnInit(): void {

    this.subscr.add(this.tarifEtabSrv.lTarifsEtabs$.subscribe(
      (value) => {
        this.lTarifsEtabs = value;
        this.lTarifsEtabs.forEach(element => {
          if(element.actif){
            this.lTarifsEtabsActifs.push(element);
          }
        });
        this.lTarifsEtabsPagination = this.lTarifsEtabs.slice(0, this.itemsPerPage);
      }
    ));
    this.tarifEtabSrv.getAll();
  }

  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;

    if(this.onlyActif){
      this.lTarifsEtabsPagination = this.lTarifsEtabsActifs.slice(startItem, endItem);
    }
    else{
      this.lTarifsEtabsPagination = this.lTarifsEtabs.slice(startItem, endItem);
    }
    
  }


  addTarifEtab(){
    if (this.lTarifsEtabs.find(x => x.id == "")==undefined){
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

  //intervertit la valeur de onlyActif et affiche ou non uniquement les tarifs actifs
  switchOnlyActif(){
    this.onlyActif = !this.onlyActif;
    this.adaptPagination();

  }

  adaptPagination(){
    this.lTarifsEtabsPagination = Array(0);
    if(this.onlyActif) {
      this.lTarifsEtabsPagination = this.lTarifsEtabsActifs.slice(0, this.itemsPerPage);
    }
    else{
      this.lTarifsEtabsPagination = this.lTarifsEtabs.slice(0, this.itemsPerPage);
    }
  }




}
