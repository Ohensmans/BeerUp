
export class AdresseFacturationModele {
    adrFacId:string;
    adrFacRue:string;
    adrFacNum:string;
    adrFacCp:string;
    adrFacVil:string;
    adrFacPays:string;
    adrFacDateAjout:Date;
    orgId:string;

    constructor(){
        this.adrFacId = "";
        this.adrFacRue = "";
        this.adrFacNum = "";
        this.adrFacCp = "";
        this.adrFacVil = "";
        this.adrFacPays="";
        this.adrFacDateAjout=new Date();
        this.orgId="";
    }
}
