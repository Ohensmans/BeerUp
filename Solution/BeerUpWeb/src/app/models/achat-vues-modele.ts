import { Guid } from "guid-typescript";

export class AchatVuesModele {
    achId:string;
    bieId:string | undefined;
    etaId:string | undefined;
    facId:string;
    tarifsVueEtabId:string | undefined;
    tarifsVueBieId:string | undefined;
    isNew:boolean;
    prix:number;

    constructor(){
        this.achId =Guid.create().toString();
        this.facId ="";
        this.isNew=true;
        this.prix = 0;
    }

}
