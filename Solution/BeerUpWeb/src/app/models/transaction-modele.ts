import { Guid } from "guid-typescript";
import { Status } from "./status";

export class TransactionModele {
    transId:string;
    transDate:Date;
    transStatus:string;
    orgId:string;
    
    

    constructor(){
        this.transId = Guid.create().toString();
        this.transDate = new Date();
        this.transStatus= Status.New;
        this.orgId="";
        
}
}
