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

  constructor(private authSrv:AuthentificationService, private utilSrv:UtilService)
  {
    this.registerUrl = utilSrv.registerUrl;
  }

  isAuth() {
    return this.authSrv.isAuthenticate();
  }
}
