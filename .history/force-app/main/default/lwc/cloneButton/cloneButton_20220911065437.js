import { LightningElement,api } from 'lwc';

import cloneRecords from '@salesforce/apex/CloneRecordController.cloneRecords';

export default class CloneButton extends LightningElement {

  @api ClassName;
  @api recordId;

    cloneRecordHandler(){

        console.log('button is being clicked!');

        console.log('Class Name Passed: ',this.ClassName, ' recordId Passed: ',this.recordId);

        cloneRecords({ "recordId":this.recordId, "className":this.ClassName}).then((result) => {


            console.log('new account is', result);

            }).catch((error) => {
                console.log(error);
            });



    }


}