import { AbstractControl, ValidatorFn } from '@angular/forms';


export function IsIntegerAndPositiveDirective(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const test = ((parseFloat(control.value) == parseInt(control.value)) && !isNaN(control.value) && parseInt(control.value)<=0);
    return test ? {notPositiveInterger: {value: control.value}} : null;
  };
}
