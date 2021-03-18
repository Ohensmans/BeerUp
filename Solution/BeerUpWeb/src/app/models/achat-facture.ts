export class AchatFacture {
    facId:number;
    bieNom:string | undefined;
    etaNom:string | undefined;
    bieNbVuAch:number | undefined;
    etaNbVuAch:number | undefined;
    biePrix:number | undefined;
    etaPrix:number | undefined;
    achId:string;
    orgId:string;

    constructor(){
        this.achId="";
        this.orgId="";
        this.facId=0;  
    }
}
