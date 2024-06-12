@isTest
public with sharing class AccountTestHelper {
    public AccountTestHelper() {

    }
    public static List<Account> generateAccounts(Integer i) {
        List<Account> accList = new List<Account>();
        for(integer counter=0; counter < i, i++) {
            Account acc = new Account();
            acc.Name= 'testAccount' + i;
            accList.add(acc);
        }
        insert accList;
        return accList;
    }
}