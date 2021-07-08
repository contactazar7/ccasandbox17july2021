public class ProviderTriggerHelper {
   
    public void updateSubmittedDate(List<Contact> contactList) {
        
        List<String> accountNameList = new List<String>();
        accountNameList.add('CCA Provider Account');
        accountNameList.add('CCA Vendor Account');
        accountNameList.add('CCA Do-Not-Use Account');
        Map<String, Id> accountMap = new Map<String, Id>();
        for(Account acc :[Select Id, Name From Account Where Name IN :accountNameList]){
            accountMap.put(acc.Name, acc.Id);
        }
        for(Contact cn1: contactList) {
            
            if(cn1.Participation_form_submitted__c==true && cn1.BackendCheck3__c==false) {
                cn1.PPF_Submitted_Date__c=system.today();
                cn1.BackendCheck3__c=true;
            }
            if(cn1.SF_User_Type__c  =='Student' && cn1.SF_Student_Type__c=='Provider') {
                cn1.AccountId = accountMap.get('CCA Provider Account');
            }
            if(cn1.SF_User_Type__c =='Vendor') {
                cn1.AccountId = accountMap.get('CCA Vendor Account');
            }            
        }
    }
    
    public void createScreeningQuestions(List<Contact> contactList, Map<Id, Contact> newContactMap, Map<Id, Contact> oldContactMap) {
        
        List<Screening_Question__c> screenigQuestionsList = new List<Screening_Question__c>();
        List<Screening_Question__c> existingScreenigQuestionsList = new List<Screening_Question__c>();
        List<Id> screeningContactIdList = new List<Id>();
        List<Id> ADContactIdList = new List<Id>();
        List<AD8_Form__c> ADList = new List<AD8_Form__c>();
        List<AD8_Form__c> existingADList = new List<AD8_Form__c>();
        
        for(Contact con :contactList){
            
            if(con.Number_of_yes__c != oldContactMap.get(con.id).Number_of_yes__c){
                
                //screeningContactIdList.add(con.Id);
                Screening_Question__c sc = new Screening_Question__c();
                sc.Provider__c = con.Id;
                sc.Provider_DOB__c = con.Birthdate;
                sc.Total_of_Yes__c = con.Number_of_yes__c;
                sc.Total_of_No__c = con.Number_of_No__c;
                sc.Total_of_Questions__c = 6;
                screenigQuestionsList.add(sc);
            }
            
            if(con.AD_Total_Yes__c != oldContactMap.get(con.id).AD_Total_Yes__c)
            {
                AD8_Form__c ad = new AD8_Form__c();
                ad.Provider__c = con.Id;
                ad.Total_of_Yes__c = con.AD_Total_Yes__c;
                ad.Total_of_No__c = con.AD_Total_No__c;
                ad.Total_of_Not_Applicable__c = con.AD_Total_NAP__c;
                ad.Total_of_Questions__c = 8;
                ADList.add(ad);
            }
        }
        if(screenigQuestionsList.size() > 0){
            insert screenigQuestionsList;
        }
        
        if(ADlist.size() > 0){
            insert ADlist;
        }
        
        existingScreenigQuestionsList = [select Id, Provider__c, Provider_DOB__c From Screening_Question__c Where Provider__c IN :newContactMap.keySet()];
        if(!existingScreenigQuestionsList.isEmpty()){
            
            for(Screening_Question__c sc :existingScreenigQuestionsList) {
                
                if(newContactMap.containsKey(sc.Provider__c) && sc.Provider_DOB__c != newContactMap.get(sc.Provider__c).Birthdate){
                    sc.Provider_DOB__c = newContactMap.get(sc.Provider__c).Birthdate;
                }
                /*for(Contact con :contactList){
                    
                    if(sc.Provider__c == con.Id){
                        if(con.Birthdate != oldContactMap.get(con.id).Birthdate){
                            sc.Provider_DOB__c = con.Birthdate;
                        }  
                    }
                }*/
            }
            update existingScreenigQuestionsList; 
        }
        
        existingADList = [select Id, Provider__c, Consumer_Name__c From AD8_Form__c Where Provider__c IN :newContactMap.keySet()];
        if(!existingADList.isEmpty()){
            
            for(AD8_Form__c ad :existingADList) {
                
                if(newContactMap.containsKey(ad.Provider__c) && ad.Consumer_Name__c != newContactMap.get(ad.Provider__c).ConsumerName__c){
                    ad.Consumer_Name__c = newContactMap.get(ad.Provider__c).ConsumerName__c;
                }
                /*for(Contact cc2:Trigger.new)
                {
                    if(AD.Provider__c == cc2.Id){
                        if(cc2.ConsumerName__c != Trigger.oldmap.get(cc2.id).ConsumerName__c)
                        {
                            system.debug('dsgkjagfjsahfjkhalfkj');
                            AD.Consumer_Name__c=cc2.ConsumerName__c;   
                        }  
                    }
                }*/
            }
            update existingADList;  
        }
    }
}