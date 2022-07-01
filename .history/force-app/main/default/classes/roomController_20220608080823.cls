public class roomController {


    public static list<Room__c> roomList(list<Hotel__c> hlist){

        list<Room__c> roomList = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE Hotel__c IN: hlist];

        return roomList;
    }

    public static list<Room__c> availableRooms(list<Hotel__c> hlist){

        list<Room__c> availableRooms = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE Hotel__c IN: hlist AND Available__c = true];

        return availableRooms;
    }

    public static list<Room__c> occupiedRooms(list<Hotel__c> hlist){

        list<Room__c> occupiedRooms = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE Hotel__c IN: hlist AND occupied__c = true];
        return occupiedRooms;
    }

    public static list<Room__c> endReservation(){

        list<Room__c> endReservation = [Select Id,Name,Available__c,Type__c,Room_Number__c from Room__c WHERE occupied__c = true AND ID IN (SELECT Room__c from Reservation__c WHERE Check_out_Date__c = TODAY)];

        return endReservation;

    }

    @AuraEnabled
    public static list<Room__c> roomsList(){
    }
}