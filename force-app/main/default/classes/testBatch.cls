public with sharing class testBatch implements Database.Batchable<SObject>, Database.Stateful {
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID FROM Account Where Id not in (Select AccountId FROM Contact)'
        );
    }

    public void execute(Database.BatchableContext bc, List<Account> acc){
        List<Contact> c = new List<Contact>();
        for (Account account : acc) {            
            Contact con = new Contact(FirstName = 'Nguyen', LastName = 'Huyy',  AccountId = account.Id);            
            c.add(con);
            recordsProcessed++;                                                    
        }
        try {
            insert c;   
        } catch (DmlException e) {
            System.debug('Exception ' + e);
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed');
    }
}
