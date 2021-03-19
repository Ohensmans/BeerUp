import { Guid } from "guid-typescript";

export class AchatVuesModele {
    achId:string;
    bieId:string | undefined;
    etaId:string | undefined;
    transId:string;
    tarifsVueEtabId:string | undefined;
    tarifsVueBieId:string | undefined;
    isNew:boolean;
    prix:number;

    constructor(){
        this.achId =Guid.create().toString();
        this.transId ="";
        this.isNew=true;
        this.prix = 0;
    }

}
