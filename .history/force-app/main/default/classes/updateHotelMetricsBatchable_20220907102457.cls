public with sharing class updateHotelMetricsBatchable implements Database.Batchable<sObject> {

    public String query = 'SELECT Id,TTM_ACV__c from Hotel__c';

    public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

    public void execute(Database.BatchableContext BC, List<Hotel__c> scope){

        list<AggregateResult> ReservationAmount = [SELECT sum(Reservation_Amount__c) amt, Room__r.Hotel__c FROM Reservation__c 
                                       where check_in_date__c = LAST_N_MONTHS:12 GROUP BY Room__r.Hotel__c];

map<Id,Decimal> aggACV = new map<Id,Decimal>();
system.debug(ReservationAmount);
for(AggregateResult agg: ReservationAmount){
    aggACV.put((Id)agg.get('Hotel__c'), (Decimal)agg.get('amt'));
}

    }

   public void finish(Database.BatchableContext BC){
   }

}