public class UpdateMailingAddress {
    public static void updateMailingAddress(Map<Id, Account> mapOldAcc, List<Account> a) {
        List<Contact> c = new List<Contact>();
        Map<Id, Account> mapNewAccount = new Map<Id, Account>();
        for(Account newAccount : a) {
            Account oldAcc = mapOldAcc.get(newAccount.Id);
            if (newAccount.ShippingStreet != oldAcc.ShippingStreet || 
                newAccount.ShippingCountry != oldAcc.ShippingCountry ||
                newAccount.ShippingPostalCode != oldAcc.ShippingPostalCode ||
                newAccount.ShippingState != oldAcc.ShippingState ||
                newAccount.ShippingCity != oldAcc.ShippingCity) 
            {
                mapNewAccount.put(newAccount.Id,newAccount);
            }
        }
        for(Contact updateContact : [Select id,AccountId From Contact Where AccountId in:mapNewAccount.keySet()]) {
            updateContact.MailingStreet = mapNewAccount.get(updateContact.AccountId).ShippingStreet;
            updateContact.MailingCity  = mapNewAccount.get(updateContact.AccountId).ShippingCity;
            updateContact.MailingPostalCode = mapNewAccount.get(updateContact.AccountId).ShippingPostalCode;
            updateContact.MailingState = mapNewAccount.get(updateContact.AccountId).ShippingState;
            updateContact.MailingCountry  = mapNewAccount.get(updateContact.AccountId).ShippingCountry;
            c.add(updateContact);
        }
        update c;
    }            
}

