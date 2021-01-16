import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-confirm',
  template: `<div class="modal-body text-center">
  <p>{{prompt}}</p>

  <button type="button" class="btn btn-danger" (click)="confirm()" >Oui</button>

  <button type="button" class="btn btn-primary" (click)="decline()" >Non</button>

</div>`
})
export class ConfirmComponent implements OnInit {

  prompt:string;
  onClose$: Subject<boolean>;

  constructor(public bsModalRef: BsModalRef) { 
    this.prompt = "";
    this.onClose$ = new Subject<boolean>();
  }
 
  ngOnInit() :void {
    this.onClose$ = new Subject<boolean>();
  }
 
  confirm() : void {
      this.onClose$.next(true);
      this.bsModalRef.hide();
  }
 
  decline() : void {
    this.onClose$.next(false);
      this.bsModalRef.hide();
  }

}
