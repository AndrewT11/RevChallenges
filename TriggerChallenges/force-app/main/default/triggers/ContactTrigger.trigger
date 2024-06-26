trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            ContactHelper.addEmailIfNone(Trigger.New);
        }
        when BEFORE_UPDATE {}
        when BEFORE_DELETE {}
        when AFTER_INSERT {}
        when AFTER_UPDATE {
            ContactHelper.updateAccountPhone(Trigger.old);
        }
        when AFTER_DELETE {}
        when AFTER_UNDELETE {}  
    }
}