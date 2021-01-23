import { HttpEventType } from '@angular/common/http';
import { ThrowStmt } from '@angular/compiler';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { TypesEtabModele } from 'src/app/models/types-etab-modele';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { TypesEtabService } from 'src/app/services/CallApi/types-etab.service';
import { UploadImagesService } from 'src/app/services/CallApi/upload-images.service';
import { UtilService } from 'src/app/services/util.service';

@Component({
  selector: 'app-fiche-etablissement',
  templateUrl: './fiche-etablissement.component.html',
  styleUrls: ['./fiche-etablissement.component.css']
})
export class FicheEtablissementComponent implements OnInit {

  etab:EtablissementModele;
  subsr:Subscription;
  lTypeEtab:TypesEtabModele[];
  etabForm: FormGroup;
  noImageAvailableUrl = "";
  response!: { dbPath: ''; };

  messageUpload:string;
  progressUpload:number;

  constructor(private EtablissementsSrv: EtablissementsService, private route:ActivatedRoute, private TypesEtabSrv : TypesEtabService, private formBuilder:FormBuilder,
    private upImageSrv: UploadImagesService, private util:UtilService, ) {
    this.etab = new EtablissementModele();
    this.subsr = new Subscription();
    this.lTypeEtab = new Array<TypesEtabModele>(0);
    this.messageUpload ="";
    this.progressUpload =0;
    this.noImageAvailableUrl = this.util.noImageAvailableUrl;

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
    })
   }

  ngOnInit(): void {
    const id = this.route.snapshot.params['id'];

    //récupère l'établissement si il n'est pas nouveau
    if(id!="new")
    {
      this.subsr.add(this.EtablissementsSrv.getOne(id).subscribe(
        (value) => {
          this.etab = value;
          this.fillInForm();
        }
      ));
    }

    //obtient la liste de type d'établissements
    this.subsr.add(this.TypesEtabSrv.lTypesEtab$.subscribe(
      (value) => {this.lTypeEtab = value}
    ));
    this.TypesEtabSrv.getAll();
    this.etab;

  }

  fillInForm()
  {
    this.etabForm = this.formBuilder.group({
      etaNom:[this.etab.etaNom],
      etaTva:[this.etab.etaTva],
      etaRue:[this.etab.etaRue],
      etaNum:[this.etab.etaNum],
      etaCp:[this.etab.etaCp],
      etaVille:[this.etab.etaVille],
      etaPays:[this.etab.etaPays],
      etaMail:[this.etab.etaMail],
      etaWeb:[this.etab.etaWeb],
      etaPhoto:[this.etab.etaPhoto],
      typEta:[this.etab.typEtaId]
    })
  }

  uploadFile = (files: FileList | null) =>{
    if(files==null || files.length===0){
      return;
    }
    let fileToUpload = <File>files[0];
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);
    this.upImageSrv.uploadEtab(formData)
      .subscribe(event => {
        if (event.type === HttpEventType.UploadProgress){
          if(event.total!=undefined)
            this.progressUpload = Math.round(100 * event.loaded / event.total);
        }
        else if (event.type === HttpEventType.Response) {
          this.messageUpload = 'Chargement réussi';
          if(event.body!=null && event.body.propertyIsEnumerable('dbPath')){
            this.etab.etaPhoto = (event.body as any).dbPath;
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

  onSubmitForm(){}



}
