import { Component, OnInit } from '@angular/core';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';

@Component({
  selector: 'app-tab-bord-etabs',
  templateUrl: './tab-bord-etabs.component.html',
  styleUrls: ['./tab-bord-etabs.component.css']
})
export class TabBordEtabsComponent implements OnInit {

  lEtabsOrga:Array<EtablissementModele>;


  constructor(private EtabsOrgaSrv:EtabsOrgaService, private EtablissementsSrv: EtablissementsService, private AuthSrv:AuthentificationService) {
    this.lEtabsOrga = Array(0);
   }

  ngOnInit(): void {

    if(this.AuthSrv.isAdmin())
    {
      this.EtablissementsSrv.lEtablissement$.subscribe(
        value => {
          this.lEtabsOrga = value;
        }
      );
      this.EtablissementsSrv.getAll();
    }
    else
    {
      this.EtabsOrgaSrv.lAllowedEtabsOrga$.subscribe(
        value => {
          this.lEtabsOrga = value;
        }
      );
    this.EtabsOrgaSrv.getAll();
    }
  }


}
