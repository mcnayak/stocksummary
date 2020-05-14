global class UpdateSnowFall implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID,snowfall__c FROM WeatherHistory__c'
        );
    }
    global void execute(Database.BatchableContext bc, List<WeatherHistory__c> scope){
        // process each batch of records
        List<WeatherHistory__c> whs = new List<WeatherHistory__c>();
        for (WeatherHistory__c wh : scope)
        {
            wh.snowfall__c=9;
            recordsProcessed = recordsProcessed + 1;
        }
        update whs;
    }    
        
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
 //       EmailUtil.sendMessage(job, recordsProcessed);
    }    
}