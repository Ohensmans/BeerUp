import { Component } from '@angular/core';
import { AuthentificationService } from 'src/app/services/authentification.service';
import { UtilService } from 'src/app/services/util.service';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'BeerUpWeb';
  registerUrl:string;
  adminUserUrl:string;


  constructor(private authSrv:AuthentificationService, private utilSrv:UtilService)
  {
    this.registerUrl = utilSrv.registerUrl;
    this.adminUserUrl = utilSrv.adminUserUrl;
  }

  isAuth() {
    return this.authSrv.isAuthenticate();
  }

  getUserName(){
    return this.authSrv.getUserName();
  }

  isAdmin(){
    return this.authSrv.isAdmin();
  }

  hasUserAdminAccess(){
    return this.authSrv.hasUserAdminAccess();
  }
  
  hasBiereAdminAccess(){
    return this.authSrv.hasBiereAdminAccess();
  }

  hasEtablissementAdminAccess(){
    return this.authSrv.hasEtablissementAdminAccess();
  }

  hasAchatAdminAccess(){
    return this.authSrv.hasAchatAdminAccess();
  }

}
