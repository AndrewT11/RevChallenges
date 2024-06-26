public class ContactHelper {

    //challenge 2: Create a trigger to set a default value for Email on Contacts that are inserted without one.
    public ContactHelper() {}
    
    public static void addEmailIfNone(List<Contact> contacts) {
        for(Contact contact : contacts) {
            if(String.isBlank(contact.Email)) {
                contact.Email = contact.FirstName + contact.LastName + '@email.com';
            }
        }
    }
    //challenge 4: Create a trigger to update the phone field of the related Account when a Contact's phone field is updated. The Account and Contact should end up having the same value in their phone fields.
    public static void updateAccountPhone(List<Contact> contacts) {
        // grab the id of the account that matches the id of the contact, update phone of the account with the phone of hte contact
        // contact.accountId will match Account.Id
        Set<Id> accountId = new Set<Id>();
        Map<Id, String> accountPhone = new Map<Id, String>();

        for (Contact contact : contacts) {
            if(contact.AccountId > 0 && !String.isBlank(contact.phone)) {
                accountId.add(contact.accountId);
                accountPhone.put(contact.AccountId, contact.phone);
            }
        }
        List<Account> accountsToUpdate = [SELECT Id, Name FROM Account WHERE Id IN :accountId];

        for(Account account : accountsToUpdate) {
            if (AccountPhone.containsKey(account.Id)) {
                account.phone = accountPhone.get(account.id);
            }
        }
        update accountsToUpdate;
    }
}