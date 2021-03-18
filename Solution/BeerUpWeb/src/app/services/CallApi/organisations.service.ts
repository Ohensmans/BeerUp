import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { OrganisationModele } from 'src/app/models/organisation-modele';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})

export class OrganisationsService {
  lOrganisation: Array<OrganisationModele>;
  lOrganisation$: BehaviorSubject<Array<OrganisationModele>>;
  
  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
    this.lOrganisation = Array(0);
    this.lOrganisation$ = new BehaviorSubject<Array<OrganisationModele>>(this.lOrganisation);
  }


  getAll(){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<OrganisationModele[]>(
      this.util.apiOrganisationsUrl,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    result.subscribe(
      (value) => {
        this.lOrganisation = value;
        this.lOrganisation$.next(this.lOrganisation);
      }
    )
  }

  getOne(orgId:string){
    const token = this.authSrv.getUser().id_token;

    var result = this.http.get<OrganisationModele>(
      this.util.apiOrganisationsUrl+orgId,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    );
    return result;
  }

}
