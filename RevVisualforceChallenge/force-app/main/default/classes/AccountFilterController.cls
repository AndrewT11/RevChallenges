// Challenge X
//Create a second Visualforce page that takes in some user input to filter Accounts by. //Once this input is submitted, your page should display the previous Visualforce page you made and use the filter to filter the list of all Accounts.

public with sharing class AccountFilterController {
    
    public String accountFilter { get; set; }
    public List<Account> filteredAccounts {get; set; }
    public Map<Id, String> accountContactNamesMap { get; set; }
    
    public AccountFilterController() {
        accountFilter = '';
        filteredAccounts = new List<Account>();
        accountContactNamesMap = new Map<Id, String>();
    }

    public PageReference filterAccounts() {
        filteredAccounts = [SELECT Id, Name, (SELECT Name FROM Contacts) FROM Account WHERE Name LIKE :('%' + accountFilter + '%')];
        accountContactNamesMap.clear();

        for (Account account : filteredAccounts) {
            List<String> contactNames = new List<String>();
            for(Contact contact : account.Contacts) {
                contactNames.add(contact.Name);
            }
            accountContactNamesMap.put(account.Id, String.join(contactNames, ''));
        }
        return Page.AccountsAndContacts;
    }    
}