import { Injectable } from '@angular/core';
import { UserManager, User, UserManagerSettings, WebStorageStateStore} from 'oidc-client';
import { JwtHelperService } from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root'
})

export class AuthentificationService {
  private manager:UserManager;
  helper = new JwtHelperService(); 

  private user = null as any;

  constructor(private jwtSrv : JwtHelperService) { 
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
        authority: 'http://localhost:5000',
        // client id dans IS
        client_id: 'BeerUpWeb',
        // url app Angular au retour d'IS
        redirect_uri: 'http://localhost:4200/auth-callback',   
        // le type de réponse
        response_type:"code",
        // les scopes
        scope:"openid profile ApiBeerUp.all",
        // url app Angular au retour d'IS après logout (attention AccountOptions à modifier dans IS)
        post_logout_redirect_uri:'http://localhost:4200/',
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
    return this.manager.signoutRedirect();
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

  getUserRoles(){
    return this.getToken().role;
  }

  getUserOrgId(){
    return this.getToken().OrgId;
  }

  isAdmin(){
    if(this.getUserRoles()!=null)
    {
      return (this.getUserRoles().includes("Administrateur"));
    }
    return false;
  }


  isAdminOrGroupAdmin(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdmin() || this.getUserRoles().includes("GroupAdmin"));
    }
    return false;
  }

  hasUserAdminAccess(){
    return this.isAdminOrGroupAdmin();
  }

  hasBiereAdminAccess(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdminOrGroupAdmin() || this.getUserRoles().includes("GroupBiere"));
    }
    return false;
  }

  hasEtablissementAdminAccess(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdminOrGroupAdmin() || this.getUserRoles().includes("GroupEtablissement"));
    }
    return false;
  }

  hasAchatAdminAccess(){
    if(this.getUserRoles()!=null)
    {
      return (this.isAdminOrGroupAdmin() || this.getUserRoles().includes("GroupAchat"));
    }
    return false;
  }



}