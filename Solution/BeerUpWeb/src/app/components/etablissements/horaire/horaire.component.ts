import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { HoraireModele } from 'src/app/models/horaire-modele';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-horaire',
  templateUrl: './horaire.component.html',
  styleUrls: ['./horaire.component.css']
})
export class HoraireComponent implements OnInit {

  @Input() horaire:HoraireModele;
  lJoursSemaine:Array<string>;

  modalRef!: BsModalRef;
  horaireForm: FormGroup;

  constructor(private util:UtilService, private formBuilder:FormBuilder, private modalService:BsModalService, private toastr:ToastrService) { 
    this.horaire = new HoraireModele();
    this.lJoursSemaine = this.util.joursSemaine;
    this.horaireForm = new FormGroup({
      horJour: new FormControl(''),
      horDebut: new FormControl(''),
      horFin: new FormControl(''),
    })
  }

  ngOnInit(): void {
    this.horaireForm = this.formBuilder.group({
      horJour: [this.horaire.horJour],
      horDebut: [this.horaire.horDebut],
      horFin: [this.horaire.horFin]
    });
  }

  isNew(){
    if(this.horaire.horId==""){
      return true;
    }
    return false;
  }

  creer(){

  }

  sauvegader(){

  }

  supprimer(){

  }

  getClass() {
    if (this.horaireForm.invalid) return "bg-danger text-white";
    else return "";
  }

}
