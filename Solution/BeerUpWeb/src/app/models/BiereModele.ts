import { DomSanitizer } from "@angular/platform-browser";
import { Guid } from "guid-typescript";
import { StringifyOptions } from "querystring";

export class BiereModele {
    bieId: string;
    etaId: string;
    typBieId:string;
    bieNom:string;
    bieDesc:string;
    biePhoto:string;
    bieNbVu:number;
    bieDateCre:Date;
    bieValide:boolean;
    bieActif:boolean;
    userId:string;

    constructor(){
        this.bieId = Guid.create().toString();
        this.etaId ="";
        this.typBieId="";
        this.bieNom= "";
        this.bieDesc="";
        this.biePhoto="";
        this.bieNbVu=0;
        this.bieDateCre = new Date();
        this.bieValide = false;
        this.bieActif = false;
        this.userId = "";
    }

}
