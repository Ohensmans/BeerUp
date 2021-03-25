import { Component, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { Subscription } from 'rxjs';
import { VueAchat } from 'src/app/models/vue-achat';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { VuesAchatBiereService } from 'src/app/services/CallApi/vues-achat-biere.service';
import { VuesAchatEtabService } from 'src/app/services/CallApi/vues-achat-etab.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-achat',
  templateUrl: './tab-bord-achat.component.html',
  styleUrls: ['./tab-bord-achat.component.css']
})
export class TabBordAchatComponent implements OnInit {

  lVuesAchatEtab: Array<VueAchat>;
  lVuesAchatEtabPagination: Array<VueAchat>;
  subscr: Subscription;
  nextText:string;
  previousText:string;
  itemsPerPage:number;

  constructor(private AuthSrv:AuthentificationService,  private VuesAchatEtabSrv:VuesAchatEtabService, private util:UtilService) { 
    this.lVuesAchatEtab = Array(0);
    this.lVuesAchatEtabPagination = Array(0);
    this.subscr = new Subscription();
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
  }

  //initialisation en observant la liste des vues établissments
  ngOnInit(): void {
    this.subscr.add(this.VuesAchatEtabSrv.lVuesAchatEtab$.subscribe(
      (value) =>{
        this.lVuesAchatEtab = value;
        this.lVuesAchatEtabPagination = this.lVuesAchatEtab.slice(0, this.itemsPerPage);
      }
    ));

    this.VuesAchatEtabSrv.get();
  }

  //méthode de pagination pour limiter la liste affichée
  //params dans le service util
  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.lVuesAchatEtabPagination = this.lVuesAchatEtab.slice(startItem, endItem);
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

}
