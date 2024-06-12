public with sharing class ContactHelper {
    public ContactHelper() {


    }

    public static void preventEmailDomainChange(List<Contact> newConList, Map<Id, Contact> oldConMap) {

        for(Contact newCon : newConList) {
            
            Contact oldCon = oldConMap.get(newCon.Id);

            if(newCon.Id == oldCon.Id) {
                if(String.isBlank(oldCon.Email)) {
                    return;
                }
                // we need to grab the domain from each and compare them
                String oldDomain = oldCon.Email.substringAfter('@');
                String newDomain = newCon.Email.substringAfter('@');

                if(oldDomain != newDomain) {
                    newCon.Email.addError('Domain cannot be changed!');
                }
            }
        
        }

        // for(Contact newCon : newConList) {
        //     for(Contact oldCon : oldConList) {
        //         if(newCon.Id == oldCon.Id) {
        //             if(String.isBlank(oldCon.Email)) {
        //                 return;
        //             }
        //             // we need to grab the domain from each and compare them
        //             String oldDomain = oldCon.Email.substringAfter('@');
        //             String newDomain = newCon.Email.substringAfter('@');

        //             if(oldDomain != newDomain) {
        //                 newCon.Email.addError('Domain cannot be changed!');
        //             }
        //         }
        //     }
        // }
    }
}