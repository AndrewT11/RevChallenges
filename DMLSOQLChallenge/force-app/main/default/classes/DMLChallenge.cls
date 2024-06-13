public with sharing class DMLChallenge {
    public DMLChallenge() {

    }

    //challenge 1
    public static void spawnContacts() {
        try {
            List<Contact> contactList = new List<Contact>();

            for(Integer i = 0; i < 200; i++) {
                Contact contact = new Contact();
                contact.LastName = 'Contact ' + i;
                contactList.add(contact);
            }
            if(contactList.size() > 0) {
                Database.insert(contactList);
            }
        } catch(DmlException e) {
            System.debug('An error has occurred while creating contacts: ' + e.getMessage());
        }
        
       
    }

    // challenge 2
    public static void createHomes() {
        
        try {
            List<Account> accountList = new List<Account>();

            for(Integer i=0; i < 3; i++) {
                Account account = new Account();
                account.Name = 'Account ' + i;
                accountList.add(account);
            }
            if(accountList.size() > 0 ) {
                Database.insert(accountList);
            }
        } catch(DmlException e) {
            System.debug('An error has occurred while inserting accounts: ' + e.getMessage());
        }
       
    }

    //challenge 3
    public static void relocate() {
        try {
            List<Contact> contactList = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 50];

            if(contactList.size() > 0) {
                Database.delete(contactList);
            }
        } catch (DmlException e) {
            System.debug('An error has occurred during deletion of contacts ' + e.getMessage());
        }
    }

    //challenge 4
    public static void assignHomes() {
        try{
            spawnContacts();
            createHomes();

            List<Contact> contactList = [SELECT Id, Name FROM Contact ORDER BY CreatedDate DESC LIMIT 200];
            List<Account> accountList = [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 3];

            for(Contact c : contactList) {
                // picks a random number between the values of 0, 1 or 2
                Integer randomIndex = Math.floor((Math.random() * accountList.size()));
                c.AccountId = accountList[randomIndex].id;
            }
            Databse.update(contactList);
        } catch (DmlException e) {
            System.debug('An error occurred updating contacts: ' + e.getMessage());
        }
        


    }
}