trigger AffiliationCountOnProvider on Provider_Consumer_Affiliation__c (after insert,after update,after delete) {

    list<Provider_Consumer_Affiliation__c> BPCA=Trigger.isDelete?Trigger.old:Trigger.new;
    set<ID> pset=new set<ID>();
    set<ID> cset =new set<ID>();
    for(Provider_Consumer_Affiliation__c pc:BPCA)
    {
        pset.add(pc.Provider__c);
        cset.add(pc.Home_Care_Consumer__c);
    }
    
    list<Provider_Consumer_Affiliation__c> pclist=[select id,name,Provider__c,Affiliation_Status__c from Provider_Consumer_Affiliation__c where Provider__c IN:pset AND Affiliation_Status__c='Current'];
    list<Provider_Consumer_Affiliation__c> conslist=[select id,name,Provider__c,Home_Care_Consumer__c,Affiliation_Status__c from Provider_Consumer_Affiliation__c where Home_Care_Consumer__c IN:cset AND Affiliation_Status__c='Current'];

    list<Contact> conlist=[select id,Single_ConsAffiliate__c,Multi_ConsAffiliate__c,No_Affiliation__c from Contact where ID IN:pset];
    list<Consumer__c> consumlist=[select id,Single_Affiliate__c,Multi_Affiliate__c,No_Affiliate__c from Consumer__c where ID IN :cset];
    for(Contact cc:conlist)
    {
        if(pclist.size()==0){
            cc.No_Affiliation__c=true;
            cc.Single_ConsAffiliate__c=false;
            cc.Multi_ConsAffiliate__c=false;
        }
        if(pclist.size()==1)
        {
            cc.Single_ConsAffiliate__c=true;
            cc.Multi_ConsAffiliate__c=false;
            cc.No_Affiliation__c=false;
        }
        if(pclist.size()>1)
        {
            cc.Multi_ConsAffiliate__c=true;
            cc.Single_ConsAffiliate__c=false;
            cc.No_Affiliation__c=false;
        }
    }
    update conlist;
    
    for(Consumer__c cc1:consumlist)
    {
        if(conslist.size()==0){
            cc1.No_Affiliate__c=true;
            cc1.Single_Affiliate__c=false;
            cc1.Multi_Affiliate__c=false;
        }
        if(conslist.size()==1)
        {
            cc1.Single_Affiliate__c=true;
            cc1.Multi_Affiliate__c=false;
            cc1.No_Affiliate__c=false;
        }
        if(conslist.size()>1)
        {
            cc1.Multi_Affiliate__c=true;
            cc1.Single_Affiliate__c=false;
            cc1.No_Affiliate__c=false;
        }
    }
    update consumlist;
}