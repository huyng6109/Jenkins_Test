@isTest
private with sharing class TriggerOnUpdateMailingTest {
    @isTest
    static void testTriggerOnUpdateMailing() {
        Account a = new Account(Name='Test');
        insert a;
        Contact c = new Contact(FirstName = 'Test', LastName = 'Trigger', AccountId = a.Id);
        insert c;

        Test.startTest();
        a.ShippingCity = 'Ne Duc Tho';
        update a;
        Test.stopTest();
        c = [select MailingCity from Contact Where Id = :c.Id];
        System.assertEquals('Ne Duc Tho', c.MailingCity);        
    }
}
