import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Guid } from 'guid-typescript';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { TypeServicesModele } from 'src/app/models/type-services-modele';
import { VenteBiereEtaModele } from 'src/app/models/vente-biere-eta-modele';
import { BieresEtabService } from 'src/app/services/CallApi/bieres-etab.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { TypesServicesService } from 'src/app/services/CallApi/types-services.service';
import { VenteBieresEtaService } from 'src/app/services/CallApi/vente-bieres-eta.service';
import { ConfirmComponent } from '../../confirm/confirm.component';

@Component({
  selector: 'app-element-liste-biere',
  templateUrl: './element-liste-biere.component.html',
  styleUrls: ['./element-liste-biere.component.css']
})
export class ElementListeBiereComponent implements OnInit {

  lAllBi:Array<BiereModele>;
  lAllBiOrga:Array<BiereModele>;
  lTypesSrv:Array<TypeServicesModele>;
  lVenteEtab:Array<VenteBiereEtaModele>;
  
  @Input() vente:VenteBiereEtaModele;
  @Input() etaId:string;

  modalRef!: BsModalRef;
  bieresEtabForm:FormGroup;
  subscr:Subscription;

  constructor(private venteBiereSrv:VenteBieresEtaService, private modalService:BsModalService,private toastr:ToastrService, private formBuilder:FormBuilder,
    private biereSrv:BieresService, private biereOrgaSrv:BieresOrgaService, private bieresEtabSrv: BieresEtabService, private typeServiceSrv : TypesServicesService) { 
    this.vente = new VenteBiereEtaModele();
    this.lAllBi = Array(0);
    this.lAllBiOrga = Array(0);
    this.lVenteEtab = Array(0);
    this.lTypesSrv = Array(0);
    this.etaId = "";
    this.subscr = new Subscription();

    this.bieresEtabForm = new FormGroup({
      biere: new FormControl(''),
      typeSrv: new FormControl(''),
    });

  }

  ngOnInit(): void {
    
    this.subscr.add(this.biereOrgaSrv.lAllBieresOrga$.subscribe(
      (value)=> {
        this.lAllBiOrga = value;
        
        this.subscr.add(this.biereSrv.lBiere$.subscribe(
          (value)=>{
            if(this.lAllBiOrga.length!=0){
              this.lAllBiOrga.forEach(element => {
                if(this.lVenteEtab.findIndex(b => b.bieId == element.bieId)==-1)
                  this.lAllBi.push(element);
              })
            }
            else{
              this.lAllBi = value;
              }
          } 
        ));
      }
    ));

    this.subscr.add(this.venteBiereSrv.lVentesBieresEtab$.subscribe(
      (value)=> {
        this.lVenteEtab = value;
        this.lVenteEtab.forEach(element =>{
          let index = this.lAllBi.findIndex(b => b.bieId == element.bieId)
          if(index!=-1)
          {
            this.lAllBi.slice(index,1);
          }
        })
      }
    ));

    this.subscr.add(this.typeServiceSrv.lTypesService$.subscribe(
      (value)=>{
        this.lTypesSrv = value;
      }
    ));

    this.typeServiceSrv.getAll(); 

    this.bieresEtabForm = this.formBuilder.group({
      biere: [this.vente.bieId, [Validators.required]],
      typeSrv: [this.vente.typServId, [Validators.required]]
    });
    
    
  }

  isNew(){
    if(this.vente.venteBiereEtaId==""){
      return true;
    }
    return false;
  }

  creer(){
    this.venteBiereSrv.addVenteBieresParEtab(this.vente)
  }

  sauvegarder(){
    this.venteBiereSrv.updateVenteBieresParEtab(this.vente, this.vente.venteBiereEtaId)
  }

  supprimer(){
    //lance le module de confirmation
    this.modalRef = this.modalService.show(ConfirmComponent, {
      initialState:{prompt: 'Etes-vous sûr de vouloir supprimer la vente de cette bière ?'}});

    this.modalRef.content.onClose$.subscribe(
      (value: boolean) =>{
      if(value){
            if(this.isNew()){
              this.venteBiereSrv.deleteVenteBieresParEtabObs(this.vente.venteBiereEtaId);
            }
            else{
              this.venteBiereSrv.deleteVenteBieresParEtab(this.vente.venteBiereEtaId);
            }
          }
      }); 
  }

  getClass() {
    if (this.bieresEtabForm.invalid) return "bg-danger text-white";
    else return "";
  }

  getStyleBiere(){
    if (this.lAllBiOrga.includes(this.bieresEtabForm.value.biere)) 
      return "text-primary";
    else 
      return "";
  }

  onSubmitForm(){
    if(this.bieresEtabForm.valid && this.bieresEtabForm.dirty)
    {
      this.vente.bieId = this.bieresEtabForm.value.biere;
      this.vente.etaId = this.etaId;
      this.vente.typServId = this.bieresEtabForm.value.typeSrv; 

      if(this.isNew())
      {
        this.vente.venteBiereEtaId = Guid.create().toString();
        this.creer();      
      }
      else
      {
        this.sauvegarder();     
      }
    }
    if(this.bieresEtabForm.invalid)
    {
      this.toastrInvalid();
    }
  }

  toastrInvalid(){
    let message="";

    if (this.bieresEtabForm.get("biere")?.invalid){
      message = "La bière doit être spécifiée";
      this.dangerToastr(message);
    }
    if (this.bieresEtabForm.get("typeSrv")?.invalid){
      message ="Le type de service doit être spécifié";
      this.dangerToastr(message);
    }
    
  }

  dangerToastr(message:string)
  {
    this.toastr.error(message, "Horaire non-valide");
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }



  

}
