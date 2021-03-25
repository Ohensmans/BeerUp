import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { AuthentificationService } from '../authentification.service';

@Injectable({
  providedIn: 'root'
})
export class GroupEtabGuardService implements CanActivate{

  constructor(private authSrv : AuthentificationService, private router: Router) { }
  
  //vérifie si l'user connecté est admin, groupAdmin ou groupEtab
  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    if (this.authSrv.hasEtablissementAdminAccess()) {
      return true;
    } 
    localStorage.setItem('path-redirect',state.url);
    this.authSrv.startAuthentication();
    return false;
  }
}
