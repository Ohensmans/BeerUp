
const MILLIS_PER_SECOND = 1000;
const MILLIS_PER_MINUTE = MILLIS_PER_SECOND * 60;   //     60,000
const MILLIS_PER_HOUR = MILLIS_PER_MINUTE * 60;     //  3,600,000
const MILLIS_PER_DAY = MILLIS_PER_HOUR * 24;        // 86,400,000


export class TimeSpan {
    days:number;
    hours:number;
    milliseconds:number;
    minutes:number;
    seconds:number;
    ticks:number;
    totalDays:number;
    totalHours:number;
    totalMilliseconds:number;
    totalMinutes:number;
    totalSeconds:number;

    constructor(){
        this.days =0;
        this.hours=0;
        this.milliseconds=0;
        this.minutes=0;
        this.seconds=0;
        this.ticks=0;
        this.totalDays=0;
        this.totalHours=0;
        this.totalMilliseconds=0;
        this.totalMinutes=0;
        this.totalSeconds=0;
    }

    parse(horaire:string){
        let splitted = horaire.split(":",2);
        
        this.hours = Number.parseInt(splitted[0]);
        this.minutes = Number.parseInt(splitted[1]);

        this.setTotalTicks();
        return this;
    }

    setTotalTicks(){
        this.ticks = this.days*MILLIS_PER_DAY*1000 + this.hours*MILLIS_PER_HOUR*1000+this.minutes*MILLIS_PER_MINUTE+this.milliseconds*1000;
    }

}
