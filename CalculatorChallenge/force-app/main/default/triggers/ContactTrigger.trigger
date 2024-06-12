trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            if(!Trigger.isExecuting) {
                Account acc = new Account();
                acc.Name = 'testTriggerRecusion';
                insert acc;
            }
           
        }
        when BEFORE_UPDATE {
            // ContactHelper.preventEmailDomainChange(Trigger.new, Trigger.old);
            ContactHelper.preventEmailDomainChange(Trigger.new, Trigger.oldMap);
    
        }
        when BEFORE_DELETE {

        }
        when AFTER_INSERT {
           
        }
        when AFTER_UPDATE {

        }
        when AFTER_DELETE {

        }
        when AFTER_UNDELETE {

        }
  }
}