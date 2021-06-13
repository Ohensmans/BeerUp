import { HttpEventType } from '@angular/common/http';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { HoraireModele } from 'src/app/models/horaire-modele';
import { JourFermetureModele } from 'src/app/models/jour-fermeture-modele';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { TypesEtabModele } from 'src/app/models/types-etab-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { HorairesService } from 'src/app/services/CallApi/horaires.service';
import { JoursFermetureService } from 'src/app/services/CallApi/jours-fermeture.service';
import { OrganisationsService } from 'src/app/services/CallApi/organisations.service';
import { TypesEtabService } from 'src/app/services/CallApi/types-etab.service';
import { UploadImagesService } from 'src/app/services/CallApi/upload-images.service';
import { VatLayerService } from 'src/app/services/CallApi/vat-layer.service';
import { UtilService } from 'src/app/services/util.service';
import { ConfirmComponent } from '../../confirm/confirm.component';

@Component({
  selector: 'app-fiche-etablissement',
  templateUrl: './fiche-etablissement.component.html',
  styleUrls: ['./fiche-etablissement.component.css']
})
export class FicheEtablissementComponent implements OnInit {

  etab:EtablissementModele;
  subsr:Subscription;
  lTypeEtab:TypesEtabModele[];
  lOrganisations:OrganisationModele[];
  lHoraires:HoraireModele[];
  lJours:JourFermetureModele[];
  etabForm: FormGroup;
  noImageAvailableUrl = "";
  response!: { dbPath: ''; };

  submitted:boolean;
  messageUpload:string;
  progressUpload:number;
  validVat:boolean;

  modalRef!: BsModalRef;

  constructor(private EtablissementsSrv: EtablissementsService, private route:ActivatedRoute, private TypesEtabSrv : TypesEtabService, private formBuilder:FormBuilder,
    private upImageSrv: UploadImagesService, private util:UtilService, private modalService:BsModalService, private authSrv : AuthentificationService, 
    private orgSrv:OrganisationsService, private horaireSrv : HorairesService, private joursSrv:JoursFermetureService, private toastr:ToastrService, 
   private router : Router, private vatSrv:VatLayerService ) {

    this.etab = new EtablissementModele();
    this.subsr = new Subscription();
    this.lTypeEtab = new Array<TypesEtabModele>(0);
    this.lOrganisations = new Array<OrganisationModele>(0);
    this.lHoraires = new Array(0);
    this.lJours = new Array(0);
    this.messageUpload ="";
    this.progressUpload =0;
    this.noImageAvailableUrl = this.util.noImageAvailableUrl;
    this.submitted = false;
    this.validVat = false;
    

    this.etabForm = new FormGroup({
      etaNom:new FormControl(''),
      etaTva:new FormControl(''),
      etaRue:new FormControl(''),
      etaNum:new FormControl(''),
      etaCp:new FormControl(''),
      etaVille:new FormControl(''),
      etaPays:new FormControl(''),
      etaMail:new FormControl(''),
      etaWeb:new FormControl(''),
      etaPhoto:new FormControl(''),
      typEta:new FormControl(''),
      orgId:new FormControl('')
    })
   }

  ngOnInit(): void {
    const id = this.route.snapshot.params['id'];


    //obtient la liste de type d'établissements
    this.subsr.add(this.TypesEtabSrv.lTypesEtab$.subscribe(
      (value) => {this.lTypeEtab = value;}
    ));
    
    //obtient la liste des organisations
    this.subsr.add(this.orgSrv.lOrganisation$.subscribe(
      (value) =>{this.lOrganisations = value;}
    ));

     //obtient la liste de type des horaires
     this.subsr.add(this.horaireSrv.lHoraire$.subscribe(
      (value) => {this.lHoraires = value;}
    ));

    //obtient la liste de type des jours de fermeture
    this.subsr.add(this.joursSrv.lJours$.subscribe(
      (value) => {this.lJours = value;}
    ));

    //récupère l'établissement si il n'est pas nouveau
    if(id!="new")
    {
      this.subsr.add(this.EtablissementsSrv.getOne(id).subscribe(
        (value) => {
          this.etab = value;
          this.fillInForm();
        }
      ));
      this.horaireSrv.getAllHorairesEtab(id);
      this.joursSrv.getAllJoursEtab(id);
    }
    this.TypesEtabSrv.getAll();
    this.orgSrv.getAll();
  }

  addHoraire(){
    if (this.lHoraires.find(x => x.horId == "")==undefined){
      this.horaireSrv.addNewHoraire();
    }
    else
    {
      this.infoToastr("Veuillez créer le nouvel horaire avant d'en faire un nouveau");
    } 
  }

  addJour(){
    if (this.lJours.find(x => x.jouId == "")==undefined){
      this.joursSrv.addNewJour();
    }
    else
    {
      this.infoToastr("Veuillez créer le nouveau jour de fermeture avant d'en faire un nouveau");
    } 
  }

  isAdmin(){
    return this.authSrv.isAdmin();
  }

