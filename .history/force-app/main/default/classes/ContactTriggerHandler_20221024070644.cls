public with sharing class ContactTriggerHandler {

    public static void afterInsertHandler(List<Contact> cList){

       set<Id> accList = new set<Id>();
        for(Contact c : cList){
            accList.add(c.AccountId);
        }

        updateAccountList(accList);
}


    public static void afterUpdateHandler(list<Contact> cList,map<Id,Contact> cMap){

        list<Id> AccountToUpdate = new list<Id>();

        for(contact c: cList){

            if(c.AccountId != cMap.get(c.Id).AccountId){

                AccountToUpdate.add(c.AccountId);
                AccountToUpdate.add(cMap.get(c.Id).AccountId);

            }

           // ContactTriggerHandler.updateAccountList(AccountToUpdate);

        }

}


    public static void updateAccountList(list<Account> accList){

        map<Id,Integer> accInfo = new map<Id,Integer>();
        for(AggregateResult agr : [SELECT COUNT(Id) ContactCount, AccountId from Contact WHERE AccountId IN: accList
                                             AND AccountId <> null
                                             GROUP BY AccountId]){
           accInfo.put((Id) agr.get('AccountId'),(Integer) agr.get('ContactCount'));
        }

        for(list<Account> accL: [Select Id,Name from Account where Id IN:accInfo.keySet()]){

            list<Account> accountsToUpdate = new list<Account>();

                for(account acc :accL){
    		    acc.No_of_Contacts__c = accInfo.get(acc.Id);
                accountsToUpdate.add(acc);
            }

            update accountsToUpdate;

		}


}

}