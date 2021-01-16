import { AbstractControl, FormGroup, ValidationErrors, ValidatorFn } from "@angular/forms";

export function DateDebutIsOlderDirective(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const dateDebut = control.get('dateDebut');
    const dateFin = control.get('dateFin');

    if(dateFin== null || dateDebut==null || Date.parse(dateFin?.value)<Date.parse(dateDebut?.value))
    {
      return {dateDebutIsOlder: {value: true}}
    }

    return null;
  };
}

