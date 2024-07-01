public with sharing class AccountSearchController {
    
    public String accountId { get; set; }
    public Account acc { get; set; }
    public List<Contact> contacts { get; set; }
    
    public AccountSearchController() {
        acc = new Account();
    }

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