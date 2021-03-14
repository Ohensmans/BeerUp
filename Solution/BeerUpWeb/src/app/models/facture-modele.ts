export class FactureModele {
    facId:string;
    facDate:Date;
    facStatus:string;
    

    constructor(){
        enum Status {
            New = "NEW", 
            Correction = "CORRECTION", 
            Confirmed = "CONFIRMED"
        }

        this.facId ="0";
        this.facDate = new Date();
        this.facStatus= Status.New;
        
}

    
}
