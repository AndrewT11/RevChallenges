public class AccountHelper {
	
    public AccountHelper() {}
    // challenge 1
    public static void blockContactDelete(List<Account> accountList) {
        
        Set<Id> accountIds = new Set<Id>();
        
  
        for (Account account : accountList) {
            accountIds.add(account.Id);
        }
        
        List<Contact> contactList = [SELECT AccountId FROM Contact WHERE AccountId IN :accountIds];
        
        Set<Id> accountsWithContacts = new Set<Id>();
        
        for (Contact contact : contactList) {
            accountsWithContacts.add(contact.AccountId);
        }
        
        for (Account account : accountList) {
            if (accountsWithContacts.contains(account.Id)) {
                account.addError('You cannot delete accounts with contacts!');
            }
        }
    }

    //challenge 3
    public static void createContact(List<Account> accountList) {
        List<Contact> contactList = new List<Contact>();
        Integer i = 0;
        for(Account account : accountList) {
            Contact contact = new Contact();
            contact.FirstName = 'Test';
            contact.LastName = 'Contact' + i;
            contact.AccountId = account.Id;
            contactList.add(contact);
            i++;
        }
        insert contactList;
        
    }
}