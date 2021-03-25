import { HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { loadStripe } from '@stripe/stripe-js';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { AchatVuesModele } from 'src/app/models/achat-vues-modele';
import { AdresseFacturationModele } from 'src/app/models/adresse-facturation-modele';
import { BiereModele } from 'src/app/models/BiereModele';
import { EtablissementModele } from 'src/app/models/etablissement-modele';
import { FactureModele } from 'src/app/models/facture-modele';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { Status } from 'src/app/models/status';
import { TarifModele } from 'src/app/models/tarif-modele';
import { TransactionModele } from 'src/app/models/transaction-modele';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { AchatVueService } from 'src/app/services/CallApi/achat-vue.service';
import { AdressesFacturationService } from 'src/app/services/CallApi/adresses-facturation.service';
import { BieresOrgaService } from 'src/app/services/CallApi/bieres-orga.service';
import { BieresService } from 'src/app/services/CallApi/bieres.service';
import { EtablissementsService } from 'src/app/services/CallApi/etablissements.service';
import { EtabsOrgaService } from 'src/app/services/CallApi/etabs-orga.service';
import { FacturesService } from 'src/app/services/CallApi/factures.service';
import { MollieService } from 'src/app/services/CallApi/mollie.service';
import { OrganisationsService } from 'src/app/services/CallApi/organisations.service';
import { StripeService } from 'src/app/services/CallApi/stripe.service';
import { TarifsBieresService } from 'src/app/services/CallApi/tarifs-bieres.service';
import { TarifsEtabsService } from 'src/app/services/CallApi/tarifs-etabs.service';
import { TransactionsService } from 'src/app/services/CallApi/transactions.service';
import { VuesAchatBiereService } from 'src/app/services/CallApi/vues-achat-biere.service';
import { VuesAchatEtabService } from 'src/app/services/CallApi/vues-achat-etab.service';
import { UtilService } from 'src/app/services/util.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-new-achat',
  templateUrl: './new-achat.component.html',
  styleUrls: ['./new-achat.component.css']
})
export class NewAchatComponent implements OnInit {

  lBiere:Array<BiereModele>;
  lEtab:Array<EtablissementModele>;
  lTarifBiere:Array<TarifModele>;
  lTarifEtab:Array<TarifModele>;
  lAchatEtab:Array<AchatVuesModele>;
  lAchatBiere:Array<AchatVuesModele>;
  lAdresses:Array<AdresseFacturationModele>;
  lastAdresse:AdresseFacturationModele;
  adresse:AdresseFacturationModele;
  lOrganisations:Array<OrganisationModele>;
  orgId:string;
  solde:number;
  nextStep:boolean;
  toConfirm:boolean;
  stripePublicKey:string;
  sessionId:string;
  transId:string;
  apiUrl:string;
  paymentHandler:any = null;
  facture: FactureModele;

  submitted:boolean;
  factureForm: FormGroup;
  subscr:Subscription;

  constructor(private biereSrv:BieresService, private biereOrgaSrv:BieresOrgaService, private etabSrv:EtablissementsService,
    private etabOrgaSrv:EtabsOrgaService, private tarifBiereSrv : TarifsBieresService, private tarifEtabSrv : TarifsEtabsService,
    private vueAchatBiereSrv : VuesAchatBiereService, private vueAchatEtabSrv : VuesAchatEtabService, 
    private authSrv : AuthentificationService, private achatVueSrv:AchatVueService, private toastr:ToastrService, private util : UtilService,
    private adrSrv : AdressesFacturationService, private orgSrv :OrganisationsService, private factSrv :FacturesService, private mollieSrv:MollieService,
    private stripeSrv : StripeService, private transSrv : TransactionsService, private formBuilder:FormBuilder, private router : Router) {
      this.lBiere = Array(0);
      this.lEtab = Array(0);
      this.lTarifBiere = Array(0);
      this.lTarifEtab = Array(0);
      this.lAchatEtab = Array(0);
      this.lAchatBiere = Array(0);
      this.lOrganisations = Array(0);
      this.lastAdresse = new AdresseFacturationModele();
      this.adresse = new AdresseFacturationModele();
      this.lAdresses = Array(0);
      this.subscr = new Subscription();
      this.orgId = "";
      this.solde = 0;
      this.nextStep = false;
      this.toConfirm = false;
      this.stripePublicKey = environment.StripePublicKey;   
      this.sessionId ="";
      this.transId ="";
      this.apiUrl = this.util.apiStripe;
      this.facture = new FactureModele();

      this.submitted = false;
      this.factureForm = new FormGroup({
        motif:new FormControl(''),
      });
   }

