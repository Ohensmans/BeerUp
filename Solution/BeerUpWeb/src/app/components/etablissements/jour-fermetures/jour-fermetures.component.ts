import { DatePipe } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Guid } from 'guid-typescript';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { JourFermetureModele } from 'src/app/models/jour-fermeture-modele';
import { JoursFermetureService } from 'src/app/services/CallApi/jours-fermeture.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-jour-fermetures',
  templateUrl: './jour-fermetures.component.html',
  styleUrls: ['./jour-fermetures.component.css']
})
export class JourFermeturesComponent implements OnInit {

  @Input() jour:JourFermetureModele;
  @Input() eta:EtablissementModele;

  modalRef!: BsModalRef;
  jourForm: FormGroup;
  dateMin:string;

  constructor(private util:UtilService, private formBuilder:FormBuilder, private modalService:BsModalService, private toastr:ToastrService, 
    private jourSrv : JoursFermetureService, private datePipe: DatePipe) { 
    this.jour = new JourFermetureModele();
    this.eta = new EtablissementModele();
    this.dateMin = new Date().toISOString().substr(0, 10);
    this.jourForm = new FormGroup({
      jouDate: new FormControl(''),
    })
  }

  ngOnInit(): void {
    this.jourForm = this.formBuilder.group({
      jouDate: [this.jour.jouDate.toString().substr(0, 10), [Validators.required]]
    });
    this.jour.etaId = this.eta.etaId;
  }

  isNew(){
    if(this.jour.jouId==""){
      return true;
    }
    return false;
  }

  creer(){
    this.jourSrv.addJour(this.jour);
  }

  sauvegarder(){
    this.jourSrv.updateJour(this.jour, this.jour.jouId);
  }

  supprimer(){
    this.jourSrv.deleteJour(this.jour.jouId);
  }

  getClass() {
    if (this.jourForm.invalid) return "bg-danger text-white";
    else return "";
  }

  onSubmitForm(){
    if(this.jourForm.valid && this.jourForm.dirty)
    {
      this.jour.jouDate = this.jourForm.value.jouDate;

      if(this.isNew())
      {
        this.jour.jouId = Guid.create().toString();
        this.creer();      
      }
      else
      {
        this.sauvegarder();     
      }
    }
    if(this.jourForm.invalid)
    {
      this.toastrInvalid();
    }
  }

  toastrInvalid(){
    let message="";

    if (this.jourForm.get("jouDate")?.invalid){
      message = "Le jour doit être complété";
      this.dangerToastr(message);
    }
  }

  dangerToastr(message:string)
  {
    this.toastr.error(message, "Jour de fermeture non-valide");
  }

}
