import { HttpEventType } from '@angular/common/http';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Guid } from 'guid-typescript';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { AvisBiereLessThanXWithValueDirective } from 'src/app/directives/validators/avis-biere-less-thanX-with-value.directive';
import { AvisBiereUserModele } from 'src/app/models/avis-biere-user-modele';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { TypesBieresModele } from 'src/app/models/types-biere-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AvisBiereUserService } from 'src/app/services/CallApi/avis-biere-user.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { TypesBiereService } from 'src/app/services/CallApi/types-biere.service';
import { UploadImagesService } from 'src/app/services/CallApi/upload-images.service';
import { UtilService } from 'src/app/services/util.service';
import { ConfirmComponent } from '../../confirm/confirm.component';

@Component({
  selector: 'app-fiche-biere',
  templateUrl: './fiche-biere.component.html',
  styleUrls: ['./fiche-biere.component.css']
})
export class FicheBiereComponent implements OnInit, OnDestroy {

  subscr:Subscription;
  
  biere:BiereModele;
  avis:AvisBiereUserModele;
  lEtabOrga: EtablissementModele[];
  lTypeBiere:TypesBieresModele[];
  biereForm: FormGroup;
  progressUpload:number;
  messageUpload:string;
  submitted:boolean;
  noteMax:number;
  nbMiniAvis:number;
  noImageAvailableUrl:string;

  modalRef!: BsModalRef;

  constructor(private route:ActivatedRoute, private authSrv: AuthentificationService, private biereSrv : BieresService, private etabSrv : EtablissementsService,
    private etabOrgaSrv : EtabsOrgaService, private typesBiereSrv : TypesBiereService, private formBuilder:FormBuilder, 
    private upImageSrv: UploadImagesService, private util:UtilService, private modalService:BsModalService, private AvisSrv : AvisBiereUserService,
    private toastr:ToastrService, private router : Router) { 
    
    this.biere = new BiereModele(util);
    this.avis = new AvisBiereUserModele();
    this.lEtabOrga = new Array<EtablissementModele>();
    this.lTypeBiere = new Array<TypesBieresModele>();
    this.subscr = new Subscription();
    this.progressUpload = 0;
    this.messageUpload ="";
    this.submitted = false;
    this.noteMax = this.util.NoteMAX;
    this.noImageAvailableUrl = this.util.noImageAvailableUrl;
    this.nbMiniAvis = this.util.nombreMiniNotesAvis;

    
    this.biereForm = new FormGroup({
      etaId:new FormControl(''),
      typBieId:new FormControl(''),
      bieNom:new FormControl(''),
      bieDesc:new FormControl(''),
      biePhoto:new FormControl(''),
      bieDegreAlcool:new FormControl(''),
      avisAcid:new FormControl(''),
      avisCafe:new FormControl(''),
      avisCara:new FormControl(''),
      avisFruit:new FormControl(''),
      avisHoub:new FormControl(''),
      avisMalt:new FormControl(''),
      avisSucr:new FormControl(''),
      avisAmer:new FormControl(''),
    });
  }

