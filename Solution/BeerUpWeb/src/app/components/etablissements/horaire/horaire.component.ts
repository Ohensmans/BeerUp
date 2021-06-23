import { formatDate } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Guid } from 'guid-typescript';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { JoinScheduleDirective } from 'src/app/directives/validators/join-schedule.directive';
import { TimeDebEqualTimeFinDirective } from 'src/app/directives/validators/time-deb-equal-time-fin.directive';
import { TimeDebutIsOlderDirective } from 'src/app/directives/validators/time-debut-is-older.directive';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { HoraireModele } from 'src/app/models/horaire-modele';
import { HorairesService } from 'src/app/services/CallApi/horaires.service';
import { UtilService } from 'src/app/services/util.service';
import { ConfirmComponent } from '../../confirm/confirm.component';

@Component({
  selector: 'app-horaire',
  templateUrl: './horaire.component.html',
  styleUrls: ['./horaire.component.css']
})
export class HoraireComponent implements OnInit {

  @Input() horaire:HoraireModele;
  @Input() lHoraires:Array<HoraireModele>;
  
  @Input() eta:EtablissementModele;
  lJoursSemaine:Array<string>;
  estNew:Boolean;

  modalRef!: BsModalRef;
  horaireForm: FormGroup;

  constructor(private util:UtilService, private formBuilder:FormBuilder, private modalService:BsModalService, private toastr:ToastrService, 
    private horaireSrv : HorairesService) { 
    this.horaire = new HoraireModele();
    this.lHoraires = new Array(0);
    this.eta = new EtablissementModele;
    this.lJoursSemaine = this.util.joursSemaine;
    this.horaireForm = new FormGroup({
      horJour: new FormControl(''),
      horDebut: new FormControl(''),
      horFin: new FormControl(''),
      horId: new FormControl(''),
    });
    this.estNew = false;
  }

  ngOnInit(): void {

    this.horaireForm = this.formBuilder.group({
      horJour: [this.horaire.horJour,[Validators.required]],
      horDebut: [this.horaire.horDebut,[Validators.required]],
      horFin: [this.horaire.horFin,[Validators.required]],
      horId:[this.horaire.horId],
    }, { validators: [TimeDebutIsOlderDirective(), TimeDebEqualTimeFinDirective(), JoinScheduleDirective(this.lHoraires)] });
    this.horaire.etaId = this.eta.etaId;
    if(this.horaire.horId==""){
      this.estNew = true;
    }
    
  }

  isNew(){
    return this.estNew;
  }

  creer(){
    this.horaireSrv.addHoraire(this.horaire);
    this.estNew = false;
    this.toastrCreate();
  }

  sauvegarder(){
    this.horaireSrv.updateHoraire(this.horaire, this.horaire.horId);
    this.toastrSave();
  }

  supprimer(){
    //lance le module de confirmation
    this.modalRef = this.modalService.show(ConfirmComponent, {
      initialState:{prompt: 'Etes-vous sûr de vouloir supprimer cet horaire ?'}});

    this.modalRef.content.onClose$.subscribe(
      (value: boolean) =>{
      if(value){
            if(this.isNew()){
              this.horaireSrv.deleteHoraireObs(this.horaire.horId);
            }
            else{
              this.horaireSrv.deleteHoraire(this.horaire.horId);
            }
          }
      }); 
  }

  getClass() {
    if (this.horaireForm.invalid) return "bg-danger text-white";
    else return "";
  }

  onSubmitForm(){
    if(this.horaireForm.valid && this.horaireForm.dirty)
    {
      this.horaire.horDebut = this.horaireForm.value.horDebut;
      this.horaire.horFin = this.horaireForm.value.horFin;
      this.horaire.horJour = this.horaireForm.value.horJour; 

      if(this.isNew())
      {
        this.horaire.horId = Guid.create().toString();     
        this.creer();
      }
      else
      {
        this.sauvegarder();     
      }
    }
    if(this.horaireForm.invalid)
    {
      this.toastrInvalid();
    }
  }



  toastrInvalid(){
    let message="";

    if (this.horaireForm.get("horDebut")?.invalid){
      message = "L'horaire d'ouverture doit être spécifié";
      this.dangerToastr(message);
    }
    if (this.horaireForm.get("horFin")?.invalid){
      message ="L'horaire de fermeture doit être spécifié";
      this.dangerToastr(message);
    }
    if (this.horaireForm.get("horJour")?.invalid){
      message ="Le jour doit être spécifié";
      this.dangerToastr(message);
    }
    if(this.horaireForm.errors!=null && this.horaireForm.errors.timeDebutIsOlder!=null &&this.horaireForm.errors.timeDebutIsOlder.value){
      message ="L'horaire d'ouverture doit précéder l'heure de fermeture";
      this.dangerToastr(message);
    }

    if(this.horaireForm.errors!=null && this.horaireForm.errors.timeDebutIsEqualTimeFin!=null && this.horaireForm.errors.timeDebutIsEqualTimeFin.value){
      message ="L'horaire d'ouverture ne doit pas être égal à l'heure de fermeture";
      this.dangerToastr(message);
    }

    if(this.horaireForm.errors!=null && this.horaireForm.errors.joinSchedule!=null && this.horaireForm.errors.joinSchedule.value){
      message ="Les horaires ne peuvent pas se chevaucher";
      this.dangerToastr(message);
    }
    
  }

  toastrSave(){
    let message="Horaire modifié";
    this.successToastr(message);
  }

  toastrCreate(){
    let message="Horaire créé";
    this.successToastr(message);
  }
  

  dangerToastr(message:string)
  {
    this.toastr.error(message, "Horaire non-valide");
  }

  successToastr(message:string)
  {
    this.toastr.success(message, "Félicitations");
  }


}
