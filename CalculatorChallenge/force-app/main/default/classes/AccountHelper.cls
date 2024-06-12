public class AccountHelper {

    public AccountHelper() {}
    
  
    public void createNewAccount(String name) {
        
        Account acc = new Account();
        acc.Name = name;
        insert acc;
    }
    
    public void createMultipleNewAccounts(List<String> accNames) {
		
        List<Account> newAccList = new List<Account>();
        
        for(Integer i = 0; i < accNames.size(); i++ ) {
            Account acc = new Account();
            acc.Name = accNames[i];
            
            newAccList.add(acc);
        }
        insert newAccList;
    }

    // triggers function
    public static void createDummyContact(List<Account> accList) {

        List<Contact> newConList = new List<Contact>();
        for(Account acc : accList) {
            Contact con = new Contact();
            con.lastName = 'TestLastName'; // just setting arbitrary last name
            con.AccountId = acc.Id;
            newConList.add(con);
        }
        Database.insert(newConList);
    }

    // create trigger to preven the deletion of Accounts with Contacts
    // need to addError like example from ContactHelper
    // retrieve related contacts
    // look through each contact and add AccountId to list
    // loop through accounts and add an error if account contains any contact
    public static void blockContactDelete(List<Account> accList) {
        for(Account acc : accList) {
            List<Contact> contacts = [SELECT AccountId FROM Contact WHERE AccountId = :acc.Id];

            List<Id> accountIds = new List<Id>();
            for(Contact contact : contacts) {
                //grab the accountId from each contactW
                accountIds.add(contact.accountId);
            }
          
            if(accountIds.contains(acc.Id)) {
                acc.addError('You cannot delete accounts with contacts');
            }
        }
    }
}