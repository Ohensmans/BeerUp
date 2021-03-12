import { Guid } from "guid-typescript";

export class AchatVuesModele {
    achId:string;
    bieId:string;
    etaId:string;
    facId:string;
    tarifsVueEtabId:string;
    tarifsVueBieId:string;
    isNew:boolean;
    prix:number;

    constructor(){
        this.achId =Guid.create().toString();
        this.bieId ="";
        this.etaId ="";
        this.facId ="";
        this.tarifsVueBieId = "";
        this.tarifsVueEtabId ="";
        this.isNew=true;
        this.prix = 0;
    }

}
