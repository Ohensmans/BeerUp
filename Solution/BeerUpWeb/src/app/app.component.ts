import { Component } from '@angular/core';
import { AuthentificationService } from 'src/app/services/authentification.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'BeerUpWeb';

  constructor(private authSrv:AuthentificationService)
  {
  }

  isAuth() {
    return this.authSrv.isAuthenticate();
  }
}
