import { Guid } from "guid-typescript";

export class TransactionModele {
    transId:string;
    transDate:Date;
    transStatus:string;
    orgId:string;
    

    constructor(){
        enum Status {
            New = "NEW", 
            Correction = "CORRECTION", 
            Confirmed = "CONFIRMED"
        }

        this.transId = Guid.create().toString();
        this.transDate = new Date();
        this.transStatus= Status.New;
        this.orgId="";
        
}
}
