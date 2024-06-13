public with sharing class DataLord {
    public DataLord() {

    }
    // challenge I
    public static Integer NumAccounts() {
        List<Account> accts = [SELECT Id, Name FROM Account];
        Integer numAccounts = accts.size();

        return numAccounts;
    }
    // challenge II
    public static Integer NumHot() {
        List<Account> accts = [SELECT Id, Name FROM Account WHERE Rating = 'Hot'];
        Integer numAccounts = accts.size();
        
        return numAccounts;
    }

    // challenge III
    public static Integer NumComplex() {
        List<Account> accts = [SELECT Id, Name FROM Account  WHERE Name LIKE '%&%'];
        Integer numAccounts = accts.size();

        return numAccounts;
    }

    // challenge IV
    public static List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue ASC LIMIT 5];

    }

    // challenge V
    public static List<Opportunity> LastBigOpportunity() {
        List<Oppurtunity> lastBig = [SELECT Name, CloseDate, Amount FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC];

        return lastBig[0];
    }

    // challenge VI
    public static List<Contact> MajorPlayers() {
        List<Contact> newCont = new List<Contact>();

        List<Account> firstAcctList = [SELECT Id, Name, (SELECT Name FROM Contacts) FROM Account WHERE Rating = 'Hot'];

        for(Account a : firstAcctList) {
            Contact c = a.Contacts;
            newCont.add(c);
        }
        return newCont;
    }

    //challenge VII
    public static Contact MostPopularAccount() {
        
        return [SELECT Account.Name, COUNT(Id) FROM Contact GROUP BY Account.Name ORDER BY COUNT(Id) DESC LIMIT 1];

        // String contacts = 'SELECT Id FROM Contacts'; 
        // List<Account> popularAccounts = [SELECT Name, COUNT(Id), (SELECT Id FROM Contacts) FROM Account GROUP BY Name ORDER BY COUNT(contacts) DESC];

        // return popularAccounts[0];
    }

}