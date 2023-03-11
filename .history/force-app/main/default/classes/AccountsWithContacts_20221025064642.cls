public class AccountsWithContacts {


    @AuraEnabled
    public static list<Account> accountList() {
        return [SELECT id,Name from Account];

    }


      @AuraEnabled
    public static list<Account> accountListWithIds(Id AccId) {

        return [SELECT id,Name from Account Where Id =: AccId];

    }

}