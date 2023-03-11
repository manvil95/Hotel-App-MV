import { LightningElement, api } from "lwc";

import cloneRecords from "@salesforce/apex/CloneRecordController.cloneRecord";

export default class CloneRecords extends LightningElement {
  @api recordId;
  @api ClassName;

  newRecord;



  cloneRecord() {
    console.log("button is being clicked!");

    console.log(
      "Class Name Passed: ",
      this.ClassName,
      " recordId Passed: ",
      this.recordId
    );

    cloneRecords({ recordId: this.recordId, className: this.ClassName })
      .then((result) => {
        this.newRecord = result;
      })
      .catch((error) => {
        console.log(error);
      });
  }

}