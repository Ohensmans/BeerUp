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
      this.util.apiImagesEtabUrl, formData,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token }), reportProgress:true, observe:'events'},
    );

    return result;
  }

  deleteEtab(path:string){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.delete(
      this.util.apiImagesEtabUrl+path,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
    return result;
  }



  
}
