import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { setTheme } from 'ngx-bootstrap/utils';
import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { JwtModule } from '@auth0/angular-jwt';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';

import { AppComponent } from './app.component';

import { AuthentificationService } from './services/authentification.service';
import { AuthGuardService} from 'src/app/services/authguard.service';
import { UtilService} from 'src/app/services/util.service';


import { HomeComponent } from './component/home/home.component';
import { NotFoundComponent } from './component/not-found/not-found.component';
import { AuthCallbackComponent } from './component/auth-callback/auth-callback.component';
import { LoginComponent } from './component/login/login.component';
import { ContactComponent } from './component/contact/contact.component';
import { PrivacyComponent } from './component/privacy/privacy.component';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    NotFoundComponent,
    AuthCallbackComponent,
    LoginComponent,
    ContactComponent,
    PrivacyComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    FormsModule,
    CarouselModule.forRoot(),
    BrowserAnimationsModule,
    BsDropdownModule.forRoot(),
    RouterModule.forRoot([
      { path:'',component:HomeComponent },
      { path:'home',component:HomeComponent },
      { path:'login', component:LoginComponent },
      { path:'logout', component:LoginComponent },
      { path: 'auth-callback', component : AuthCallbackComponent},
      { path: 'contact', component : ContactComponent},
      { path: 'privacy', component : PrivacyComponent},
      //{ path: 'call-api', canActivate:[AuthGuardService], component : CallApiComponent},
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
    AuthentificationService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { 
  constructor(){
    setTheme('bs4');
  }
}

export function tokenGetter() {
  return localStorage.getItem("jwt");
  }
