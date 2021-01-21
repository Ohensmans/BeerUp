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
    etaCoord:string;
    etaActif: boolean;

    constructor(){
    this.etaId = Guid.createEmpty().toString();
    this.orgId= Guid.createEmpty().toString();
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
    this.etaCoord="";
    this.etaActif= false;
    }

    isNew(){
        if(this.etaId==Guid.createEmpty().toString()){
            return true;
        }
        return false;
    }
}


