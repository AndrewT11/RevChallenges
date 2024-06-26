public class ContactHelper {

    //challenge 2: Create a trigger to set a default value for Email on Contacts that are inserted without one.
    public ContactHelper() {}
    
    public static void addEmailIfNone(List<Contact> contacts) {
        for(Contact contact : contacts) {
            if(String.isBlank(contact.Email)) {
                contact.Email = contact.FirstName + contact.LastName + '@email.com';
            }
        }
    }
}