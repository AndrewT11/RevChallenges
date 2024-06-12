@isTest
public with sharing class AccountHelper_Test {
    public AccountHelper_Test() {

    }

    // @TestSetup
    // static void makeData(){
    //      // create list for method
    //      Account acc = new Account();
    //      acc.Name = 'TestAccount';
    //      insert acc;
    // }

    @isTest
    public static void myTestMethod() {
        //for  @TestSetup
        // List<Account> accList = [SELECT Id FROM Account];

        //loading data from csv file
        List<Account> accList = Test.loadData(Account.sObjectType, 'testLoadDataExample');
        // Test.loadData doesn't need you to insert list. That will be done when loading data.
        // insert accList;
        
        // call method
        AccountHelper.createDummyContact(accList);
        // create query
        List<Contact> conList = [SELECT AccountId, lastName FROM Contact];

        //compare created account id matches created contact AccountId
        Assert.areEqual(accList[0].Id, conList[0].AccountId);
        Assert.areEqual('TestLastName', conList[0].LastName);
    }
}