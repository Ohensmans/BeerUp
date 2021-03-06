import { Guid } from "guid-typescript";

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
    isDeletable:boolean;
    bieDegreAlcool:number;

    constructor(){
        this.bieId = "";
        this.etaId ="";
        this.typBieId="";
        this.bieNom= "";
        this.bieDesc="";
        this.biePhoto="";
        this.bieNbVu=0;
        this.bieDateCre = new Date();
        this.bieValide = true;
        this.bieActif = true;
        this.userId = "";
        this.isDeletable = true;
        this.bieDegreAlcool = 0;
    }


}
