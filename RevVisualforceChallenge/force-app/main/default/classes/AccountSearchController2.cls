// Challenge XI & XII
// On your Visualforce page with all Accounts, implement a search feature. This feature should update the list of all Accounts with each character typed.
// Modify your table to suport inline editing

public with sharing class AccountSearchController2 {
    public String searchString { get; set; }
    public List<Account> accounts { get; set; }
    public Map<Id, String> accountContactNamesMap { get; set; }
    
    public AccountSearchController2() {
        searchString = '';
        accounts = new List<Account>();
        accountContactNamesMap = new Map<Id, String>();
        
    }

    public void search() {
        if (!String.isBlank(searchString)) {
            accounts = [SELECT Id, Name, (SELECT Name FROM Contacts) FROM Account WHERE Name LIKE :('%' + searchString + '%')];
            accountContactNamesMap.clear();

            for (Account account : accounts) {
                List<String> contactNames = new List<String>();
                for (Contact contact : account.Contacts) {
                    contactNames.add(contact.Name);
                }
                accountContactNamesMap.put(account.Id, String.join(contactNames, ', '));
            }
        }
    }

    //inline editing for Challenge XII
    public void updateAccounts() {
        update accounts;
    }

    // public void updateContacts() {
    //     List<Contact> contactsToUpdate = new List<Contact>();
    //     for (Account account : accounts) {
    //         contactsToUpdate.add(account.Contacts);
    //     }
    //     update ContactsToUpdate;
    // }

}