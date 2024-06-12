public with sharing class SOSLChallenges {
    public SOSLChallenges() {

    }
    // challenge 1
    public static List<List<SObject>> contactsAndLeads() {
        List<List<SObject>> searchList = [FIND 'Tom' IN ALL FIELDS RETURNING Contact(Name), Lead(Name)];

        // List<Contact> contactList = new List<Contact>();
        // List<Lead> leadList = new List<Lead>();

        // contactList = (List<Contact>) searchList[0];
        // leadList = (List<Lead>) searchList[1];

        return searchList;
    }

    // challenge 2
    public static List<List<SObject>> aoAccounts() {
        List<List<SObject>> searchList = [FIND '*a*o*' IN ALL FIELDS RETURNING Account(Name)];
        
        // List<Account> accountList = new List<Account>();
        // accountList = (List<Account>) searchList[0];

        return searchList;
    }
}