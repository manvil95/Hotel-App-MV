public class AccountsWithContacts {


    @AuraEnabled
    public static list<Account> accountList() {
        return [SELECT id,Name from Account];

    }

      @AuraEnabled
    public static list<Account> accountData(Id AccId) {
        return [SELECT id,Name from Account Where Id =: AccId];

    }

    @AuraEnabled
    public static list<Account> methodName(){
        try {


        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}