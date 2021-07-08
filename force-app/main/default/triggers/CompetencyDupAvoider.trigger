trigger CompetencyDupAvoider on Competency_Check__c (after insert) {

    set<ID> ENID=new set<ID>();
    for(Competency_Check__c cc:Trigger.new)
    {
        ENID.add(cc.Enrollment__c);
    }
    list<SFDC_Enrollment__c> enrolllist=[select id,Competency_Check_created__c from SFDC_Enrollment__c where ID IN :ENID];
    for(SFDC_Enrollment__c sen:enrolllist)
    {
        sen.Competency_Check_created__c=true;
    }
    update enrolllist;
}