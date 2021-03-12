import { Component, OnInit } from '@angular/core';
import { PageChangedEvent } from 'ngx-bootstrap/pagination';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-tab-bord-etabs',
  templateUrl: './tab-bord-etabs.component.html',
  styleUrls: ['./tab-bord-etabs.component.css']
})
export class TabBordEtabsComponent implements OnInit {

  lEtabsOrga:Array<EtablissementModele>;
  lEtabsOrgaPagination:Array<EtablissementModele>;
  nextText:string;
  previousText:string;
  itemsPerPage:number;

  constructor(private EtabsOrgaSrv:EtabsOrgaService, private EtablissementsSrv: EtablissementsService, private AuthSrv:AuthentificationService, 
    private util:UtilService) {
    this.lEtabsOrga = Array(0);
    this.lEtabsOrgaPagination = Array(0);
    this.nextText=this.util.nextText;
    this.previousText=this.util.previousText;
    this.itemsPerPage = this.util.itemsPerPage;
   }

  ngOnInit(): void {

    if(this.AuthSrv.isAdmin())
    {
      this.EtablissementsSrv.lEtablissement$.subscribe(
        value => {
          this.lEtabsOrga = value;
          this.lEtabsOrgaPagination = this.lEtabsOrga.slice(0, this.itemsPerPage);
        }
      );
      this.EtablissementsSrv.getAll();
    }
    else
    {
      this.EtabsOrgaSrv.lAllowedEtabsOrga$.subscribe(
        value => {
          this.lEtabsOrga = value;
          this.lEtabsOrgaPagination = this.lEtabsOrga.slice(0, this.itemsPerPage);
        }
      );
    this.EtabsOrgaSrv.getAll(false);
    }
  }

  pageChanged(event: PageChangedEvent): void {
    const startItem = (event.page - 1) * event.itemsPerPage;
    const endItem = event.page * event.itemsPerPage;
    this.lEtabsOrgaPagination = this.lEtabsOrga.slice(startItem, endItem);
  }


}
