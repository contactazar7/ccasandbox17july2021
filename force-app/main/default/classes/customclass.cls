public class customclass {
    
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName,String picklistva, String monstarttime,String tuestarttime,String wedstarttime,String thurstarttime,String fristarttime,String satstarttime,String sunstarttime,String startdate,String enddate ) {
      system.debug('mon'+picklistva);
              system.debug('mon'+monstarttime);
      system.debug('mon'+tuestarttime);
      system.debug('mon'+enddate);
        system.debug('mon'+startdate);

              system.debug('mon'+thurstarttime);

          String mondaysearchKey =  '%' + monstarttime + '%';
			  String tuesdaysearchKey =  '%' + tuestarttime + '%';
			  String wednesdaydaysearchKey =  '%' + wedstarttime + '%';
			  String thursdaysearchKey =  '%' + thurstarttime + '%';
			  String fridaysearchKey =  '%' + fristarttime + '%';
			  String saturdaysearchKey =  '%' + satstarttime + '%';
			  String sundaysearchKey =  '%' + sunstarttime + '%';
        
  Date startdatess;
      Date enddatess;
        if(startdate!=null && startdate!=''){
        startdatess=Date.valueOf(startdate);
        }if(enddate!=null && enddate!=''){
                 enddatess = Date.valueOf(enddate);
        }

        //String val = starttime; 
        //Time date1 = (Time)Json.deserialize('"'+val+'"', Time.class);
        //System.debug(date1);// 2018-12-29 10:00:0
        String searchKey = searchKeyWord + '%';
        String searchKey1 = picklistva + '%';
        System.debug(searchKey1);
        string wipid = '%picklistva%';
        /*if(monstarttime!=null && monstrtimeChange!=''){
String startTime1 = monstarttime;
Integer hour = Integer.valueOf(startTime1.left(2));
Integer minute = Integer.valueOf(startTime1.substringBetween(':',':')); 

DateTime myDT = DateTime.newInstance(Date.today(), Time.newInstance(hour, minute, 0, 0)); 
String myDate = myDT.format('h:mm a');
}
if(endtime!=null && endtime!=''){

String startTime2 = endtime;
Integer hour1 = Integer.valueOf(startTime2.left(2));
Integer minute1 = Integer.valueOf(startTime2.substringBetween(':',':')); 

DateTime myDT1 = DateTime.newInstance(Date.today(), Time.newInstance(hour1, minute1, 0, 0)); 
String myDate1 = myDT1.format('h:mm a');
system.debug('mytime-->' + myDate1);
}*/
        List < Instructor__c > returnList = new List < Instructor__c > ();
        List < Instructor__c > Lst4 = new List < Instructor__c > ();
        List<SFDC_Class__c> lst1 = new List<SFDC_Class__c>();
              if(picklistva.contains('Monday')){
            
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (((Monday_Values__c LIKE:  mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) )];
              system.debug('ss'+startdate);
            system.debug('ss'+lst1);
        }
        if(picklistva.contains('Tuesday')){
            system.debug('executed');
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (Tuesday_Values__c LIKE: tuesdaysearchKey)   and   (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing') 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
           
            
            
        }
        if(picklistva.contains('Wednesday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (Wednesday_Values__c LIKE: wednesdaydaysearchKey) and  (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing')
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (Thursday_Values__c LIKE: thursdaysearchKey)  and  (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing')
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (Friday_Values__c LIKE: fridaysearchKey) and  (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing')
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (Saturday_Values__c LIKE: saturdaysearchKey) and  (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing')
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Sundayday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Sunday_Values__c LIKE: sundaysearchKey)) and  (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing')
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst4);
            
        }
        
        if(picklistva.contains('Monday;Tuesday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey)
                   and (Start_Date__c <=: startdatess and End_Date__c >=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Wednesday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey)  and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Wednesday_Values__c LIKE: wednesdaydaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Thursday_Values__c LIKE: thursdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    (((Monday_Values__c LIKE: mondaysearchKey)) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Saturday_Values__c LIKE: saturdaysearchKey)
                   and(Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Wednesday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey ) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess)];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Thursday_Values__c LIKE: thursdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey ) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Friday_Values__c LIKE: fridaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey )
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Saturday_Values__c LIKE: saturdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey )
                   and(Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Saturday;Sunday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Saturday_Values__c LIKE: saturdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and    (Sunday_Values__c LIKE: sundaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Wednesday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and  (Thursday_Values__c LIKE: thursdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Wednesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and            (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Wednesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and            (Saturday_Values__c LIKE: saturdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Friday_Values__c LIKE: fridaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey ) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Saturday_Values__c LIKE: saturdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey ) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Saturday_Values__c LIKE: saturdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and            (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        
        if(picklistva.contains('Monday;Tuesday;Wednesday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Tuesday_Values__c LIKE: tuesdaysearchKey ) 
                    and (Wednesday_Values__c LIKE: wednesdaydaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Wednesday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and (Thursday_Values__c LIKE: thursdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and     (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and  (Tuesday_Values__c LIKE: tuesdaysearchKey )
                    and (Thursday_Values__c LIKE: thursdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and  (Tuesday_Values__c LIKE: tuesdaysearchKey )
                    and     (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and  (Tuesday_Values__c LIKE: tuesdaysearchKey ) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Wednesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Friday_Values__c LIKE: fridaysearchKey) 
                    and     (Wednesday_Values__c LIKE: wednesdaydaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Wednesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and     (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Monday_Values__c LIKE: mondaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and (Thursday_Values__c LIKE: thursdaysearchKey) 
                   and(Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        
        if(picklistva.contains('Tuesday;Wednesday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and     (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and      (Saturday_Values__c LIKE: saturdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Wednesday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Wednesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Thursday_Values__c LIKE: thursdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    
                    and (Friday_Values__c LIKE: fridaysearchKey) 
                    and  (Saturday_Values__c LIKE: saturdaysearchKey)
                  and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        
        
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Wednesday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and     (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Wednesday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and     (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Wednesday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Friday_Values__c LIKE: fridaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Wednesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Saturday_Values__c LIKE: saturdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and    (Friday_Values__c LIKE: fridaysearchKey) 
                    and     (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and         (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and     (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess)];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Friday_Values__c LIKE: fridaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and         (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and     (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and  (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey)
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Saturday_Values__c LIKE: saturdaysearchKey)
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and  (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and  (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Wednesday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Thursday_Values__c LIKE: thursdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey)
                    and  (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess)];
            
            system.debug('ss'+lst1);
            
        }
        
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                    and   (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }           
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                    and   (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }       
        
        if(picklistva.contains('Monday;Wednesday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Saturday_Values__c LIKE: saturdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                    and   (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                    and   (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }           
        if(picklistva.contains('Monday;Tuesday;Wednesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Saturday_Values__c LIKE: saturdaysearchKey)
                    and (Monday_Values__c LIKE: mondaysearchKey) 
                    and   (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }   
        if(picklistva.contains('Tuesday;Wednesday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey)
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                    and   (Friday_Values__c LIKE: fridaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Wednesday_Values__c LIKE: wednesdaydaysearchKey) 
                    and   (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Monday_Values__c LIKE: mondaysearchKey)
                    and   (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey)
                  and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }   
        
        if(picklistva.contains('Wednesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and   (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        } 
        if(picklistva.contains('Tuesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        } 
        if(picklistva.contains('Tuesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        } 
        if(picklistva.contains('Wednesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }   
        if(picklistva.contains('Monday;Wednesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Monday_Values__c LIKE: mondaysearchKey)
                    and (Friday_Values__c LIKE: fridaysearchKey)
                    and (Saturday_Values__c LIKE: saturdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }           
        if(picklistva.contains('Tuesday;Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        } 
        if(picklistva.contains('Tuesday;Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Thursday_Values__c LIKE: thursdaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey)
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        } 
        if(picklistva.contains('Tuesday;Friday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Tuesday_Values__c LIKE: tuesdaysearchKey ) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Friday_Values__c LIKE: fridaysearchKey) 
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        } 
        if(picklistva.contains('Thursday;Friday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Thursday_Values__c LIKE: thursdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Friday_Values__c LIKE: fridaysearchKey) 
                   and (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        if(picklistva.contains('Thursday;Saturday')){
            lst1 = [select id, Name,Instructor_ID__c,Instructor_ID_2__c from  SFDC_Class__c   where 
                    ((Thursday_Values__c LIKE: thursdaysearchKey) and (Class_Status__c='Upcoming' or Class_Status__c= 'Ongoing'))
                    and (Saturday_Values__c LIKE: saturdaysearchKey) 
                   and  (Start_Date__c >=: startdatess and End_Date__c <=:enddatess) ];
            
            system.debug('ss'+lst1);
            
        }
        system.debug('ClassRecord'+lst1);
        set<Id> ins = new set<Id>();
        system.debug('ClassRecord'+ins);
        
        if(!lst1.isEmpty()){
            for(SFDC_Class__c c:lst1){
                
                ins.add(c.Instructor_ID__c);
                     ins.add(c.Instructor_ID_2__c);
            }
        }
        /*List<SFDC_Class__c> lst1 = [select id, Name from  SFDC_Class__c     where id!=null
and ((Monday_Start_Time__c =:monstrtimeChange and   Monday_End_Time__c <=: monstrtimeChange))
and  ((Tuesday_Start_Time__c=:monstrtimeChange and   Tuesday_End_Time__c <=:monstrtimeChange))
and ((Wednesday_Start_Time__c=:monstrtimeChange and   Wednesday_End_Time__c <=: monstrtimeChange) )
and ((Thursday_Start_Time__c=:monstrtimeChange and   Thursday_End_Time__c <=: monstrtimeChange) )
and ((Friday_Start_Time__c=:monstrtimeChange and   Friday_End_Time__c<=:monstrtimeChange) )
and ((Saturday_Start_Time__c=:monstrtimeChange and   Saturday_End_Time__c<=:monstrtimeChange)  )];*/
        /*List<SFDC_Class__c> lst1 = new List<SFDC_Class__c>();
system.debug('mytime-->' + lst1);

set<Id> ins = new set<Id>();
if(lst1.size()>0){
for(SFDC_Class__c c:lst1){

ins.add(c.Facility__c);
}
}
system.debug('ss'+ins);

if(lst1.isEmpty()){
lst4 = [select id, Name from  Instructor__c   where id != : ins and  ((Monday_Start_Time__c =:monstrtimeChange and   Monday_End_Time__c <=: monstrtimeChange) or (Available_Monday__c =true ))
and  ((Tuesday_Start_Time__c=:monstrtimeChange and   Tuesday_End_Time__c <=:monstrtimeChange) or (Available_Tuesday__c =true ))
and ((Wednesday_Start_Time__c=:monstrtimeChange and   Wednesday_End_Time__c <=: monstrtimeChange) or (Available_Wednesday__c = true ))
and ((Thursday_Start_Time__c=:monstrtimeChange and   Thursday_End_Time__c <=: monstrtimeChange) or (Available_Thursday__c   = true ))
and ((Friday_Start_Time__c=:monstrtimeChange and   Friday_End_Time__c<=:monstrtimeChange) or (Available_Friday__c   = true ))
and ((Saturday_Start_Time__c=:monstrtimeChange and   Saturday_End_Time__c<=:monstrtimeChange) or (Available_Saturday__c = true ) )];

system.debug('ss'+lst4);
}*/
        
     

			
			


if(picklistva.contains('Monday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true and id!= :ins)];
                 system.debug('ss'+lst4);
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c,Monday_Text_Values__c from  Instructor__c   where 
                        Monday_Text_Values__c LIKE: mondaysearchKey and Available_Monday__c= true ];
                system.debug('ss'+mondaysearchKey);
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Tuesday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c=true and id!= :ins)];
            }else{
                system.debug('executed');
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Tuesday_Values__c LIKE: tuesdaysearchKey) and Available_Tuesday__c=true ];
                
              
            }
            
        }
        if(picklistva.contains('Wednesday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and id!= :ins)];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                       (Wednesday_Values__c LIKE: wednesdaydaysearchKey) and Available_Wednesday__c= true];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and id!= :ins)];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Thursday_Values__c LIKE: thursdaysearchKey) and Available_Thursday__c= true];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true  and id!= :ins)];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Friday_Values__c LIKE: fridaysearchKey) and Available_Friday__c= true];
                
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                       (Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and  id!= :ins)];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Saturday_Values__c LIKE: saturdaysearchKey) and Available_Saturday__c= true];
                
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Sunday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Sunday_Values__c LIKE: sundaysearchKey) and (Available_On_Sunday__c= true and  id!= :ins)];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        (Sunday_Values__c LIKE: sundaysearchKey) and Available_On_Sunday__c= true];
                
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Saturday;Sunday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Active__c= true and Available_Saturday__c=true))
                        and     ((Sunday_Values__c LIKE: sundaysearchKey) and (Available_On_Sunday__c= true))
                        and  id!= :ins];
            }else{
                
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Active__c= true and Available_Saturday__c=true))
                        and     ((Sunday_Values__c LIKE: sundaysearchKey) and (Available_On_Sunday__c= true))];
                
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Monday;Tuesday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
            }else{
                
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Monday;Wednesday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))];
                
                system.debug('ss'+lst4);
            }
            
        }
        if(picklistva.contains('Monday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true  and Available_Monday__c=true))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and  id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true  and Available_Monday__c=true))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))];
                
                system.debug('ss'+lst4);
                
            }
        }
        if(picklistva.contains('Monday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Saturday')){
            if(ins.size()>0){
                
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and  id!= :ins];
                
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Wednesday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true  and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true  and Active__c= true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Wednesday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and              ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and              ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Wednesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and            ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and            ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Wednesday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and            ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true  ))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and            ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true  ))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true ))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true ))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and  Active__c= true ))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and  Active__c= true ))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and  Active__c= true ))
                        and            ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and  Active__c= true ))
                        and            ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))];
                
                system.debug('ss'+lst4);
            } 
        }
        
        if(picklistva.contains('Monday;Tuesday;Wednesday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Wednesday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c= true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c=true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c= true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c=true))];
                
                system.debug('ss'+lst4);
            } 
        }
        if(picklistva.contains('Monday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c= true))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c= true))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and  ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c=true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and  ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c=true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and  ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and  ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and  ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and  id!= :ins];
                
            }
            lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                    ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                    and  ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true))
                    and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
            
            system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Monday;Wednesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))];
                
                system.debug('ss'+lst4);
            } 
        }
        if(picklistva.contains('Monday;Wednesday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and     ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c=true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Active__c= true and Available_Monday__c=true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c=true))];
                
                system.debug('ss'+lst4);
            }
        }
        
        if(picklistva.contains('Tuesday;Wednesday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and  id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))];
                
            }  system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
            } system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Tuesday;Wednesday;Saturday')){
            if(ins.size()>0){
                
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and      ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and      ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Wednesday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
            } system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Wednesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and  Active__c= true))
                        
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and  ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and  Active__c= true))
                        
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and  ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        
        
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Wednesday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and     ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Wednesday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and     ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and     ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
            }  system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Monday;Wednesday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Wednesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and    ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and    ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and         ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and         ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true ))
                        and         ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true and Active__c= true ))
                        and         ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and     ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Wednesday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Wednesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))];
                
                system.debug('ss'+lst4);
            } 
        }
        if(picklistva.contains('Tuesday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Tuesday;Wednesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))];
                
            } system.debug('ss'+lst4);
            
        }
        if(picklistva.contains('Wednesday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true ))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and  ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true ))];
                
                system.debug('ss'+lst4);
            } 
        }
        
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }  
        }           
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
            }  system.debug('ss'+lst4);
            
        }       
        
        if(picklistva.contains('Monday;Wednesday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and Active__c=true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true and Active__c=true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }           
        if(picklistva.contains('Monday;Tuesday;Wednesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }   
        if(picklistva.contains('Tuesday;Wednesday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Monday;Tuesday;Wednesday;Thursday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and   ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true))
                        and   ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }   
        
        if(picklistva.contains('Wednesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and   ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
            } system.debug('ss'+lst4);
            
        } 
        if(picklistva.contains('Tuesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        } 
        if(picklistva.contains('Tuesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        } 
        if(picklistva.contains('Wednesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
            }  system.debug('ss'+lst4);
            
        }   
        if(picklistva.contains('Monday;Wednesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Wednesday_Values__c LIKE: wednesdaydaysearchKey) and (Available_Wednesday__c= true and Active__c= true))
                        and ((Monday_Text_Values__c LIKE: mondaysearchKey) and (Available_Monday__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }           
        if(picklistva.contains('Tuesday;Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            } 
        } 
        if(picklistva.contains('Tuesday;Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
                
            }else{
                
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true ))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            }
        } 
        if(picklistva.contains('Tuesday;Friday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Tuesday_Values__c LIKE: tuesdaysearchKey) and (Available_Tuesday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
                system.debug('ss'+lst4);
            } 
        } 
        if(picklistva.contains('Thursday;Friday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))
                        and id!= :ins];
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and ((Friday_Values__c LIKE: fridaysearchKey) and (Available_Friday__c= true))];
                
                system.debug('ss'+lst4);
            }
        }
        if(picklistva.contains('Thursday;Saturday')){
            if(ins.size()>0){
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))
                        and  id!= :ins];
                
            }else{
                lst4 = [select id, Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from  Instructor__c   where 
                        ((Thursday_Values__c LIKE: thursdaysearchKey) and (Available_Thursday__c= true and Active__c= true))
                        and ((Saturday_Values__c LIKE: saturdaysearchKey) and (Available_Saturday__c= true))];
                
            }
			}
        List<Instructor__c> lst = new list<Instructor__c>();
        
        //  List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (Instructor__c obj: lst4) {
           lst.add(obj);
        }
        system.debug('ss'+lst);
        
        return lst;
    }
    @AuraEnabled
    public static String createAccount(String con,String con1,String con2,String con3){ 
        String startTime1 = con2;
        Integer hour = Integer.valueOf(startTime1.left(2));
        Integer minute = Integer.valueOf(startTime1.substringBetween(':',':')); 
        
        DateTime myDT = DateTime.newInstance(Date.today(), Time.newInstance(hour, minute, 0, 0)); 
        String myDate = myDT.format('h:mm a');
        
        String startTime2 = con3;
        Integer hour2 = Integer.valueOf(startTime2.left(2));
        Integer minute2 = Integer.valueOf(startTime2.substringBetween(':',':')); 
        
        DateTime myDT2 = DateTime.newInstance(Date.today(), Time.newInstance(hour2, minute2, 0, 0)); 
        String myDate2 = myDT2.format('h:mm a');
        SFDC_Class__c cls = new SFDC_Class__c();
        cls.Name=con;
        cls.Facility__c=con;
        cls.Days__c=con1;
        cls.End_Time__c= Time.newInstance(hour2, minute2, 0, 0);
        cls.Start_Time__c= Time.newInstance(hour, minute, 0, 0);
        insert cls;
        
        return cls.id;
    }
    @AuraEnabled
    public static List < Instructor__c > fetchValues(String searchKeyWord) {
        String searchKey = searchKeyWord + '%';
        //System.debug('searchKey--'+searchKey);
        //List < Instructor__c > returnList = new List < Instructor__c > ();
        List < Instructor__c > lstOfContact = [select id,Names__c, Name,First_Name__c,Last_Name__c from Instructor__c
                                               where Names__c LIKE: searchKey ];
        
        /*for (Instructor__c acc: lstOfContact) {
            returnList.add(acc);
        }*/
        return lstOfContact;
    }
    public static String fetchLookUpValues22(String Recordid, String monstarttime,String tuestarttime,String wedstarttime,String thurstarttime,String fristarttime,String satstarttime, String monendtime,String tueendtime,String wedendtime,String thuendtime,String friendtime,String satendtime){ 
        time monstrtimeChange;
        Time monendtimeChange1;
        if(monstarttime!=null && monstarttime!=''){
            String[] strTimeSplit = monstarttime.split(':');
            monstrtimeChange = Time.newInstance( Integer.valueOf(strTimeSplit[0]) //hour
                                                ,Integer.valueOf(strTimeSplit[1]) //min
                                                ,0                                //sec
                                                ,0); 
            String[] strTimeSplit1 = monendtime.split(':');
            monendtimeChange1 = Time.newInstance( Integer.valueOf(strTimeSplit1[0]) //hour
                                                 ,Integer.valueOf(strTimeSplit1[1]) //min
                                                 ,0                                //sec
                                                 ,0); 
        }
        Time timeChangetus;
        Time timeChangewede;
        Time timeChangetuee;
        Time timeChangeweds;
        if(tuestarttime!=null && tuestarttime!=''){
            String[] strTimeSplittues = tuestarttime.split(':');
            timeChangetus = Time.newInstance( Integer.valueOf(strTimeSplittues[0]) //hour
                                             ,Integer.valueOf(strTimeSplittues[1]) //min
                                             ,0                                //sec
                                             ,0); 
            String[] strTimeSplittuese = tueendtime.split(':');
            timeChangetuee = Time.newInstance( Integer.valueOf(strTimeSplittuese[0]) //hour
                                              ,Integer.valueOf(strTimeSplittuese[1]) //min
                                              ,0                                //sec
                                              ,0); 
            
        }
        if(wedstarttime!=null && wedstarttime!=''){
            
            String[] strTimeSplitweds = wedstarttime.split(':');
            timeChangeweds = Time.newInstance( Integer.valueOf(strTimeSplitweds[0]) //hour
                                              ,Integer.valueOf(strTimeSplitweds[1]) //min
                                              ,0                                //sec
                                              ,0); 
            String[] strTimeSplitwede = wedendtime.split(':');
            timeChangewede = Time.newInstance( Integer.valueOf(strTimeSplitwede[0]) //hour
                                              ,Integer.valueOf(strTimeSplitwede[1]) //min
                                              ,0                                //sec
                                              ,0); 
            
        }  
        Time timeChangethus;
        Time timeChangethue;
        if(thurstarttime!=null && thurstarttime!=''){
            
            String[] strTimeSplitthurs = thurstarttime.split(':');
            timeChangethus = Time.newInstance( Integer.valueOf(strTimeSplitthurs[0]) //hour
                                              ,Integer.valueOf(strTimeSplitthurs[1]) //min
                                              ,0                                //sec
                                              ,0); 
            String[] strTimeSplitthure = thuendtime.split(':');
            timeChangethue = Time.newInstance( Integer.valueOf(strTimeSplitthure[0]) //hour
                                              ,Integer.valueOf(strTimeSplitthure[1]) //min
                                              ,0                                //sec
                                              ,0); 
            
        }  
        Time timeChangefris;
        Time timeChangefrie;
        if(fristarttime!=null && fristarttime!=''){
            
            String[] strTimeSplitfris = fristarttime.split(':');
            timeChangefris = Time.newInstance( Integer.valueOf(strTimeSplitfris[0]) //hour
                                              ,Integer.valueOf(strTimeSplitfris[1]) //min
                                              ,0                                //sec
                                              ,0); 
            String[] strTimeSplitfrie = friendtime.split(':');
            timeChangefrie = Time.newInstance( Integer.valueOf(strTimeSplitfrie[0]) //hour
                                              ,Integer.valueOf(strTimeSplitfrie[1]) //min
                                              ,0                                //sec
                                              ,0); 
            
        }
        Time timeChangesats;
        Time timeChangesate;
        if(satstarttime!=null && satstarttime!=''){
            
            String[] strTimeSplitsats = satstarttime.split(':');
            timeChangesats = Time.newInstance( Integer.valueOf(strTimeSplitsats[0]) //hour
                                              ,Integer.valueOf(strTimeSplitsats[1]) //min
                                              ,0                                //sec
                                              ,0); 
            String[] strTimeSplitsate = satendtime.split(':');
            timeChangesate = Time.newInstance( Integer.valueOf(strTimeSplitsate[0]) //hour
                                              ,Integer.valueOf(strTimeSplitsate[1]) //min
                                              ,0                                //sec
                                              ,0); 
            
        }
        SFDC_Class__c sd = new SFDC_Class__c();
        sd.id = Recordid;
        /*sd.Monday_End_Time__c=String.valueOf(monendtimeChange1);*/
        update sd;
        return sd.id;
        
    }
    
    
    @AuraEnabled
    public static List<RecordType> getListOfRecordType(){
        String query = 'SELECT Id,Name FROM RecordType WHERE SobjectType =\''+'SFDC_Class__c'+'\' ';
        List<RecordType> rtNames = new List<RecordType>();
        Schema.SObjectType  objType = SFDC_Class__c.SObjectType;     
        for(RecordTypeInfo rt : objType.getDescribe().getRecordTypeInfos()){
            if(rt.getName() != 'Master'){
                System.debug('rt.getName()'+rt.getName());
                rtNames.add(new RecordType(Id = rt.getRecordTypeId(),Name = rt.getName()));
            }
            System.debug('rtNames'+rtNames);
        } 
        return rtNames; 
    }
    
    @AuraEnabled
    public static List < SFDC_Class__c > fetchinstructors(String searchKeyWord) {
       // system.debug('cou'+searchKeyWord);
        
        List < SFDC_Class__c > returnList = new List < SFDC_Class__c > ();
        List < SFDC_Class__c > lstOfAccount = [select id, Name,Instructor_ID__r.Name,Instructor_ID_2__r.Name,Class_Status__c from SFDC_Class__c
                                               where ((Instructor_ID__r.Name =: searchKeyWord or Instructor_ID_2__r.Name =: searchKeyWord) and (Class_Status__c='Upcoming' or Class_Status__c='Ongoing')) ];
       // system.debug('cou'+lstOfAccount);
        
        for (SFDC_Class__c acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    }
    @AuraEnabled
    public static List < SFDC_Class__c > fetchinstructors2(String searchKeyWord) {
      //  system.debug('cou'+searchKeyWord);
        
        List < SFDC_Class__c > returnList = new List < SFDC_Class__c > ();
        List < SFDC_Class__c > lstOfAccount = [select id, Name,Instructor_ID_2__r.Name,Class_Status__c from SFDC_Class__c
                                               where Instructor_ID_2__r.Name =: searchKeyWord and (Class_Status__c='Upcoming' or Class_Status__c='Ongoing') ];
        //system.debug('cou'+lstOfAccount);
        
        for (SFDC_Class__c acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    }
    @AuraEnabled
    public static List < Instructor__c > searchtwoinstr(String searchKeyWord) {
        String searchKey = searchKeyWord + '%';
        
        List < Instructor__c > returnList = new List < Instructor__c > ();
        List < Instructor__c > lstOfAccount = [select id,Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from Instructor__c where Name LIKE: searchKeyWord ];
        system.debug('cou'+lstOfAccount);
        
        for (Instructor__c acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    }
    /* @AuraEnabled
public static List < Instructor__c > fetchinstructors2(String searchKeyWord) {
system.debug('cou'+searchKeyWord);

List < Instructor__c > returnList = new List < Instructor__c > ();
List < Instructor__c > lstOfAccount = [select id,Name,Type_of_Instructor__c,First_Name__c,Last_Name__c from Instructor__c where Name =:searchKeyWord ];
system.debug('cou'+lstOfAccount);

for (Instructor__c acc: lstOfAccount) {
returnList.add(acc);
}
return returnList;
}*/
    
    @AuraEnabled
    public static List < SFDC_Class__c > editrecords(String id) {
        return[select id,Class_Course__c,End_Date__c,Start_Date__c,Monday_Timings_For_Testing__c,Same_time_for_all_days__c,Tuesday_Timings__c,Wednesday_Timings__c,Thursday_Timings__c,Friday_Timings__c,Saturday_Timings__c,Sunday_timings__c,Class_Timings__c,Class_Course__r.Name,Count_of_Roster__c,Class_Days__c,Instructor_ID__r.Name,Instructor_ID_2__r.Name,Instructor_Id_2_Type__c,Class_type__c,Name,Monday_Start_Time__c,Monday_End_Time2__c,Monday_End_Time__c,Monday_Start_Time1__c,RecordTypeId,Sunday_End_Time__c,End_Time__c,Start_Time__c,Sunday_Start_Time__c,Saturday_Start_Time1__c,Saturday_End_Time2__c,Friday_Start_Time1__c,Friday_End_Time2__c,Thursday_Start_Time1__c,Thursday_End_Time2__c,Wednesday_Start_Time1__c,Wednesday_End_Time2__c,Tuesday_Start_Time1__c,Tuesday_End_Time2__c,Tuesday_Start_Time__c,Tuesday_End_Time__c,Wednesday_Start_Time__c,Wednesday_End_Time__c,Thursday_Start_Time__c,Thursday_End_Time__c,Friday_Start_Time__c,Friday_End_Time__c,Saturday_Start_Time__c,Saturday_End_Time__c,Sunday_Start_Time1__c,Sunday_End_Time1__c from SFDC_Class__c where Id =: id ]; 
    }
    @AuraEnabled
    public static List < CCA_Course__c > fetchclasscourse(String searchKeyWord, String category, String recordtype) {
        
        String searchKey = searchKeyWord + '%';
        List < CCA_Course__c > lstOfRecords = new  List < CCA_Course__c >();
        List < CCA_Course__c > returnList = new List < CCA_Course__c > ();
        if(recordtype =='0120v000000oxOxAAI' && (searchKeyWord == '' || searchKeyWord == null)){
            
            lstOfRecords =[ select id, Name,Is_it_an_Active_Course__c,Course_Name__c,Course_Category__c from CCA_Course__c where (Is_it_an_Active_Course__c ='Yes' and Course_Category__c ='Education Fund')    order by LastViewedDate DESC limit 5];
            system.debug('ss'+lstOfRecords);
        }
        if(recordtype =='0120v000000oxOyAAI' && (searchKeyWord == '' || searchKeyWord == null)){
            lstOfRecords =[ select id, Name,Is_it_an_Active_Course__c,Course_Name__c,Course_Category__c from CCA_Course__c where Is_it_an_Active_Course__c ='Yes' and (Course_Category__c ='IHSS / Cuidado en Casa / 居家看護' or Course_Category__c = 'Basic Skills Courses / Conocimientos Basicos / 学习英语或数学' or Course_Category__c='Career Courses / Para Carrera / 找工作'  or Course_Category__c='Personal Development / Desarrollo Personal / 个人发展' or  Course_Category__c='Second Quiz')  order by LastViewedDate DESC limit 5];
            system.debug('ss2'+lstOfRecords);
            
        }
        if(searchKeyWord != null && searchKeyWord !=''){
            lstOfRecords =[ select id, Name,Is_it_an_Active_Course__c,Course_Name__c,Course_Category__c,Course_Cost__c,Description__c,Is_it_a_Recruitment_Course__c,Is_it_a_Training_Fund_Course__c from CCA_Course__c where Is_it_an_Active_Course__c ='Yes' and Course_Name__c LIKE: searchKey  order by LastViewedDate DESC limit 5];
            system.debug('ss3'+lstOfRecords);
        }
        
        for (CCA_Course__c obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
            @AuraEnabled
    public static List < CCA_Course__c > fetchclasscoursepopup(String searchKeyWord) {
        
        String searchKey = searchKeyWord + '%';
        List < CCA_Course__c > lstOfRecords = new  List < CCA_Course__c >();
        List < CCA_Course__c > returnList = new List < CCA_Course__c > ();
        
       
        if(searchKeyWord != null && searchKeyWord !=''){
            lstOfRecords =[ select id, Name,Is_it_an_Active_Course__c,Course_Name__c,Course_Category__c,Course_Cost__c,Description__c,Is_it_a_Recruitment_Course__c,Is_it_a_Training_Fund_Course__c from CCA_Course__c where Is_it_an_Active_Course__c ='Yes' and Course_Name__c LIKE: searchKey  ];
            system.debug('ss3'+lstOfRecords);
        }
        
        for (CCA_Course__c obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    /* @AuraEnabled
    public static List < sObject > onllyMonday(String sunendtime ) {
        system.debug('sss'+sunendtime);
        String searchKey =  '%' + sunendtime + '%';
  List < Instructor__c > returnList = new List < Instructor__c > ();
  List < Instructor__c > lstOfAccount = [select id, Name,First_Name__c,Last_Name__c,Monday_Test__c,Monday_Text_Values__c from Instructor__c
                                   where Monday_Text_Values__c LIKE: searchKey];
         system.debug('sss'+lstOfAccount);

  for (Instructor__c acc: lstOfAccount) {
   returnList.add(acc);
  }
  return returnList;
 }*/
}