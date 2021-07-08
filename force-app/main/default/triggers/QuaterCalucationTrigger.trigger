trigger QuaterCalucationTrigger on SFDC_Class__c (before insert , before update,after insert, after update) {
    
    if((trigger.isInsert || trigger.isUpdate) && (trigger.isBefore )){
        
        QuaterCalculationHandler.getdata(Trigger.new,trigger.oldmap);
        
    }
    
    if((trigger.isInsert && trigger.isAfter)){
        
        QuaterCalculationHandler.getafterdata(Trigger.new);
        //QuaterCalculationHandler.getafterupdatedata(trigger.new,trigger.oldmap);
        //QuaterCalculationHandler.getafterupdatedata1(trigger.new,trigger.oldmap,trigger.newmap);
        
    }
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            QuaterCalculationHandler.getafterupdatedata(trigger.new,trigger.oldmap);
            QuaterCalculationHandler.getafterupdatedata1(trigger.new,trigger.oldmap,trigger.newmap);
        }
    }
    /* if((trigger.Isupdate) && trigger.isAfter ){
        QuaterCalculationHandler.getafterupdatedata(trigger.new,trigger.oldmap);
        }*/
}