import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { TypeServicesModele } from 'src/app/models/type-services-modele';
import { VenteBiereEtaModele } from 'src/app/models/vente-biere-eta-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { BieresEtabService } from 'src/app/services/CallApi/bieres-etab.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { TypesServicesService } from 'src/app/services/CallApi/types-services.service';
import { VenteBieresEtaService } from 'src/app/services/CallApi/vente-bieres-eta.service';

@Component({
  selector: 'app-tab-bord-bieres-etab',
  templateUrl: './tab-bord-bieres-etab.component.html',
  styleUrls: ['./tab-bord-bieres-etab.component.css']
})
export class TabBordBieresEtabComponent implements OnInit {

  lAllBieres:Array<BiereModele>;
  lAllBieresOrga:Array<BiereModele>;
  lAllBieresServies:Array<BiereModele>;
  lTypesServices:Array<TypeServicesModele>;
  lVenteBiere:Array<VenteBiereEtaModele>;
  etab: EtablissementModele;
  subscr: Subscription;

  constructor(private etabSrv : EtablissementsService, private AuthSrv:AuthentificationService, 
    private route:ActivatedRoute, private toastr:ToastrService, private router : Router, private bieresEtabSrv: BieresEtabService, 
    private biereSrv:BieresService, private biereOrgaSrv:BieresOrgaService, private typeServiceSrv : TypesServicesService, private venteBiereSrv : VenteBieresEtaService) {
    this.lAllBieresServies = Array(0);
    this.lAllBieres = Array(0);
    this.lAllBieresOrga = Array(0);
    this.lTypesServices = Array(0);
    this.lVenteBiere = Array(0);
    this.subscr = new Subscription();
    this.etab = new EtablissementModele();
   }

  ngOnInit(): void {

    const id = this.route.snapshot.params.id;

    this.subscr.add(this.etabSrv.getOne(id).subscribe(
      (value) =>{
        this.etab = value;
        this.biereOrgaSrv.getAll(this.etab.orgId);
      },
      (error) => {
        this.router.navigate(['Etablissements']);
      }
    ))

    this.subscr.add(this.biereOrgaSrv.lAllBieresOrga$.subscribe(
      (value)=> {
        this.lAllBieresOrga = value;
      }
    ));
    
    

    this.subscr.add(this.bieresEtabSrv.lBieresServies$.subscribe(
      (value)=>{
        this.lAllBieresServies = value;
      }
    ));

    this.subscr.add(this.biereSrv.lBiere$.subscribe(
      (value)=>{

        this.lAllBieres = Array(0);
        if(this.lAllBieresOrga.length!=0){
          this.lAllBieresOrga.forEach(element => {
            if(!this.lAllBieresServies.includes(element))
              this.lAllBieres.push(element);
          })
        }

          value.forEach(element => {
            if(!this.lAllBieres.includes(element) && !this.lAllBieresServies.includes(element)){
              this.lAllBieres.push(element);
            }
          });
        }  
    ));

    this.subscr.add(this.typeServiceSrv.lTypesService$.subscribe(
      (value)=>{
        this.lTypesServices = value;
      }
    ));

    this.subscr.add(this.venteBiereSrv.lVentesBieresEtab$.subscribe(
      (value)=> {
        this.lVenteBiere = value;
      }
    ))
    
    this.bieresEtabSrv.getAll(id);
    this.biereSrv.getAll();
    this.typeServiceSrv.getAll();  
    this.venteBiereSrv.getAllVentesBieresParEtab(id);
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

  addNewVente(){
    if (this.lVenteBiere.find(x => x.bieId == "")==undefined){
      this.venteBiereSrv.addNewVente();
    }
    else
    {
      this.infoToastr("Veuillez sauvegarder l'ajout d'une nouvelle bière avant d'en faire un nouveau");
    } 
  }

  infoToastr(message:string)
  {
    this.toastr.info(message, "Information");
  }

  getVenteBiere(biereId:string){
    let index = this.lVenteBiere.findIndex(t => t.bieId == biereId);
    if(index!=-1){
      return this.lVenteBiere[index];
    }
    return new VenteBiereEtaModele();
  }


}

