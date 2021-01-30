import { Time } from "@angular/common";


export class HoraireModele {
    horId:string;
    etaId:string;
    horJour:string;
    horDebut:Time;
    horFin:Time;

    constructor(){
        this.horId="";
        this.etaId="";
        this.horJour= "";
        this.horDebut= {hours:0, minutes:0};
        this.horFin = {hours:0, minutes:0};
    }

}
