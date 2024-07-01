public with sharing class AccountsAndContactsController {
    public List<Account> accounts { get; set; }
    public Map<Id, String> accountContactNamesMap { get; set; }

    public AccountsAndContactsController() {
        accounts = [SELECT Id, Name, (SELECT Name FROM Contacts) FROM Account];
        accountContactNamesMap = new Map<Id, String>();
        
        for (Account acc : accounts) {
            List<String> contactNames = new List<String>();
            for (Contact c : acc.Contacts) {
                contactNames.add(c.Name);
            }
            accountContactNamesMap.put(acc.Id, String.join(contactNames, ', '));
        }
    }
}