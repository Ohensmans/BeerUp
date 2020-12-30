import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  apiUrl = 'http://localhost:5001';
  registerUrl = 'http://localhost:5000/account/registerweb';

  constructor() { }
}

