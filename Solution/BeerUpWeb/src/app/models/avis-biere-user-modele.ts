export class AvisBiereUserModele {

    aviBieUserId:string;
    bieId:string;
    userId:string;
    orgId:string;
    aviBieUserDateAvis: Date;
    aviBieUserActif:boolean;
    avisAcid:number;
    avisCafe:number;
    avisCara:number;
    avisFruit:number;
    avisHoub:number;
    avisMalt:number;
    avisSucr:number;
    avisAmer:number;
    

    constructor(){
        this.aviBieUserId="";
        this.bieId="";
        this.userId="";
        this.orgId ="";
        this.aviBieUserDateAvis =new Date();
        this.aviBieUserActif = true;
        this.avisAcid = 0;
        this.avisCafe = 0;
        this.avisCara = 0;
        this.avisFruit = 0;
        this.avisHoub = 0;
        this.avisMalt = 0;
        this.avisSucr = 0;
        this.avisAmer = 0;
    }

}
