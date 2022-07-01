import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Room__c.Name',
    'Room__c.Available__c',
    'Room__c.Hotel__c',
    'Room__c.Mini_Bar__c',
    'Room__c.photo_url__c',
    'Room__c.Room_Number__c',
    'Room__c.Type__c',
    'Room__c.tv__c'
];

export default class HotelAppHomeRoomDetails extends LightningElement {


    recordId = 'a017Q00000lzxhrQAA';
    room;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    rooomData({ data, error }) {
        if (data) {

            this.room = {
                Name: data.fields.Name.value,
                Available__c: data.fields.Available__c.value,
                Mini_Bar__c: data.fields.Mini_Bar__c.value,
                photo_url__c: data.fields.photo_url__c.value,
                Room_Number__c: data.fields.Room_Number__c.value,
                Type__c: data.fields.Type__c.value,
                tv__c: data.fields.tv__c.value
            }

            data.fields.for

            console.log(this.room)
        }
        if (error) {
            console.error(error);
        }
    }

}