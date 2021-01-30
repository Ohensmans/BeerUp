import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { JourFermetureModele } from 'src/app/models/jour-fermeture-modele';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-jour-fermetures',
  templateUrl: './jour-fermetures.component.html',
  styleUrls: ['./jour-fermetures.component.css']
})
export class JourFermeturesComponent implements OnInit {

  @Input() jour:JourFermetureModele;

  modalRef!: BsModalRef;
  jourForm: FormGroup;

  constructor(private util:UtilService, private formBuilder:FormBuilder, private modalService:BsModalService, private toastr:ToastrService) { 
    this.jour = new JourFermetureModele();
    this.jourForm = new FormGroup({
      horJour: new FormControl(''),
      horDebut: new FormControl(''),
      horFin: new FormControl(''),
    })
  }

  ngOnInit(): void {
    this.jourForm = this.formBuilder.group({
      jouDate: [this.jour.jouDate]
    });
  }

  isNew(){
    if(this.jour.jouId==""){
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
    if (this.jourForm.invalid) return "bg-danger text-white";
    else return "";
  }

}
