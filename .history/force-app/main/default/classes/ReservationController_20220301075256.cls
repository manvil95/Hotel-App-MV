public class ReservationController {


    public static void createReservationItem(List<Reservation__c> reservations){


        for(Reservation__c r: reservations){


            Reservation_line_item__c rlineItem = new Reservation_line_item__c{

                Name = r.Name + ' - ' + r.Number_of_Days__c + ' stay ';

            }

        }



    }

}