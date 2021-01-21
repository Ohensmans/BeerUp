import { Guid } from "guid-typescript";

export class TypesEtabModele {
    typEtaId:string;
    typEtaNom:string;

    constructor(){
        this.typEtaId = Guid.createEmpty().toString();
        this.typEtaNom="";
    }
}
