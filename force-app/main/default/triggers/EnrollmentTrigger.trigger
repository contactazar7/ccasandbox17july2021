trigger EnrollmentTrigger on SFDC_Enrollment__c (after insert, after update, after delete, after undelete) {
    
    EnrollmentTriggerHandler enrollmentHandler = new EnrollmentTriggerHandler();
    
    if(Trigger.isInsert && Trigger.isAfter){
        enrollmentHandler.handleAfterInsert(Trigger.new);
        CompetencyPostEnrollClass.getdate(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        enrollmentHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        CompetencyPostEnrollClass.getdate(Trigger.new);
    }
    if(trigger.isDelete && Trigger.isAfter){
        enrollmentHandler.handleAfterInsert(trigger.old);
        CompetencyPostEnrollClass.getdate(Trigger.old);
    }
}