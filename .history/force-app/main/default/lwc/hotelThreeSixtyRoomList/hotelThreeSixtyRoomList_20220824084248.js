import { LightningElement,wire } from 'lwc';
import roomList from '@salesforce/apex/roomController.roomList';
import hotelId from '@salesforce/messageChannel/hotelId__c';

import {
    subscribe,
    APPLICATION_SCOPE,
    MessageContext
} from 'lightning/messageService';

const dataColumns = [
    {label:'Name',fieldName:'Name'},
    {label:'Id',fieldName:'Id'}
];

export default class HotelThreeSixtyRoomList extends LightningElement {
    subscription = null;

    roomList;
    dataColumns = dataColumns;
    hotelValue = 'a007Q00000AFc6GQAT';
    recId;

    @wire(MessageContext)
    messageContext;

      // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.MessageContext,
                hotelId,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    //  Handler for message received by component
    handleMessage(message) {
        console.log('handlemessagetriggered');
        this.hotelId = message.hotelId;
    }

     getRoomListDropdown() {

        roomList({h: this.hotelValue }).then((result) => {
            this.roomList = result;
        console.log(this.roomList.data);
        }).catch((error) => {
            console.error(error);
        })
    }

    connectedCallback(){
        console.log(this.hotelId)
        this.getRoomListDropdown();
        console.log('getRoomList Handled');
        this.subscribeToMessageChannel();

    }

}