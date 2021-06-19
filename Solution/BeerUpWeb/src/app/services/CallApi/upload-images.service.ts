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

  uploadImage(formData:FormData, isEtab:boolean){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.post(
      isEtab? this.util.apiImagesEtabUrl : this.util.apiImagesBiereUrl,formData,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token }), reportProgress:true, observe:'events'},
    );

    return result;
  }

  deleteImage(path:string, id:string, isEtab:boolean){
    const token:string = this.authSrv.getUser().id_token;

    let result = this.http.delete<string>(
      isEtab? this.util.apiImagesEtabUrl +path : this.util.apiImagesBiereUrl
      +path+','+id,
      { headers: new HttpHeaders({ "Authorization": "Bearer " + token })}
    )
    return result;
  }




  
}
