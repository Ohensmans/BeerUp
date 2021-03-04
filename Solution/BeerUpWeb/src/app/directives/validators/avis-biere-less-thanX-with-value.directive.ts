import { AbstractControl, FormGroup, ValidationErrors, ValidatorFn } from "@angular/forms";
import { UtilService } from "src/app/services/util.service";

export function AvisBiereLessThanXWithValueDirective(nbMiniAvis:number): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {

    const avisAcid = control.get('avisAcid');
    const avisCafe = control.get('avisCafe');
    const avisCara = control.get('avisCara');
    const avisFruit = control.get('avisFruit');
    const avisHoub = control.get('avisHoub');
    const avisMalt = control.get('avisMalt');
    const avisSucr = control.get('avisSucr');

    let count = 0;
    if(avisAcid?.value>0)
      count++
    if(avisCafe?.value>0)
    count++
    if(avisCara?.value>0)
    count++
    if(avisFruit?.value>0)
    count++
    if(avisHoub?.value>0)
    count++
    if(avisMalt?.value>0)
    count++
    if(avisSucr?.value>0)
    count++


    if(avisAcid== null || avisCafe==null || avisCara==null ||avisFruit==null ||avisHoub==null ||avisMalt==null ||avisSucr==null ||
      count<nbMiniAvis)
    {
      return {AvisBiereLessThanXWithValue: {value: true}}
    }

    return null;
  };
}
