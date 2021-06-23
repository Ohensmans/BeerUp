import { Injectable } from '@angular/core';
import { UserManager, User, UserManagerSettings, WebStorageStateStore} from 'oidc-client';
import { JwtHelperService } from '@auth0/angular-jwt';
import { UtilService } from './util.service';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})

export class AuthentificationService {
  private manager:UserManager;
  helper = new JwtHelperService(); 

  private user = null as any;

  constructor(private jwtSrv : JwtHelperService, private util:UtilService, private router : Router) { 
    this.manager = new UserManager(this.getClientSettings());
    this.manager.getUser()
    .then(
      user => {
          this.user = user;   
      }
    );
  }

  public getUser() {
    return this.user;
  }

  private getClientSettings() : UserManagerSettings {
    return {
        // url IS
        authority: this.util.urlIdentity,
        // client id dans IS
        client_id: 'BeerUpWeb',
        // url app Angular au retour d'IS
        redirect_uri: 'http://localhost:4200/auth-callback',   
        // le type de réponse
        response_type:"code",
        // les scopes
        scope:"openid profile ApiBeerUp.all",
        // url app Angular au retour d'IS après logout (attention AccountOptions à modifier dans IS)
        post_logout_redirect_uri:'http://localhost:4200/home',
        // pour save le user dans localStorage
        userStore: new WebStorageStateStore({ store: window.localStorage })
    }
  }
  
  isAuthenticate() {
    return this.user != null && !this.user.expired;
  }

  startAuthentication() {
    this.manager.signinRedirect();
  }

  completeAuthentication() {
    return this.manager.signinRedirectCallback().then(
      user => {
        this.user = user;
      }
    )
  }

  signOut() {
    this.manager.removeUser();
    this.manager.signoutRedirect();
  }

  getToken(){
    if(this.isAuthenticate())
      return this.helper.decodeToken(this.getUser()["id_token"]);
    else
      return null;
  }

  getUserName(){
    return this.getToken().name;
  }

  getUserId(){
    return this.getToken().sub;
  }

  getUserRoles(){
    return this.getToken().role;
  }

  getUserOrgId(){
    return this.getToken().OrgId;
  }

  getUserGroupEtabEtab(){
    return this.getToken().GroupEtablissementEtablissements;
  }

  getUserGroupBiereBieres(){
    return this.getToken().GroupBiereBieres;
  }

  getUserGroupAchatBieres(){
    return this.getToken().GroupAchatBieres;
  }

  getUserGroupAchatEtab(){
    return this.getToken().GroupAchatEtablissements;
  }

  userIsValide(){
    let result = this.getToken();
    return this.getToken().Valide;
  }

  isAdmin(){
    if(this.getUserRoles()!=null && this.userIsValide())
    {
      return (this.getUserRoles().includes("Administrateur"));
    }
    return false;
  }


  isAdminOrGroupAdmin(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdmin() || (this.getUserRoles().includes("GroupAdmin")) && this.userIsValide());
    }
    return false;
  }

  hasUserAdminAccess(){
    return this.isAdminOrGroupAdmin();
  }

  hasBiereAdminAccess(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdminOrGroupAdmin() || (this.getUserRoles().includes("GroupBiere"))&& this.userIsValide());
    }
    return false;
  }

  hasEtablissementAdminAccess(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdminOrGroupAdmin() || (this.getUserRoles().includes("GroupEtablissement")&& this.userIsValide()));
    }
    return false;
  }

  hasAchatAdminAccess(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdminOrGroupAdmin() || (this.getUserRoles().includes("GroupAchat")&& this.userIsValide()));
    }
    return false;
  }



}