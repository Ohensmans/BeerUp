import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { AuthentificationService } from '../authentification.service';

@Injectable({
  providedIn: 'root'
})
export class LoggedGuardService implements CanActivate{

  constructor(private authSrv : AuthentificationService, private router: Router) { }
  
  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    if (this.authSrv.isAuthenticate()) {
      return true;
    } 
    localStorage.setItem('path-redirect',state.url);
    this.authSrv.startAuthentication();
    return false;
  }

}