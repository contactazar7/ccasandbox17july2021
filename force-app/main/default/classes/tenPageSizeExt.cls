public class tenPageSizeExt {
 
    public list<SFDC_Enrollment__c> selected;
    public list<SFDC_Enrollment__c> conval{set;get;}
    public tenPageSizeExt(ApexPages.StandardSetController controller) {
        this.selected=controller.getSelected();
        system.debug('dgsdgs'+this.selected);
    }
    
     public void SendEmailTO() {
         
           set<Id> conIds = new set<Id>(); 
        for(SFDC_Enrollment__c en:[SELECT Id, Name, Contact__c FROM SFDC_Enrollment__c where ID IN :selected])
        {
            conIds.add(en.Contact__c);
        }
        

  List<Contact> conList =[SELECT Id, LastName, Email FROM Contact where ID IN :conIds];

List<Id> contactIds = new List<Id>(); //set to keep the contact ids 

for(Contact c:conList)
{
       if(c.Email !=null && c.Email !='')  //if this contact has email
    {
        contactIds.add(c.Id);
    } 
}

        if(contactIds.size() >0){ 
            Messaging.MassEmailMessage emailToSend = new Messaging.MassEmailMessage();
                emailToSend.setTargetObjectIds(contactIds);
              //  emailToSend.setSubject('Test Subject');
                emailToSend.setTemplateID('00X5Y000003U03t');
                Messaging.SendEmail(New Messaging.MassEmailMessage[]{emailToSend});
                             }

}
}