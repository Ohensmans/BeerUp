import { Component, OnDestroy, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { Subscription } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-bieres',
  templateUrl: './tab-bord-bieres.component.html',
  styleUrls: ['./tab-bord-bieres.component.css']
})
export class TabBordBieresComponent implements OnInit, OnDestroy {

  lBieresOrga:Array<BiereModele>;
  lBieresOrgaPagination:Array<BiereModele>;
  lEtabsOrga:Array<EtablissementModele>;
  subscr:Subscription;
  nextText:string;
  previousText:string;
  itemsPerPage:number;


  constructor(private BieresOrgaSrv:BieresOrgaService, private BieresSrv: BieresService, private AuthSrv:AuthentificationService,
    private EtabsOrgaSrv: EtabsOrgaService, private EtabSrv : EtablissementsService, private util:UtilService) {
    this.lBieresOrga = Array(0);
    this.lBieresOrgaPagination = Array(0);
    this.lEtabsOrga = Array(0);
    this.subscr = new Subscription();
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
   }

  ngOnInit(): void {

    if(this.AuthSrv.isAdmin())
    {
      this.subscr.add(this.BieresSrv.lBiere$.subscribe(
        value => {
          this.lBieresOrga = value;
          this.lBieresOrgaPagination = this.lBieresOrga.slice(0, this.itemsPerPage);
        }
      ));
      this.BieresSrv.getAll();

      this.subscr.add(this.EtabSrv.lEtablissement$.subscribe(
        (value)=> {
          this.lEtabsOrga = value;
        }
      ));
    this.EtabSrv.getAll();
    }
  
    else
    {
      this.subscr.add(this.BieresOrgaSrv.lAllowedBieresOrga$.subscribe(
        value => {
          this.lBieresOrga = value;
          this.lBieresOrgaPagination = this.lBieresOrga.slice(0, this.itemsPerPage);
        }
      ));

      this.subscr.add(this.EtabsOrgaSrv.lAllEtabsOrga$.subscribe(
        (value)=>{
          this.lEtabsOrga = value;
        }
      ));
      const id = this.AuthSrv.getUserOrgId();
      this.EtabsOrgaSrv.getAll(false, id);
      this.BieresOrgaSrv.getAll(id, false);
    }



  }

  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.lBieresOrgaPagination = this.lBieresOrga.slice(startItem, endItem);
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

}
