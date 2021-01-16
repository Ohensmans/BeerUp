import { Guid } from "guid-typescript";

export class EtablissementModele {
    EtaId:string;
    OrgId:string;
    TypEtaId:string;
    EtaNom:string;
    EtaTva:string;
    EtaRue:string;
    EtaNum:number;
    EtaCp:number;
    EtaVille:string;
    EtaWeb:string;
    EtaPhoto:string;
    EtaNbVue:number;
    EtaCoord:string;
    EtaActif: boolean;

    constructor(){
    this.EtaId = Guid.createEmpty().toString();
    this.OrgId= Guid.createEmpty().toString();
    this.TypEtaId= Guid.createEmpty().toString();
    this.EtaNom="";
    this.EtaTva="";
    this.EtaRue="";
    this.EtaNum=0;
    this.EtaCp=0;
    this.EtaVille="";
    this.EtaWeb="";
    this.EtaPhoto="";
    this.EtaNbVue=0;
    this.EtaCoord="";
    this.EtaActif= false;
    }
}


