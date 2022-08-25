import { LightningElement } from 'lwc';
import roomList from '@salesforce/apex/roomController.roomList';
import hotelId from '@salesforce/messageChannel/hotelId';

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

    roomList ;
    dataColumns = dataColumns;
    hotelValue = 'a007Q00000AFc6GQAT';


      // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                hotelId,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

     // Handler for message received by component
    handleMessage(message) {
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
        this.subscribeToMessageChannel();
        console.log()
        this.getRoomListDropdown();

    }

}