   //initialisation des abonnements aux observables + requête pour les obtenir
  ngOnInit(): void {

    this.subscr.add(this.achatVueSrv.solde$.subscribe(
      (value)=>{
        this.solde = value;
      }
    ));

    this.subscr.add(this.achatVueSrv.lAchatBiere$.subscribe(
      (value)=>{
        this.lAchatBiere = value;
      }
    ));

    this.subscr.add(this.achatVueSrv.lAchatEtab$.subscribe(
      (value)=> {
        this.lAchatEtab = value;
      }
    ));

    this.subscr.add(this.adrSrv.adresse$.subscribe(
      (value)=> {
        this.adresse = value;
      }
    ))

    this.subscr.add(this.biereOrgaSrv.lAllowedBieresOrga$.subscribe(
      (value) => {
        this.lBiere = value;
        this.getVuesRestantesBiere();
        this.getTarifsBiere();
      }
    ));
    
    this.subscr.add(this.etabOrgaSrv.lAllowedEtabsOrga$.subscribe(
      (value) => {
        this.lEtab = value;
        this.getVuesRestantesEtab();
        this.getTarifsEtab();
      }
    ));

    //in case of Admin
    if(this.authSrv.isAdmin()){
      this.subscr.add(this.orgSrv.lOrganisation$.subscribe(
        (value) => {
          this.lOrganisations = value;
          this.fillInForm();
        }
      ))
    this.orgSrv.getAll();
    }

    //in case of customer
    else{

      this.orgId = this.authSrv.getUserOrgId();
      this.biereOrgaSrv.getAll(this.orgId, true);
      this.etabOrgaSrv.getAll(true, this.orgId);
    }

    this.getAdresses();

  }

  //initialise le form et définit les validators
  fillInForm()
  {
    this.factureForm = this.formBuilder.group({
      motif:['',[Validators.required, Validators.maxLength(255)]],
    });
  }

  //initialisation des abonnements pour les adresses + requête pour les obtenir
  getAdresses(){
    this.subscr.add(this.adrSrv.lAdresseOrga$.subscribe(
      (value)=>{
        this.lAdresses = value;
      }
    ));
    this.subscr.add(this.adrSrv.lastAdresse$.subscribe(
      (value)=>{
        this.lastAdresse = value;
      }
    ));
    this.adrSrv.getAll(this.authSrv.getUserOrgId());
  }

  //calcul du nombre de vues restantes pour chaque bière
  getVuesRestantesBiere(){
    this.subscr.add(this.vueAchatBiereSrv.lVuesAchatBiere$.subscribe(
      (value) => {
         value.forEach(element => {
            let index = this.lBiere.findIndex(x => x.bieId == element.id)
            if(index !=-1){
              this.lBiere[index].bieNbVuesRestantes = element.nbVuesAch - element.nbVu;
            }
          });
          this.lBiere.forEach(element => {
            if(element.bieNbVuesRestantes==null){
              element.bieNbVuesRestantes = 0;
            }
          });
      }
    ));
    this.vueAchatBiereSrv.get();
  }

