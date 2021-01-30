import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { BiereModele } from 'src/app/models/BiereModele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class GetDeletablesBieresService {

  lDeletablesBieres: Array<BiereModele>;
  lDeletablesBieres$: BehaviorSubject<Array<BiereModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lDeletablesBieres = Array(0);
    this.lDeletablesBieres$ = new BehaviorSubject<Array<BiereModele>>(this.lDeletablesBieres);
  }

  getOneOrga(){
    const token = this.authSrv.getUser().id_token;
    const id = this.authSrv.getUserOrgId();

    var result = this.http.get<BiereModele[]>(
      this.util.apiGetDeletablesBieres+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<BiereModele[]>(
      this.util.apiGetDeletablesBieres,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }
}
