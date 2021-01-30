import { ThrowStmt } from "@angular/compiler";

export class OrganisationModele {
    orgId:string;
    orgNom:string;
    orgTva:string;
    orgRue:string;
    orgNum:string;
    orgCp:string;
    orgVille:string;
    orgPays:string;
    orgEmail:string;
    orgWeb:string;
    orgPhoto:string;

    constructor(){
        this.orgId ="";
        this.orgNom = "";
        this.orgTva = "";
        this.orgRue ="";
        this.orgNum="";
        this.orgCp= "";
        this.orgVille="";
        this.orgPays="";
        this.orgEmail="";
        this.orgWeb="";
        this.orgPhoto="";
    }
}