  fillInForm()
  {
    this.etabForm = this.formBuilder.group({
      etaNom:[this.etab.etaNom, [Validators.required, Validators.maxLength(200)]],
      etaTva:[this.etab.etaTva, [Validators.maxLength(50)]],
      etaRue:[this.etab.etaRue, [Validators.required, Validators.maxLength(200)]],
      etaNum:[this.etab.etaNum, [Validators.required, Validators.maxLength(50)]],
      etaCp:[this.etab.etaCp, [Validators.required, Validators.maxLength(50)]],
      etaVille:[this.etab.etaVille, [Validators.required, Validators.maxLength(100)]],
      etaPays:[this.etab.etaPays, [Validators.required, Validators.maxLength(50)]],
      etaMail:[this.etab.etaMail, [Validators.email ,Validators.maxLength(100)]],
      etaWeb:[this.etab.etaWeb, [Validators.pattern("^(www).([\w]+).[\w\.//]*$"), Validators.maxLength(100)]],
      etaPhoto:[this.etab.etaPhoto],
      typEta:[this.etab.typEtaId, [Validators.required]],
      orgId:[this.etab.orgId]
    })
  }

  uploadFileCheck = (files: FileList | null) =>{
    if(files==null || files.length===0){
      return;
    }
    if(!this.etab.isNew && this.etab.etaPhoto!="" && this.etab.etaPhoto!=null){
      this.confirmModifImage(files);
    }
    else{
      this.upload(files);
    }
  }

  confirmModifImage(files:FileList)
  {
        //lance le module de confirmation
        this.modalRef = this.modalService.show(ConfirmComponent, {
          initialState:{prompt: "Un établissement ne peut avoir qu'une photo, en continuant vous supprimerez la photo existante"}});
    
        this.modalRef.content.onClose$.subscribe(
          (value: boolean) =>{
            if(value){
              let path = this.etab.etaPhoto.split("\\",4)[3];
              this.upImageSrv.deleteImage(path, true).subscribe(
                () => {
                  this.upload(files);
                }
              )}}
        ); 
  }

  upload(files:FileList){
    let fileToUpload = <File>files[0];
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);
    this.upImageSrv.uploadImage(formData, true)
      .subscribe(event => {
        if (event.type === HttpEventType.UploadProgress){
          if(event.total!=undefined)
            this.progressUpload = Math.round(100 * event.loaded / event.total);
        }
        else if (event.type === HttpEventType.Response) {
          this.messageUpload = 'Chargement réussi';
          if(event.body!=null && event.body.propertyIsEnumerable('dbPath')){
            this.etab.etaPhoto = (event.body as any).dbPath;
            this.EtablissementsSrv.updateEtab(this.etab, this.etab.etaId);
          }   
        }
      });
  }


  public createImgPath = (serverPath: string) => {
    return this.util.apiUrl+`/${serverPath}`;
  }

  ngOnDestroy(){
    this.subsr.unsubscribe();
  }

  onSubmitForm(){

    this.modalRef = this.modalService.show(ConfirmComponent, {
      initialState:{prompt: "Si vous n'avez pas sauvegardé les horaires et les jours de fermeture exceptionnelle, ceux-ci ne seront pas sauvés. Souhaitez-vous continuer?"}});

    this.modalRef.content.onClose$.subscribe(
      (value: boolean) =>{
      if(value){
        this.subsr.add(this.vatSrv.validateTva(this.etabForm.value.etaTva).subscribe(
          (value) =>{
            this.validVat = value.valid;
            if(this.etabForm.valid && this.etabForm.dirty && this.validVat)
            {
              this.etab.etaNom = this.etabForm.value.etaNom;
              this.etab.etaTva = this.etabForm.value.etaTva;
              this.etab.etaRue = this.etabForm.value.etaRue;
              this.etab.etaNum = this.etabForm.value.etaNum;
              this.etab.etaCp = this.etabForm.value.etaCp;
              this.etab.etaVille = this.etabForm.value.etaVille;
              this.etab.etaPays = this.etabForm.value.etaPays;
              this.etab.etaMail = this.etabForm.value.etaMail;
              this.etab.etaWeb = this.etabForm.value.etaWeb;
              this.etab.typEtaId = this.etabForm.value.typEta;
              if(this.etab.orgId==""){
                if (this.isAdmin()){
                  this.etab.orgId = this.etabForm.value.orgId;
                }
                else{
                  this.etab.orgId = Guid.create().toString();
                }
                this.creer(); 
              }
              else
              {
                if (this.isAdmin()){
                  this.etab.orgId = this.etabForm.value.orgId;
                }
                this.sauvegarder();     
              }
              //redirige l'utilisateur lorsque la liste d'établissement est modifiée
              this.subsr.add(this.EtablissementsSrv.lEtablissement$.subscribe(
                (value)=>{
                  this.router.navigate(['Etablissements']);
                }
              ));
            }
            else{
              this.submitted = true;
            }
          }
        ));
      }
    }
    );
  }

  creer(){

    //assigne l'organisation de l'user à l'établissement
    //l'organisation des administrateurs est un guid empty
    //lorsqu'un utilisateur de l'App mobile crée une brasserie - ce même guid empty est donnée à la brasserie
    this.etab.orgId = this.authSrv.getUserOrgId().toString();
    this.EtablissementsSrv.addEtab(this.etab);
  }

  sauvegarder(){
    this.EtablissementsSrv.updateEtab(this.etab, this.etab.etaId);
  }

  infoToastr(message:string)
  {
    this.toastr.info(message, "Information");
  }

  get form() {
    return this.etabForm.controls;
  }

  get f(){
    return this.etabForm;
  }



}
