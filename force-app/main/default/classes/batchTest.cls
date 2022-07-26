@isTest
private with sharing class batchTest {
    
    @isTest static void testExecute() {
        List<Account> a = new List<Account>();
        for(Integer i = 0; i < 200; i++){
            Account acc = testFactory.createAccount('huyy');
            a.add(acc);
        }

        insert a;

        Test.startTest();
        testBatch tb = new testBatch(); 
        Database.executeBatch(tb, a.size());
        Test.stopTest();
        System.assertEquals(200,  a.size(), 'hello world');        
    }
}
