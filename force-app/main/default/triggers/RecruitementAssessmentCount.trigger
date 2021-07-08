trigger RecruitementAssessmentCount on Recruitment_Assessment_Note__c (after insert,after delete) {

    list<Recruitment_Assessment_Note__c> RC=Trigger.isDelete?Trigger.old:Trigger.new;
    set<ID> pset=new set<ID>();
    set<ID> cset =new set<ID>();
    for(Recruitment_Assessment_Note__c pc:RC)
    {
        pset.add(pc.Provider__c);
        cset.add(pc.Consumer__c);
    }
    
    list<Recruitment_Assessment_Note__c> pclist=[select id,name,Provider__c from Recruitment_Assessment_Note__c where Provider__c IN:pset];
    list<Recruitment_Assessment_Note__c> conslist=[select id,name,Provider__c,Consumer__c from Recruitment_Assessment_Note__c where Consumer__c IN:cset];

    list<Contact> conlist=[select id,Recruitment_Assessment_Check__c,Recruitment_Program__c,Recruiter_Assigned_Date__c,Recruitment_Type__c,Recruiter__c from Contact where ID IN:pset];
    list<Consumer__c> consumlist=[select id,Recruitment_Assessment_Check__c from Consumer__c where ID IN :cset];
    for(Contact cc:conlist)
    {
        for(Recruitment_Assessment_Note__c p:RC)
        {
            if(!Trigger.isDelete)
            {
            cc.Recruitment_Program__c=p.Recruitment_Program__c;
            cc.Recruiter_Assigned_Date__c=p.Recruiter_Assigned_Date__c;
            cc.Recruitment_Type__c=p.Recruitment_Type__c;
            cc.Recruiter__c=p.Recruiter__c;  
            }
           
          if(pclist.size()>0){
            cc.Recruitment_Assessment_Check__c=true;
        }
        else
        {
             cc.Recruitment_Assessment_Check__c=false;
        }  
        }
        
    }
    update conlist;
    
    for(Consumer__c cc1:consumlist)
    {
        if(conslist.size()>0){
            cc1.Recruitment_Assessment_Check__c=true;
        }
        else
        {
             cc1.Recruitment_Assessment_Check__c=false;
        }
    }
    update consumlist;

}