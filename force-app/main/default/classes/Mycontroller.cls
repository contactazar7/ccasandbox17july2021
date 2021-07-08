public class Mycontroller {

    
    @AuraEnabled   
    public static list<object> getContactInfo(Id recordId)
    {
        map<string,object> mapObjects =new map<string,object>();
      //  map<string,string> mapIds =new map<string,string>();
        list<object> lstobj=new list<object>();
          system.debug(String.valueOf(recordId.getSobjectType()));
        String objectName = String.valueOf(recordId.getSobjectType());
        system.debug(''+objectName);
        
        if(objectName=='Consumer__c')
        {
            Consumer__c acc=[select id,Name,Provider__c,Recruiter__c from Consumer__c where id =: recordId];
          
            //mapIds.put(acc.id,acc.id);
            lstobj.add(acc);
           // system.debug(mapIds);
        }
        else
        {
            Contact con=[select id,lastname,AccountId,Recruitment_Program__c,Recruiter_Assigned_Date__c,Recruitment_Type__c,Recruiter__c from Contact where id =: recordId]; 
           // mapIds.put(con.id,con.id);
           lstobj.add(con);
         //   system.debug(mapIds);
        }
        
      //  mapObjects.put('ObjectName',objectName);
      //  mapObjects.put('Ids',mapIds);
        return lstobj;
    }
  
}