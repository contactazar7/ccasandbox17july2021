trigger ProviderTrigger on Contact (before insert, before update, after update) {
    
    list<Screening_Question__c> sclist=new list<Screening_Question__c>();
    list<AD8_Form__c> ADlist=new list<AD8_Form__c>();
    
    ProviderTriggerHandler handler = new ProviderTriggerHandler();
    if(trigger.isBefore && trigger.isInsert && TriggerRecursiveCheck.isProviderBeforeInsertRunning) {
        TriggerRecursiveCheck.isProviderBeforeInsertRunning = false;
        handler.handleBeforeInsert(Trigger.new);
    }
    
    if(trigger.isBefore && trigger.isUpdate && TriggerRecursiveCheck.isProviderBeforeUpdateRunning) {
        TriggerRecursiveCheck.isProviderBeforeUpdateRunning = false;
        handler.handleBeforeInsert(Trigger.new);
    } 
    
    if(Trigger.isAfter && Trigger.isUpdate){
        handler.handleAfterUpdate(Trigger.new, Trigger.newMap, Trigger.oldMap);
    }
    
    /*if(trigger.isAfter)
    {
        list<Screening_Question__c> sclist1=new list<Screening_Question__c>();
        list<AD8_Form__c> ADlist1=new list<AD8_Form__c>();
          
        System.debug('Here-----123');
        System.debug('Contact List Size--123'+Trigger.New.size());      
        
        for(Contact cc:Trigger.new)
        {
            system.debug(cc.Number_of_yes__c);
            system.debug(Trigger.oldmap.get(cc.id).Number_of_yes__c);
            if(cc.Number_of_yes__c != Trigger.oldmap.get(cc.id).Number_of_yes__c)
            {
                Screening_Question__c sc= new Screening_Question__c();
                sc.Provider__c=cc.id;
                sc.Provider_DOB__c=cc.Birthdate;
                sc.Total_of_Yes__c=cc.Number_of_yes__c;
                sc.Total_of_No__c=cc.Number_of_No__c;
                sc.Total_of_Questions__c=6;
                sclist.add(sc);
            }
            
        }
        if(sclist.size()>0)
        {
            system.debug('inserted');
            insert sclist;
        }
        
        sclist1=[select id,name,Provider__c,Provider_DOB__c from Screening_Question__c where Provider__c IN : Trigger.new];
        if(!sclist1.isEmpty()){
            for(Screening_Question__c sc1:sclist1)
            {
                for(Contact c1:Trigger.new)
                    if(sc1.Provider__c == c1.Id){
                        if(c1.Birthdate != Trigger.oldmap.get(c1.id).Birthdate)
                        {
                            system.debug('dsgkjagfjsahfjkhalfkj');
                            sc1.Provider_DOB__c=c1.Birthdate;   
                            
                        }  
                    }
            }
            update sclist1; 
        }
       
        for(Contact cc1:Trigger.new)
        {
            system.debug(cc1.AD_Total_Yes__c);
            system.debug(Trigger.oldmap.get(cc1.id).AD_Total_Yes__c);
            if(cc1.AD_Total_Yes__c != Trigger.oldmap.get(cc1.id).AD_Total_Yes__c)
            {
                AD8_Form__c ad= new AD8_Form__c();
                ad.Provider__c=cc1.id;
                ad.Total_of_Yes__c=cc1.AD_Total_Yes__c;
                ad.Total_of_No__c=cc1.AD_Total_No__c;
                ad.Total_of_Not_Applicable__c=cc1.AD_Total_NAP__c;
                ad.Total_of_Questions__c=8;
                ADlist.add(ad);
                system.debug('dsgkjagfjsahfjkhalfkj');
            }
            
        }
        if(ADlist.size()>0)
        {
            insert ADlist;
        }
        
        ADlist1 = [select id,name,Provider__c from AD8_Form__c where Provider__c IN : Trigger.new];
        if(!ADlist1.isEmpty()){
            for(AD8_Form__c AD:ADlist1)
            {
                for(Contact cc2:Trigger.new)
                {
                    if(AD.Provider__c == cc2.Id){
                        if(cc2.ConsumerName__c != Trigger.oldmap.get(cc2.id).ConsumerName__c)
                        {
                            system.debug('dsgkjagfjsahfjkhalfkj');
                            AD.Consumer_Name__c=cc2.ConsumerName__c;   
                        }  
                    }
                    
                }
            }
            update ADlist1;  
        }
    }*/
    
}