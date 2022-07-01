public class roomController {

    public class filters {

        @AuraEnabled (cacheable = true)
        List<String> rooms 
        /*
        "Single",
        "Double",
        "King"
    ],
    "city": "London",
    "hotel": "Olypmpic Hotel London",
    "country": "United Kingdom",
    "date": "endDate",
    "value": "2022-06-18",
    "numberOfGuests": "5",
    "available": true
}


    @AuraEnabled (cacheable = true)
    public static list<Room__c> roomDisplayList(){

        list<Room__c> roomList = [Select Id,Hotel__r.Name,Name,Available__c,Type__c,Room_Number__c,photo_url__c,Max_Number_of_Guests__c  from Room__c];

        return roomList;
    }


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

}