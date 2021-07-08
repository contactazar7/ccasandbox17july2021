public class ProviderTriggerHandler {

    ProviderTriggerHelper helper = new ProviderTriggerHelper();
    public void handleBeforeInsert(List<Contact> contactList) {
        helper.updateSubmittedDate(contactList);
    }
    
    public void handleBeforeUpdate(List<Contact> contactList) {        
        helper.updateSubmittedDate(contactList);
    }
    
    public void handleAfterUpdate(List<Contact> contactList, Map<Id, Contact> newContactMap, Map<Id, Contact> oldContactMap) {        
        helper.createScreeningQuestions(contactList, newContactMap, oldContactMap);
    }
}