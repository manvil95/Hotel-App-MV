public class ReservationController {

    // Create Default Reservation Item for new Reservation

    public static void createReservationItem(List<Reservation__c> reservations){

        List<Reservation_line_item__c> newReservations = new list<Reservation_line_item__c>();

        PricebookEntry defaultPricebook = [Select Id,Name,Product2Id,UnitPrice from PricebookEntry WHERE Product2Id = '01t7Q000000VIqvQAG'];


        list<Reservation__c> reservationQuery= [SELECT Id,Name,Guest_name__r.Name,Guest_name__r.Discount__c FROM Reservation__c WHERE Id IN: reservations];

        map<Id,Reservation__c> reservationMap = new map<Id,Reservation__c>(reservationQuery);

        for(Reservation__c r: reservations){

            Reservation_line_item__c rlineItem = new Reservation_line_item__c(
                Name = r.Name + ' - ' + r.Number_of_Days__c + ' stay. ' + reservationMap.get(r.Id).Guest_name__r.Name,
                Product__c = defaultPricebook.Product2Id,
                Reservation__c = r.Id,
                Quantity__c = r.Number_of_Days__c,
                Discount__c = reservationMap.get(r.Id).Guest_name__r.Discount__c,
                List_Price__c =  defaultPricebook.UnitPrice * r.Number_of_Days__c,
                Total_Price__c = (defaultPricebook.UnitPrice * r.Number_of_Days__c) * (1 - (reservationMap.get(r.Id).Guest_name__r.Discount__c/100))
            );
            newReservations.add(rlineItem);
        }

        insert newReservations;

    }



    public static void checkIfRoomAvailable(List<Reservation__c> reservations){


    // Store all rooms from New reservations list
        List<Id> roomList = new list<Id>();

        for(Reservation__c rl :reservations){
        roomList.add(rl.Room__c);
        }


        map<Id,list<Reservation__c>> roomReservations = new map<Id,list<Reservation__c>>();

        list<Room__c> roomWithReservations = [SELECT Id, Name, (SELECT Id, Name, Check_In_Date__c, Check_out_Date__c, Room__c FROM Reservations__r) FROM Room__c WHERE Id IN : roomList];

        for(Room__c r : roomWithReservations ){

        roomReservations.put(r.Id,r.Reservations__r);

        }

        system.debug(roomReservations);

        for(Reservation__c res : reservations){


            for(Room__c roomRes : roomReservations.get(res.Room__c)){

               map<Id,Reservation__c> reserMap = new map<Id,Reservation__c>(roomRes.Reservations__r);
            }


            }


        }

}