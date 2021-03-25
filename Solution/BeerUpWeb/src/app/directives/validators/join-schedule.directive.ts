
import { AbstractControl, ValidatorFn } from "@angular/forms";
import { HoraireModele } from "src/app/models/horaire-modele";


export function JoinScheduleDirective(lHoraires:Array<HoraireModele>): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const horDebut = control.get('horDebut');
    const horFin = control.get('horFin');
    const horJour = control.get('horJour');
    const horId = control.get('horId');

    let test = false;

    lHoraires.forEach(element => {
      if((horId?.value!=element.horId) && element.horJour==horJour?.value.toString()){
          if(((horDebut?.value>=element.horDebut) && (horDebut?.value<=element.horFin))||
          ((horFin?.value>=element.horDebut) && (horFin?.value<=element.horFin))||
          ((horFin?.value>=element.horFin) && (horDebut?.value<=element.horDebut))){
            test = true;
          }
      }
    });
    return test ? {joinSchedule: {value: true}} : null;
  };
}