  //calcul du nombre de vues restantes pour chaque étab
  getVuesRestantesEtab(){
    this.subscr.add(this.vueAchatEtabSrv.lVuesAchatEtab$.subscribe(
      (value) => {
         value.forEach(element => {
          let index = this.lEtab.findIndex(x => x.etaId == element.id)
          if(index !=-1){
            this.lEtab[index].etaNbVuesRestantes = element.nbVuesAch - element.nbVu;
          }
        });
        this.lEtab.forEach(element => {
          if(element.etaNbVuesRestantes==null){
            element.etaNbVuesRestantes = 0;
          }
        });
      }
    ));
    this.vueAchatEtabSrv.get();
  }

  //abonnement aux tarifs bière + requête pour les obtenir + tri si ils sont actifs et dateDebut =< today =< dateFin
  getTarifsBiere(){
    this.subscr.add(this.tarifBiereSrv.lTarifsBiere$.subscribe(
      (value) => {
        this.lTarifBiere = new Array<TarifModele>();
        let today = new Date().toISOString();
        value.forEach(element => {
          if(element.actif && element.dateDebut.toString()<=today && element.dateFin.toString()>=today){
            this.lTarifBiere.push(element);
          }
        });
      }
    ));

    this.tarifBiereSrv.getAll();
  }

//abonnement aux tarifs étab + requête pour les obtenir + tri si ils sont actifs et dateDebut =< today =< dateFin
  getTarifsEtab(){
    this.subscr.add(this.tarifEtabSrv.lTarifsEtabs$.subscribe(
      (value) => {
        this.lTarifEtab = new Array<TarifModele>();
        let today = new Date().toISOString();
        value.forEach(element => {
          if(element.actif && element.dateDebut.toString()<=today && element.dateFin.toString()>=today){
            this.lTarifEtab.push(element);
          }
        });
      }
    ));
    this.tarifEtabSrv.getAll();
  }

  //recharge les listes de bières, établissement et charge la liste adresse en fonction de l'organisation choisie par l'Admin
  selectOrga(orgId:string){
    this.orgId = orgId;
    this.biereOrgaSrv.getAll(orgId, true);
    this.etabOrgaSrv.getAll(true,orgId);
    this.adrSrv.getAll(orgId);
  }

  isAdmin(){
    return this.authSrv.isAdmin();
  }

  ngOnDestroy(){
    this.subscr.unsubscribe();
  }

  //rajoute une ligne bière avec contrôle de validation et message ToastR
  addVueBiere(){
    let index = this.lAchatBiere.findIndex(a => a.isNew)
    if(index!=-1){
      this.infoToastr("Veuillez ajouter l'achat de vue pour bière en cours avant d'en créer un nouveau")
    }
    else{
      this.achatVueSrv.addAchatBiere();
    }
  }

//rajoute une ligne étab avec contrôle de validation et message ToastR
  addVueEtab(){
    let index = this.lAchatEtab.findIndex(a => a.isNew)
    if(index!=-1){
      this.infoToastr("Veuillez ajouter l'achat de vue pour établissement en cours avant d'en créer un nouveau")
    }
    else{
      this.achatVueSrv.addAchatEtab();
    }
  }

  infoToastr(message:string)
  {
    this.toastr.info(message, "Information");
  }

  //switch sur la valeur activant ou non le bouton
  changeToConfirm(){
    this.toConfirm = !this.toConfirm;
  }

  //switch sur la valeur activant ou non le bouton
  changeStep(){
    this.nextStep = !this.nextStep;
  }

  confirmOrder(){
    this.toConfirm = true;
  }

  //vérifie si il y a un élément valide avant de passer à l'écran suivant
  somethingOrdered(){
    if(this.lAchatEtab.length!=0||this.lAchatBiere.length!=0){
    let index = this.lAchatEtab.findIndex(a => a.isNew == false)
    if(index !=-1){
      return true;
    }
    index = this.lAchatBiere.findIndex(a => a.isNew == false)
    if(index !=-1){
      return true;
    }
  }
    return false;
  }

  //permet d'afficher le nom de la bière en fonction de l'id
  getNomBiere(bieId:string){
    let index = this.lBiere.findIndex(b => b.bieId == bieId);
    if(index!=-1){
      return this.lBiere[index].bieNom;
    }
    return "";
  }

