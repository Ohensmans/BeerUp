import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Guid } from 'guid-typescript';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { AdresseFacturationModele } from 'src/app/models/adresse-facturation-modele';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AdressesFacturationService } from 'src/app/services/CallApi/adresses-facturation.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-adresse-facturation',
  templateUrl: './adresse-facturation.component.html',
  styleUrls: ['./adresse-facturation.component.css']
})
export class AdresseFacturationComponent implements OnInit {

  @Input() lAdresses:Array<AdresseFacturationModele>;
  @Input() lastAdresse:AdresseFacturationModele;
  @Input() orgId:string;
  adresse:AdresseFacturationModele;

  adresseForm: FormGroup;
  submitted:boolean;
  showExisting:boolean;
  create:boolean;


  constructor( private authSrv : AuthentificationService, private toastr:ToastrService, private util : UtilService, private formBuilder:FormBuilder, 
    private adrSrv:AdressesFacturationService) { 
      this.lastAdresse = new AdresseFacturationModele();
      this.lAdresses = Array(0);
      this.adresse = new AdresseFacturationModele();
      this.submitted = false;
      this.showExisting = false;
      this.create = false;
      this.orgId ="";

      this.adresseForm = new FormGroup({
        adrRue:new FormControl(''),
        adrNum:new FormControl(''),
        adrCp:new FormControl(''),
        adrVille:new FormControl(''),
        adrPays:new FormControl(''),
      })
    }

  noLastAdresse(){
    if(this.lastAdresse == undefined || this.lastAdresse.adrFacId == ""){
      return true;
    }
    return false;
  }

  notEmptyAdresseListe(){
    if(this.lAdresses.length ==0){
      return false;
    }
    return true;
  }

  showExistingSwitch(){
    this.showExisting = !this.showExisting;
    this.create = false;
    if(this.showExisting){
      this.adresse = this.lAdresses[0];
    }
    this.ngOnInit();
  }

  ngOnInit(): void {

    if(!this.noLastAdresse() && !this.create && !this.showExisting){
      this.adresse = this.lastAdresse;
    }

    this.adresseForm = this.formBuilder.group({
      adrRue:[this.adresse.adrFacRue, [Validators.required, Validators.maxLength(200)]],
      adrNum:[this.adresse.adrFacNum, [Validators.required, Validators.maxLength(50)]],
      adrCp:[this.adresse.adrFacCp, [Validators.required, Validators.maxLength(50)]],
      adrVille:[this.adresse.adrFacVil, [Validators.required, Validators.maxLength(100)]],
      adrPays:[this.adresse.adrFacPays, [Validators.required, Validators.maxLength(50)]],
      });

    this.adrSrv.updateChoosenAdresse(this.adresse);
  }

  onSubmitForm(){
    if(this.adresseForm.valid && this.adresseForm.dirty)
    {
      this.adresse.adrFacRue = this.adresseForm.value.adrRue;
      this.adresse.adrFacNum = this.adresseForm.value.adrNum;
      this.adresse.adrFacCp = this.adresseForm.value.adrCp;
      this.adresse.adrFacVil = this.adresseForm.value.adrVille;
      this.adresse.adrFacPays = this.adresseForm.value.adrPays;
      this.adresse.adrFacId = Guid.create().toString();
      this.adresse.orgId = this.orgId;
      this.createNewAdresse();
    }
    else{
      this.submitted = true;
    }
  }

  get form() {
    return this.adresseForm.controls;
  }

  get f(){
    return this.adresseForm;
  }

  createNewAdresse(){
    this.adrSrv.addAdresse(this.adresse).subscribe(
      (value)=>{
        this.ngOnInit();
      }
    );
    
  }

  selectLastAdresse(){
    this.create = false;
    this.showExisting = false;
    this.ngOnInit();
  }

  selectAmongExisting(adrId:string){
    let index = this.lAdresses.findIndex(a => a.adrFacId == adrId);
    if(index!=-1){
      this.adresse = this.lAdresses[index];
      this.ngOnInit();
    }
  }

  isOld(){
    if(this.adresse.adrFacId!=""){
      return true;
    }
    return false;
  }

  selectedNew(){
    this.create = true;
    this.showExisting=false;
    this.adresse = new AdresseFacturationModele();
    this.ngOnInit();
  }




}
