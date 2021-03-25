import { Injectable, Injector } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { from, Observable, of } from 'rxjs';
import { concatMap, first } from 'rxjs/operators'
import { AuthentificationService } from '../authentification.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate {

  constructor(private authSrv : AuthentificationService, private router: Router, public injector: Injector) { }

  //récupère le garde et vérifie si l'user peut accéder à la page
  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean | UrlTree> {
    return from(route.data.syncGuards).pipe(concatMap((value) => {
        const guard = this.injector.get(value);
        const result = guard.canActivate(route, state);
        if (result instanceof Observable) {
            return result;
        } else if (result instanceof Promise) {
            return from(result);
        } else {
            return of(result);
        }
    }), first((x) => x === false || x instanceof UrlTree, true));
}
}