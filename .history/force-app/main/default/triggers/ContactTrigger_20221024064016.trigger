trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {


    switch on Trigger.operationType {

        when AFTER_INSERT {

            ContactTriggerHandler.afterInsertHandler(trigger.new);
        }
        when AFTER_UPDATE {

        }
    }

}