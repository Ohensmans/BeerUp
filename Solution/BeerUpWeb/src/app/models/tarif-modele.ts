import { Guid } from "guid-typescript";


export class TarifModele {
    id:Guid;
    nbVue:number;
    prix:number;
    dateDebut:Date;
    dateFin:Date;
    actif:boolean;

    constructor()
    {
        this.id=Guid.createEmpty();
        this.prix =0;
        this.nbVue= 0;
        this.dateDebut = new Date();
        this.dateFin = new Date();
        this.actif = false;
    }
}

