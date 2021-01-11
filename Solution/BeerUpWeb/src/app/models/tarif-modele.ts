export class TarifModele {
    Id:string;
    NbVue:number;
    Prix:number;
    DateDebut:string;
    DateFin:string;
    Actif:boolean;

    constructor()
    {
        this.Id="";
        this.Prix =0;
        this.NbVue= 0;
        this.DateDebut = Date.now().toString();
        this.DateFin ="";
        this.Actif = false;
    }
}