  //permet d'afficher le nom de l'étab en fonction de l'id
  getNomEtab(etaId:string){
    let index = this.lEtab.findIndex(e => e.etaId == etaId);
    if(index!=-1){
      return this.lEtab[index].etaNom;
    }
    return "";
  }

  //récupère le nombre de vues pour un tarif bière en fonction de l'id
  getNombreVueBiere(tarifId:string){
    let index = this.lTarifBiere.findIndex(t => t.id == tarifId);
    if(index!=-1){
      return this.lTarifBiere[index].nbVue.toString();
    }
    return "";
  }

  //récupère le nombre de vues pour un tarif étab en fonction de l'id
  getNombreVueEtab(tarifId:string){
    let index = this.lTarifEtab.findIndex(t => t.id == tarifId);
    if(index!=-1){
      return this.lTarifEtab[index].nbVue.toString();
    }
    return "";
  }

  toPayment(){
  this.createFactureStripe();
  }

  //Crée les AchatsVues dans la Db via l'API
  createAchatOnDb(lAchat:Array<AchatVuesModele>, transId:string){
    lAchat.forEach(element => {
      element.transId = transId;
      this.subscr.add(this.achatVueSrv.saveAchat(element).subscribe(
        (value) =>{

        }
      ))
    });
  }

 //Crée une nouvelle transaction et lance la création des AchatsVues et fait la demande de session.Id à Stripe
createFactureStripe(){
    let trans = new TransactionModele();
    trans.orgId = this.orgId;
    this.subscr.add(this.transSrv.addTransaction(trans).subscribe(
      (value) => {
        this.createAchatOnDb(this.lAchatBiere, value.transId);
        this.createAchatOnDb(this.lAchatEtab, value.transId);
        this.subscr.add(this.stripeSrv.createPayment(this.solde, value.transId, this.adresse.adrFacId).subscribe(
          (value) =>{
            this.checkout(value.id);
          }
        ))
      }
    ));
  }

  //redirige l'utilisateur vers la page de paiement
  async checkout(id:string) {
    let stripePromise = loadStripe(environment.StripePublicKey);
    const stripe = await stripePromise;
    if(stripe!=null){
      let { error } = await stripe.redirectToCheckout({sessionId:id});
      if (error) {
        console.log(error);
      }
    }
  }

  get form() {
    return this.factureForm.controls;
  }


  //Uniquement pour Admin, crée la nouvelle transaction, les achats vues et la facture avec le Status Correction
  onSubmitForm(){
    if(this.factureForm.valid && this.factureForm.dirty)
    { 
      let trans = new TransactionModele();
      trans.orgId = this.orgId;
      trans.transStatus = Status.Correction;

      this.subscr.add(this.transSrv.addTransaction(trans).subscribe(
        (value) =>{
          this.createAchatOnDb(this.lAchatBiere, value.transId);
          this.createAchatOnDb(this.lAchatEtab, value.transId);

          this.facture.adrFacId = this.adresse.adrFacId;
          this.facture.facMotif = this.factureForm.value.motif;
          this.facture.transId = trans.transId;
          this.subscr.add(this.factSrv.addFacture(this.facture).subscribe(
            (value) =>{
              this.router.navigate(['Factures']);
            }
          ))
        }
      ))
    }
    else{
      this.submitted = true;
    }
  }

  


  }



  /*
  createFactureMollie(){
    try{
    let fact = new FactureModele();
    this.subscr.add(this.factSrv.addFacture(fact).subscribe(
      (value) => {
       this.createAchatOnDb(this.lAchatBiere, value.facId);
      this.createAchatOnDb(this.lAchatEtab, value.facId);
      this.subscr.add(this.mollieSrv.createPayment(this.solde, value.facId).subscribe(
        (value) =>{
          let url = value;
          //window.location.href = url._links.checkout;
        }
      ))
      }
    ));
    }
    catch{
      return;
    }
  }*/




