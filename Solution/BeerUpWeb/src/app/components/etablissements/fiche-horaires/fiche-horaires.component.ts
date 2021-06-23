import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { HoraireModele } from 'src/app/models/horaire-modele';
import { JourFermetureModele } from 'src/app/models/jour-fermeture-modele';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { HorairesService } from 'src/app/services/CallApi/horaires.service';
import { JoursFermetureService } from 'src/app/services/CallApi/jours-fermeture.service';

@Component({
  selector: 'app-fiche-horaires',
  templateUrl: './fiche-horaires.component.html',
  styleUrls: ['./fiche-horaires.component.css']
})
export class FicheHorairesComponent implements OnInit {

  etab:EtablissementModele;
  subsr:Subscription;
  lHoraires:HoraireModele[];
  lJours:JourFermetureModele[];

  constructor(private route:ActivatedRoute,private EtablissementsSrv: EtablissementsService,
    private horaireSrv : HorairesService, private joursSrv:JoursFermetureService, private toastr:ToastrService ) { 
    this.etab = new EtablissementModele();
    this.subsr = new Subscription();
    this.lHoraires = new Array(0);
    this.lJours = new Array(0);
  }

  ngOnInit(): void {
    const id = this.route.snapshot.params['id'];
    
    //obtient l'établissement
    this.subsr.add(this.EtablissementsSrv.getOne(id).subscribe(
      (value) => {
        this.etab = value;
      }
    ));

     //obtient la liste de type des horaires
     this.subsr.add(this.horaireSrv.lHoraire$.subscribe(
      (value) => {this.lHoraires = value;}
    ));

    //obtient la liste de type des jours de fermeture
    this.subsr.add(this.joursSrv.lJours$.subscribe(
      (value) => {this.lJours = value;}
    ));

    this.horaireSrv.getAllHorairesEtab(id);
    this.joursSrv.getAllJoursEtab(id);
  }

  addHoraire(){
    if (this.lHoraires.find(x => x.horId=='')==undefined){
      this.horaireSrv.addNewHoraire();
    }
    else
    {
      this.infoToastr("L'horaire précédent doit être valide avant d'en faire un nouveau");
    } 
  }

  addJour(){
    if (this.lJours.find(x => x.jouId=='')==undefined){
      this.joursSrv.addNewJour();
    }
    else
    {
      this.infoToastr("Le jour de fermeture précédent doit être valide avant d'en faire un nouveau");
    } 
  }

  ngOnDestroy(){
    this.subsr.unsubscribe();
  }

  infoToastr(message:string)
  {
    this.toastr.info(message, "Information");
  }

}
