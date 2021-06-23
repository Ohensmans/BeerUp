import { Component, Input, OnInit } from '@angular/core';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { ConfirmComponent } from '../../confirm/confirm.component';

@Component({
  selector: 'app-element-liste-etab',
  templateUrl: './element-liste-etab.component.html',
  styleUrls: ['./element-liste-etab.component.css']
})


export class ElementListeEtabComponent implements OnInit{
  
  @Input() etab:EtablissementModele;
  modalRef!: BsModalRef;

  constructor(private modalService:BsModalService, private toastr:ToastrService, private EtablissementsSrv: EtablissementsService,private EtabsOrgaSrv:EtabsOrgaService,
    private authSrv:AuthentificationService ) { 
    this.etab = new EtablissementModele();
  }

  ngOnInit(): void {
  }

  activation(){
    this.etab.etaActif = !this.etab.etaActif;
    this.EtablissementsSrv.updateEtab(this.etab,this.etab.etaId);
  }

  supprimer(){
        //lance le module de confirmation
        this.modalRef = this.modalService.show(ConfirmComponent, {
          initialState:{prompt: 'Etes-vous sûr de vouloir supprimer cet établissement ?'}});
    
        this.modalRef.content.onClose$.subscribe(
          (value: boolean) =>{
          if(value){
            {
              if(this.authSrv.isAdmin()){
                this.EtablissementsSrv.deleteEtab(this.etab.etaId);
              }
              else{
                this.EtabsOrgaSrv.deleteEtab(this.etab.etaId);
              }
              
            }
          }
        }); 
  }

}
