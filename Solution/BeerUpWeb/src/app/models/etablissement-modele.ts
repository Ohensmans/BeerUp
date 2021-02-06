import { Guid } from "guid-typescript";

export class EtablissementModele {
    etaId:string;
    orgId:string;
    typEtaId:string;
    etaNom:string;
    etaTva:string;
    etaRue:string;
    etaNum:string;
    etaCp:string;
    etaVille:string;
    etaPays:string;
    etaWeb:string;
    etaMail:string;
    etaPhoto:string;
    etaNbVue:number;
    etaCoordLong:string;
    etaCoordLat:string;
    etaActif: boolean;
    isDeletable:boolean;


    constructor(){
    this.etaId = Guid.create().toString();
    this.orgId= "";
    this.typEtaId= Guid.createEmpty().toString();
    this.etaNom="";
    this.etaTva="";
    this.etaRue="";
    this.etaNum="";
    this.etaCp="";
    this.etaVille="";
    this.etaPays="";
    this.etaMail="";
    this.etaWeb="";
    this.etaPhoto="";
    this.etaNbVue=0;
    this.etaCoordLong="";
    this.etaCoordLat="";
    this.etaActif= false;
    this.isDeletable = false;
    }

    isNew(){
        if(this.orgId==""){
            return true;
        }
        return false;
    }
}


