trigger roomTrigger on Room__c (before insert) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {
     
            roomTriggerHandler.

    }

}
}