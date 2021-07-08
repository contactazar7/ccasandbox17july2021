public class SendEmailList {

    public List<SObject> selected { get; private set; }
    
    public SendEmailList(ApexPages.StandardSetController controller)
    {
        selected = controller.getSelected();
    }
    
    
    public void SendEmailTO() {

  List<Contact> conList =[SELECT Id, LastName,(SELECT Id, Name, Contact__c FROM Enrollments__r where ID =:selected), Email FROM Contact];

List<Id> contactIds = new List<Id>(); //set to keep the contact ids for those accounts

for(Contact c:conList)
{
    for(SFDC_Enrollment__c se:c.Enrollments__r)
    {
       if(c.Email !=null && c.Email !='')  //if this contact has email
    {
        contactIds.add(c.Id);
    } 
    }
    
}

        if(contactIds.size() >0){ 
            Messaging.MassEmailMessage emailToSend = new Messaging.MassEmailMessage();
                emailToSend.setTargetObjectIds(contactIds);
                emailToSend.setSubject('Test Subject');
                emailToSend.setTemplateID('00Xq0000000M7ra');
                Messaging.SendEmail(New Messaging.MassEmailMessage[]{emailToSend});
                             }

}
}