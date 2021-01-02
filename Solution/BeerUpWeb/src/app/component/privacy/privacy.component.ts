import { Component, OnInit } from '@angular/core';
import { AuthentificationService } from 'src/app/services/authentification.service';

@Component({
  selector: 'app-privacy',
  templateUrl: './privacy.component.html',
  styleUrls: ['./privacy.component.css']
})

export class PrivacyComponent implements OnInit {
  name: string[] = [];

  
  constructor(private authSrv:AuthentificationService) {
   }

  ngOnInit(): void {
    console.log(this.authSrv.getUser());
    console.log(this.authSrv.getClaims());
    this.name = this.authSrv.getClaims().role;
  }

}
