import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UtilService } from '../util.service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class VatLayerService {
  
  constructor(private http:HttpClient, private util:UtilService) { 
  }


  validateTva(tva:string){
    let key = environment.VatKey;
    let tvaRequest = "&vat_number=" + tva;

      let result = this.http.get<any>(
        this.util.VAT+key+tvaRequest
      )
      return result;

  }
}
