import { CommonModule, DatePipe } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { setTheme } from 'ngx-bootstrap/utils';
import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { JwtModule } from '@auth0/angular-jwt';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { HttpClientModule } from '@angular/common/http';
import { ModalModule } from 'ngx-bootstrap/modal';
import { ToastrModule } from 'ngx-toastr';
import { TimepickerModule } from 'ngx-bootstrap/timepicker';
import { RatingModule } from 'ngx-bootstrap/rating';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { AppComponent } from './app.component';

import { AuthentificationService } from './services/authentification.service';
import { AuthGuardService} from 'src/app/services/authguard.service';


import { HomeComponent } from './components/home/home.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { AuthCallbackComponent } from './components/auth-callback/auth-callback.component';
import { LoginComponent } from './components/login/login.component';
import { ContactComponent } from './components/contact/contact.component';
import { PrivacyComponent } from './components/privacy/privacy.component';
import { TabBordPlanTarifComponent } from './components/plansTarifaires/tab-bord-plan-tarif/tab-bord-plan-tarif.component';
import { TarifComponent } from './components/plansTarifaires/tarif/tarif.component';
import { ConfirmComponent } from './components/confirm/confirm.component';
import { TabBordEtabsComponent } from './components/etablissements/tab-bord-etabs/tab-bord-etabs.component';
import { ElementListeEtabComponent } from './components/etablissements/element-liste-etab/element-liste-etab.component';
import { FicheEtablissementComponent } from './components/etablissements/fiche-etablissement/fiche-etablissement.component';
import { HoraireComponent } from './components/etablissements/horaire/horaire.component';
import { JourFermeturesComponent } from './components/etablissements/jour-fermetures/jour-fermetures.component';
import { TabBordBieresEtabComponent } from './components/BieresEtab/tab-bord-bieres-etab/tab-bord-bieres-etab.component';
import { ElementListeBiereComponent } from './components/BieresEtab/element-liste-biere/element-liste-biere.component';
import { TabBordBieresComponent } from './components/bieres/tab-bord-bieres/tab-bord-bieres.component';
import { ElementBiereComponent } from './components/bieres/element-biere/element-biere.component';
import { FicheBiereComponent } from './components/bieres/fiche-biere/fiche-biere.component';
import { TabBordAchatComponent } from './components/achats/tab-bord-achat/tab-bord-achat.component';
import { ElementListeAchatComponent } from './components/achats/element-liste-achat/element-liste-achat.component';
import { NewAchatComponent } from './components/achats/new-achat/new-achat.component';
import { TabBordPlanTarifBiereComponent } from './components/plansTarifaires/tab-bord-plan-tarif-biere/tab-bord-plan-tarif-biere.component';
import { TabBordAchatBiereComponent } from './components/achats/tab-bord-achat-biere/tab-bord-achat-biere.component';
import { NewAchatEtabElementComponent } from './components/achats/new-achat-etab-element/new-achat-etab-element.component';
import { NewAchatBiereElementComponent } from './components/achats/new-achat-biere-element/new-achat-biere-element.component';




@NgModule({
  bootstrap: [AppComponent],
  declarations: [
    AppComponent,
    HomeComponent,
    NotFoundComponent,
    AuthCallbackComponent,
    LoginComponent,
    ContactComponent,
    PrivacyComponent,
    TabBordPlanTarifComponent,
    TarifComponent,
    ConfirmComponent,
    TabBordEtabsComponent,
    ElementListeEtabComponent,
    FicheEtablissementComponent,
    HoraireComponent,
    JourFermeturesComponent,
    TabBordBieresEtabComponent,
    ElementListeBiereComponent,
    TabBordBieresComponent,
    ElementBiereComponent,
    FicheBiereComponent,
    TabBordAchatComponent,
    ElementListeAchatComponent,
    NewAchatComponent,
    TabBordPlanTarifBiereComponent,
    TabBordAchatBiereComponent,
    NewAchatEtabElementComponent,
    NewAchatBiereElementComponent,
  ],
  imports: [
    CommonModule,
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    CarouselModule.forRoot(),
    BrowserAnimationsModule,
    TimepickerModule.forRoot(),
    ToastrModule.forRoot(),
    BsDropdownModule.forRoot(),
    RatingModule.forRoot(),
    PaginationModule.forRoot(),
    ModalModule.forRoot(),
    HttpClientModule,
    RouterModule.forRoot([
      { path:'',component:HomeComponent },
      { path:'home',component:HomeComponent },
      { path:'login', component:LoginComponent },
      { path:'logout', component:LoginComponent },
      { path: 'auth-callback', component : AuthCallbackComponent},
      { path: 'contact', component : ContactComponent},
      { path: 'privacy', component : PrivacyComponent},
      //{ path: 'call-api', canActivate:[AuthGuardService], component : CallApiComponent},
      { path: 'PlansTarifairesEtab', component : TabBordPlanTarifComponent},
      { path: 'PlansTarifairesBiere', component : TabBordPlanTarifBiereComponent},
      { path: 'Etablissements', component : TabBordEtabsComponent},
      { path: 'Bieres', component : TabBordBieresComponent},
      { path: 'FicheBiere/:id', component : FicheBiereComponent},
      { path: 'FicheEtablissement/:id', component : FicheEtablissementComponent},
      { path: 'TabBordBieresEtab/:id', component : TabBordBieresEtabComponent},
      { path: 'AchatsEtab', component : TabBordAchatComponent},
      { path: 'AchatsBiere', component : TabBordAchatBiereComponent},
      { path: 'NewAchat', component : NewAchatComponent},
      { path: 'not-found', component : NotFoundComponent},      
      { path: '**', redirectTo: 'not-found' }
    ]),
    JwtModule.forRoot({
      config: {
      tokenGetter: tokenGetter,
      allowedDomains: ["localhost:5000"],
      disallowedRoutes: []
      }
})  
  ],
  providers: [
    AuthentificationService, DatePipe
  ],
  

})
export class AppModule { 
  constructor(){
    setTheme('bs4');
  }
}

export function tokenGetter() {
  return localStorage.getItem("jwt");
  }
