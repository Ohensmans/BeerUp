export class FactureModele {
    facId:string;
    facDate:Date;
    facMotif:string | undefined;
    transId:string;
    adrFacId:string;

    

    constructor(){

        this.facId ='0';
        this.facDate = new Date();
        this.transId = "";
        this.adrFacId ="";
        
}

    
}
