// Challenge VII
// Create a Visualforce page that displays an Account based off of user input.

// Challenge IX
// Create a Visualforce page that displays all Accounts in the system and all their related Contact Names in the same table. The Contact names should be separated by a comma and a space.


public with sharing class AccountSearchController {
    
    public String accountId { get; set; }
    public Account acc { get; set; }
    public List<Contact> contacts { get; set; }
    
    public AccountSearchController() {
        acc = new Account();
    }

// Challenge VIII
// Add to your Visualforce page the functionality to display all related Contacts of the Account as an unformatted list of names.

    public void searchAccount() {
        if(!String.isBlank(accountId)) {
            try {
                acc = [SELECT Name, Type, Industry, Phone, CurrencyIsoCode FROM Account WHERE Id = :accountId Limit 1];
                contacts = [SELECT Id, Name, Phone FROM Contact WHERE AccountId = :accountId];
            } catch (Exception e) {
                acc = new Account();
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Account not found'));
            }
           
        } else {
            acc = new Account();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter a valid Account ID.'));
            
        }
    }
}