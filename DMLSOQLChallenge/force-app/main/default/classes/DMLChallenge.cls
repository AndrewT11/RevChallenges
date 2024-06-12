public with sharing class DMLChallenge {
    public DMLChallenge() {

    }

    //challenge 1
    public static void spawnContacts() {
        List<Contact> contactList = new List<Contact>();

        for(Integer i = 0; i < 200; i++) {
            Contact contact = new Contact();
            contact.LastName = 'Contact ' + i;
            contactList.add(contact);
        }
        if(contactList > 0) {
            Database.insert(contactList);
        }
    }
}