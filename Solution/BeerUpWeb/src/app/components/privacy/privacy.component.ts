import { Component, OnInit } from '@angular/core';
import { AuthentificationService } from 'src/app/services/authentification.service';

@Component({
  selector: 'app-privacy',
  templateUrl: './privacy.component.html',
  styleUrls: ['./privacy.component.css']
})

export class PrivacyComponent implements OnInit {
  name: Array<string>;

  
  constructor(private authSrv:AuthentificationService) {
    this.name = this.authSrv.getUserRoles();
   }

  ngOnInit(): void {
    this.name = this.authSrv.getUserRoles();
  }

}
