public class GuestController {

    public static List<Contact> discountCalculator(map<Contact,Integer> contacts){

        List<Contact> contactUpdateList = new list<Contact>();

        for(Contact c : contacts.keySet()){

           if(contacts.get(c.Id) > 5 ){
            c.Discount__c = 30;

           }
           else if(contacts.get(c.Id) > 3 ){
            c.Discount__c = 20;

           }
           else if(contacts.get(c.Id) > 1 ){
            c.Discount__c = 10;
           }
           else {

            c.Discount__c = 0;

           }

       contactUpdateList.add(c);
    }

    return contactUpdateList;

}

}