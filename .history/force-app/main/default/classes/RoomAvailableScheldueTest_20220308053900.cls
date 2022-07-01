@isTest(SeeAllData=true)
public class RoomAvailableScheldueTest {

 // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @isTest(SeeAllData=true) static void testScheduledJob() {
        // Create some out of date Opportunity records

        Reservation__c res = new Reservation__c(
        Name = 'Test reservation',
        Room__c = 'a017Q00000QksHwQAJ',
        Check_In_Date__c = Date.newInstance(2022, 03, 07),
        Check_out_Date__c = Date.newInstance(2022, 03, 08),
        Guest_name__c = '0037Q0000068d7EQAQ'
        );
        insert res;

        Reservation__c res2 = new Reservation__c(
        Name = 'Test reservation',
        Room__c = 'a017Q00000QksHwQAJ',
        Check_In_Date__c = Date.newInstance(2022, 03, 08),
        Check_out_Date__c = Date.newInstance(2022, 03, 21),
        Guest_name__c = '0037Q0000068d7EQAQ'
        );
        insert res2;

        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new RoomAvailableScheldule());
        // Verify the scheduled job has not run yet.
        list<Reservation__c> reservationTestBefore = [Select Id from  Reservation__c WHERE Room__c = 'a017Q00000QksHwQAJ'];
        system.debug(reservationTestBefore);
        System.assertEquals(2, reservationTestBefore.size(), 'Tasks exist before job has run');

        Test.stopTest();

        // Now that the scheduled job has executed,
        // check that our tasks were created
        list<Room__c> reservationTestAfter = [Select Id from  Room__c WHERE Available__c = true AND id = 'a017Q00000QksHwQAJ'];

        System.assertEquals(1,reservationTestAfter.size(),'Tasks were not created');

}
}