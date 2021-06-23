import { Component, Input, OnInit } from '@angular/core';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { UploadImagesService } from 'src/app/services/CallApi/upload-images.service';
import { UtilService } from 'src/app/services/util.service';
import { ConfirmComponent } from '../../confirm/confirm.component';

@Component({
  selector: 'app-element-biere',
  templateUrl: './element-biere.component.html',
  styleUrls: ['./element-biere.component.css']
})
export class ElementBiereComponent implements OnInit {

  @Input() biere:BiereModele;
  @Input() lEtabs:Array<EtablissementModele>;
  modalRef!: BsModalRef;
  etabNom:string;

  constructor(private modalService:BsModalService, private toastr:ToastrService, private BiereSrv: BieresService, private EtabsOrgaSrv: EtabsOrgaService, 
    private authSrv : AuthentificationService, private etabSrv: EtablissementsService, private util:UtilService, 
    private BieresOrgaSrv:BieresOrgaService,private imageSrv: UploadImagesService) { 
    this.biere = new BiereModele(this.util);
    this.lEtabs = new Array(0);
    this.etabNom = "";
  }

  ngOnInit(): void {

    if(this.authSrv.isAdmin()){
      this.etabSrv.lEtablissement$.subscribe(
        (value)=>{
          this.lEtabs = value;
          this.getNomEtab()
        }
      )
    }
    else{
      this.EtabsOrgaSrv.lAllEtabsOrga$.subscribe(
        (value)=>{
          this.lEtabs = value;
          this.getNomEtab()
        }
      )
    }
  }


  getNomEtab(){
    let index = this.lEtabs.findIndex(e => e.etaId == this.biere.etaId);
    if(index==-1){
      this.etabNom = "Une erreur est survenue, veuillez contacter un administrateur";
    }
    else{
      this.etabNom = this.lEtabs[index].etaNom;
    }
  }


  activation(){
    this.biere.bieActif = !this.biere.bieActif;
    this.BiereSrv.updateBiere(this.biere, this.biere.bieId);
  }

  validation(){
    this.biere.bieValide = !this.biere.bieValide;
    this.BiereSrv.updateBiere(this.biere, this.biere.bieId);
  }

  supprimer(){
        //lance le module de confirmation
        this.modalRef = this.modalService.show(ConfirmComponent, {
          initialState:{prompt: 'Etes-vous sûr de vouloir supprimer cette bière ?'}});
    
        this.modalRef.content.onClose$.subscribe(
          (value: boolean) =>{
          if(value){
            {
              if(this.biere.biePhoto!=null && this.biere.biePhoto!=''){
              this.imageSrv.deleteImage(this.biere.biePhoto, this.biere.bieId,false).subscribe((value)=>{
                this.supprimerBiere();
              });
            }
              else{
                this.supprimerBiere();
              } 
            }
          }
        }); 
  }
  supprimerBiere(){
    if(this.authSrv.isAdmin()){
      this.BiereSrv.deleteBiere(this.biere.bieId);
      }
      else{
      this.BieresOrgaSrv.deleteBiere(this.biere.bieId);
      }
  }
}
