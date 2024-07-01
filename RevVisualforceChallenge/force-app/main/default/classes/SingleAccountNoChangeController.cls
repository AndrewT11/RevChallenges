public with sharing class SingleAccountNoChangeController {
    private Account acc;
    private String greeting;
    
    public SingleAccountNoChangeController() {
        String accountId = '001bm0000050gNpAAI';
        acc = [SELECT Name, Type, Industry, Phone, CurrencyIsoCode FROM Account WHERE Id = :accountId Limit 1];
        greeting = '';
    }

    public Account getAcc() {
        return this.acc;
    }

    public String getGreeting() {
        return this.greeting;
    }
    //challenge 6
    public void setGreeting() {
        System.debug('setGreeting called');
        this.greeting = 'Welcome ' + acc.Name + '!';
        System.debug('Greeting set to: ' + this.greeting);
    }
}