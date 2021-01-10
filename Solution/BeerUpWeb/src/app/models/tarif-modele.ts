export class TarifModele {
    Id:string;
    NbVue:number;
    Prix:number;
    DateCre:number;
    Actif:boolean;

    constructor()
    {
        this.Id="";
        this.Prix =0;
        this.NbVue= 0;
        this.DateCre = Date.now();
        this.Actif = false;
    }
}

