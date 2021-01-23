import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthentificationService } from '../authentification.service';
import { UtilService } from '../util.service';

@Injectable({
  providedIn: 'root'
})
export class UploadImagesService {

  constructor(private http:HttpClient, private util:UtilService, private authSrv:AuthentificationService) { 
  }

  uploadEtab(formData:FormData){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post(
      this.util.apiImagesEtab, formData,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token }), reportProgress:true, observe:'events'},
    );

    return result;
  }

  downloadEtab(){
    let result = this.http.get<FormData>(this.util.apiImagesEtab);
      return result;
  }

  
}
