import { LightningElement,wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Room__c.Name',
    'Room__c.Available__c',
    'Room__c.Phone',
    'Room__c.Email',
    ];

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId = 'a017Q00000lzxhrQAA';

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

}