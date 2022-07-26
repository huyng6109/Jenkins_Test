@isTest
public with sharing class testFactory {
    
    public static Account createAccount(String name) {
        Account a = new Account(Name = name);
        return a;
    }

    public static Contact createContact(Account acc) {
        Contact c = new Contact(FirstName = 'Nguyen', LastName = 'Huyy',  AccountId = acc.Id);            
        return c;
    }
}
