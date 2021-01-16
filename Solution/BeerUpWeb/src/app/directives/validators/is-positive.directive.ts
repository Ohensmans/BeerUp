import { AbstractControl, ValidatorFn } from "@angular/forms";


export function IsPositiveDirective(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const test = (!isNaN(control.value) && parseFloat(control.value)<=0);
    return test ? {notPositiveInterger: {value: control.value}} : null;
  };
}
