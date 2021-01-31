import { AbstractControl, ValidatorFn } from '@angular/forms';


export function TimeDebEqualTimeFinDirective(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const horDebut = control.get('horDebut');
    const horFin = control.get('horFin');

    if(horFin== null || horDebut==null || horFin?.value==horDebut?.value)
    {
      return {timeDebutIsEqualTimeFin: {value: true}}
    }

    return null;
  };
}
