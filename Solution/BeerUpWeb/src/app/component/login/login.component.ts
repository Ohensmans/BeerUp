import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthentificationService } from 'src/app/services/authentification.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  constructor(private authSrv:AuthentificationService,private route:ActivatedRoute,private router:Router ) {     
  }
  ngOnInit(): void {
    if(this.isAuth())
    {
      this.onLogout();
    }
    else
    {
      this.onLogin();
    }
  }

  isAuth() {
    return this.authSrv.isAuthenticate();
  }

  onLogin() {
    this.authSrv.startAuthentication();
  }

  onLogout() {
    this.authSrv.signOut();
  }

}