  //initialise les abonnements aux observables, le formulaire et lance les requêtes get
  ngOnInit(): void {
    const id = this.route.snapshot.params['id'];

    if(this.authSrv.isAdmin()){
      this.subscr.add(this.etabSrv.lEtablissement$.subscribe(
        (value)=> {
          this.lEtabOrga = value;
        }
      ));
      this.etabSrv.getAll();
    }
    else{
      this.subscr.add(this.etabOrgaSrv.lAllEtabsOrga$.subscribe(
        (value)=>{
          this.lEtabOrga = value;
        }
      ));
      const id = this.authSrv.getUserOrgId();
      this.etabOrgaSrv.getAll(false, id);
    }

    this.subscr.add(this.typesBiereSrv.lTypesBiere$.subscribe(
      (value)=> {
        this.lTypeBiere = value;
      }
    ));
      this.typesBiereSrv.getAll();

  if(id!="new")
  {
    this.subscr.add(this.biereSrv.getOne(id).subscribe(
      (value) => {
        this.biere = value;
        this.subscr.add(this.AvisSrv.getOne(id).subscribe(
          (value) => {
            this.avis = value;
            this.fillInForm();
          }
        ))
        
      }
    ));
  }
  else{
    this.fillInForm();
  }
}

//initialise le formulaire et les validators
fillInForm()
{
  this.biereForm = this.formBuilder.group({
    etaId:[this.biere.etaId,[Validators.required]],
    typBieId:[this.biere.typBieId,[Validators.required]],
    bieNom:[this.biere.bieNom,[Validators.required, Validators.maxLength(100)]],
    bieDesc:[this.biere.bieDesc, [ Validators.maxLength(1000)]],
    biePhoto:[this.biere.biePhoto],
    bieDegreAlcool:[this.biere.bieDegreAlcool, [Validators.required, Validators.min(0)]],
    avisAcid:[this.avis.avisAcid, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisCafe:[this.avis.avisCafe, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisCara:[this.avis.avisCara, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisFruit:[this.avis.avisFruit, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisHoub:[this.avis.avisHoub, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisMalt:[this.avis.avisMalt, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisSucr:[this.avis.avisSucr, [Validators.required, Validators.min(0), Validators.max(5)]],
    avisAmer:[this.avis.avisSucr, [Validators.required, Validators.min(0), Validators.max(5)]],
  }, { validators: AvisBiereLessThanXWithValueDirective(this.nbMiniAvis) });
}

uploadFileCheck = (files: FileList | null) =>{
  if(files==null || files.length===0){
    return;
  }
  if(!this.isNew() && this.biere.biePhoto!="" && this.biere.biePhoto!=null){
    this.confirmModifImage(files);
  }
  else{
    this.upload(files);
  }
}

//demande de confirmation pour les images
confirmModifImage(files:FileList)
{
      //lance le module de confirmation
      this.modalRef = this.modalService.show(ConfirmComponent, {
        initialState:{prompt: "Une bière ne peut avoir qu'une photo, en continuant vous supprimerez la photo existante"}});
  
      this.modalRef.content.onClose$.subscribe(
        (value: boolean) =>{
          if(value){
            let path = this.biere.biePhoto.split("\\",4)[3];
            this.upImageSrv.deleteImage(path, false).subscribe(
              () => {
                this.upload(files);
              }
            )}}
      ); 
}

//chargement des photos
upload(files:FileList){
  let fileToUpload = <File>files[0];
  const formData = new FormData();
  formData.append('file', fileToUpload, fileToUpload.name);
  this.upImageSrv.uploadImage(formData, false)
    .subscribe(event => {
      if (event.type === HttpEventType.UploadProgress){
        if(event.total!=undefined)
          this.progressUpload = Math.round(100 * event.loaded / event.total);
      }
      else if (event.type === HttpEventType.Response) {
        this.messageUpload = 'Chargement réussi';
        if(event.body!=null && event.body.propertyIsEnumerable('dbPath')){
          this.biere.biePhoto = (event.body as any).dbPath;
          this.biereSrv.updateBiere(this.biere, this.biere.bieId);
        }   
      }
    });
}


public createImgPath = (serverPath: string) => {
  return this.util.apiUrl+`/${serverPath}`;
}

ngOnDestroy(){
  this.subscr.unsubscribe();
}

creer(){

  this.biere.bieValide = true;
  this.biere.bieActif = true;
  this.subscr.add(this.biereSrv.addBiere(this.biere).subscribe(
    (value) => {
      this.avis.bieId = this.biere.bieId;
      this.subscr.add(this.AvisSrv.addAvis(this.avis).subscribe(
        (value) => {
          this.router.navigate(['Bieres']);
        }
      ));
    }
  ));
}

sauvegarder(){
  this.biereSrv.updateBiere(this.biere, this.biere.bieId);
  this.avis.bieId = this.biere.bieId;
  
  this.subscr.add(this.AvisSrv.addAvis(this.avis).subscribe(
    (value) => {
      this.router.navigate(['Bieres']);
    }
  ));
}

isNew(){
    if(this.biere.bieId==""){
        return true;
    }
    return false;
}


onSubmitForm(){
  if(this.biereForm.valid && this.biereForm.dirty)
  {
    this.biere.etaId = this.biereForm.value.etaId;
    this.biere.typBieId = this.biereForm.value.typBieId;
    this.biere.bieNom = this.biereForm.value.bieNom;
    this.biere.bieDesc = this.biereForm.value.bieDesc;
    this.biere.biePhoto = this.biereForm.value.biePhoto;
    this.biere.bieDegreAlcool = this.biereForm.value.bieDegreAlcool;
    this.avis.avisAcid = this.biereForm.value.avisAcid;
    this.avis.avisCafe = this.biereForm.value.avisCafe;
    this.avis.avisCara = this.biereForm.value.avisCara;
    this.avis.avisFruit = this.biereForm.value.avisFruit;
    this.avis.avisHoub = this.biereForm.value.avisHoub;
    this.avis.avisMalt = this.biereForm.value.avisMalt;
    this.avis.avisSucr = this.biereForm.value.avisSucr;
    this.avis.avisAmer = this.biereForm.value.avisAmer;
    this.avis.aviBieUserDateAvis = new Date();
    this.avis.userId = this.authSrv.getUserId().toString();
    this.avis.orgId = this.authSrv.getUserOrgId.toString();
    this.avis.aviBieUserId = Guid.create().toString();
    this.avis.aviBieUserActif = true;
    
    if(this.isNew())
    {
      this.biere.bieId = Guid.create().toString();
      this.creer();      
    }
    else
    {
      this.sauvegarder();     
    }
  }
  else{
    this.submitted = true;
    this.toastrInvalid();
  }
}

get form() {
  return this.biereForm.controls;
}

resetAvis(){
  this.biereForm.controls['avisAcid'].setValue(0);
  this.biereForm.controls['avisCafe'].setValue(0);
  this.biereForm.controls['avisCara'].setValue(0);
  this.biereForm.controls['avisFruit'].setValue(0);
  this.biereForm.controls['avisHoub'].setValue(0);
  this.biereForm.controls['avisMalt'].setValue(0);
  this.biereForm.controls['avisSucr'].setValue(0);
  this.biereForm.controls['avisAmer'].setValue(0);
}

dangerToastr(message:string)
{
  this.toastr.error(message, "Horaire non-valide");
}

toastrInvalid(){
  let message="";

  if(this.biereForm.errors?.AvisBiereLessThanXWithValue.value!=null){
    message ="Il faut au minimum "+ this.nbMiniAvis+" saveurs avec une cote supérieure à 0";
    this.dangerToastr(message);
  }
  
}
     
}

