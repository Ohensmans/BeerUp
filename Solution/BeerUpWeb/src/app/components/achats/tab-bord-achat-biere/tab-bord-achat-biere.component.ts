import { Component, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { Subscription } from 'rxjs';
import { VueAchat } from 'src/app/models/vue-achat';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { VuesAchatBiereService } from 'src/app/services/CallApi/vues-achat-biere.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-achat-biere',
  templateUrl: './tab-bord-achat-biere.component.html',
  styleUrls: ['./tab-bord-achat-biere.component.css']
})
export class TabBordAchatBiereComponent implements OnInit {


  lVuesAchatBiere: Array<VueAchat>;
  lVuesAchatBierePagination: Array<VueAchat>;
  subscr: Subscription;
  nextText:string;
  previousText:string;
  itemsPerPage:number;
  

  constructor(private AuthSrv:AuthentificationService, private VuesAchatBiereSrv:VuesAchatBiereService, private util:UtilService) { 
    this.lVuesAchatBiere = Array(0);
    this.lVuesAchatBierePagination = Array(0);
    this.subscr = new Subscription();
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
  }

  //initialisation en observant la liste des vues bières
  ngOnInit(): void {
    this.subscr.add(this.VuesAchatBiereSrv.lVuesAchatBiere$.subscribe(
      (value)=>{
        this.lVuesAchatBiere = value;
        this.lVuesAchatBierePagination = this.lVuesAchatBiere.slice(0, this.itemsPerPage);
      }
    ));

    this.VuesAchatBiereSrv.get();
  }

  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.lVuesAchatBierePagination = this.lVuesAchatBiere.slice(startItem, endItem);
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }
}
