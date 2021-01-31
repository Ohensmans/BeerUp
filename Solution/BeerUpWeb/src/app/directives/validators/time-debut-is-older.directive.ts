import { AbstractControl, ValidatorFn } from '@angular/forms';


export function TimeDebutIsOlderDirective(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const horDebut = control.get('horDebut');
    const horFin = control.get('horFin');

    if(horFin== null || horDebut==null || horFin?.value<horDebut?.value)
    {
      return {timeDebutIsOlder: {value: true}}
    }

    return null;
  };
}
