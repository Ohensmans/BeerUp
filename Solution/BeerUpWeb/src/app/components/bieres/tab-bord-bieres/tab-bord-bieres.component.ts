import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';

@Component({
  selector: 'app-tab-bord-bieres',
  templateUrl: './tab-bord-bieres.component.html',
  styleUrls: ['./tab-bord-bieres.component.css']
})
export class TabBordBieresComponent implements OnInit, OnDestroy {

  lBieresOrga:Array<BiereModele>;
  lEtabsOrga:Array<EtablissementModele>;
  subscr:Subscription;


  constructor(private BieresOrgaSrv:BieresOrgaService, private BieresSrv: BieresService, private AuthSrv:AuthentificationService,
    private EtabsOrgaSrv: EtabsOrgaService, private EtabSrv : EtablissementsService) {
    this.lBieresOrga = Array(0);
    this.lEtabsOrga = Array(0);
    this.subscr = new Subscription();
   }

  ngOnInit(): void {

    if(this.AuthSrv.isAdmin())
    {
      this.subscr.add(this.BieresSrv.lBiere$.subscribe(
        value => {
          this.lBieresOrga = value;
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
        }
      ));

      this.subscr.add(this.EtabsOrgaSrv.lAllEtabsOrga$.subscribe(
        (value)=>{
          this.lEtabsOrga = value;
        }
      ));
  
      this.EtabsOrgaSrv.getAll();
      this.BieresOrgaSrv.getAll(this.AuthSrv.getUserOrgId());
    }



  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

}
