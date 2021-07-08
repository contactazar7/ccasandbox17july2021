trigger updateTimeFieldsBasedonPicklistValue on SFDC_Class__c (before insert, before Update) {
    
           String val ='12:00 AM;12:15 AM;12:30 AM;12:45 AM;1:00 AM;1:15 AM;1:30 AM;1:45 AM;2:00 AM;2:15 AM;2:30 AM;2:45 AM;3:00 AM;3:15 AM;3:30 AM;3:45 AM;4:00 AM;4:15 AM;4:30 AM;4:45 AM;5:00 AM;5:15 AM;5:30 AM;5:45 AM;6:00 AM;6:15 AM;6:30 AM;6:45 AM;7:00 AM;7:15 AM;7:30 AM;7:45 AM;8:00 AM;8:15 AM;8:30 AM;8:45 AM;9:00 AM;9:15 AM;9:30 AM;9:45 AM;10:00 AM;10:15 AM;10:30 AM;10:45 AM;11:00 AM;11:15 AM;11:30 AM;11:45 AM;12:00 PM;12:15 PM;12:30 PM;12:45 PM;1:00 PM;1:15 PM;1:30 PM;1:45 PM;2:00 PM;2:15 PM;2:30 PM;2:45 PM;3:00 PM;3:15 PM;3:30 PM;3:45 PM;4:00 PM;4:15 PM;4:30 PM;4:45 PM;5:00 PM;5:15 PM;5:30 PM;5:45 PM;6:00 PM;6:15 PM;6:30 PM;6:45 PM;7:00 PM;7:15 PM;7:30 PM;7:45 PM;8:00 PM;8:15 PM;8:30 PM;8:45 PM;9:00 PM;9:15 PM;9:30 PM;9:45 PM;10:00 PM;10:15 PM;10:30 PM;10:45 PM;11:00 PM;11:15 PM;11:30 PM;11:45 PM;';

    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){

        for(SFDC_Class__c s : trigger.new){
           if(s.Class_Days__c!=null){
           s.Class_Days_Values__c =s.Class_Days__c;
           
           }
             if(s.Monday_Timings_For_Testing__c!=null){
           s.Monday_Values__c =s.Monday_Timings_For_Testing__c;
           
           }
            if(s.Tuesday_Timings__c!=null){
           s.Tuesday_Values__c =s.Tuesday_Timings__c;
           
           }
            if(s.Wednesday_Timings__c!=null){
           s.Wednesday_Values__c =s.Wednesday_Timings__c;
           
           }
            if(s.Thursday_Timings__c!=null){
           s.Thursday_Values__c =s.Thursday_Timings__c;
           
           }
           if(s.Friday_Timings__c!=null){
           s.Friday_Values__c =s.Friday_Timings__c;
           
           }
            if(s.Saturday_Timings__c!=null){
           s.Saturday_Values__c =s.Saturday_Timings__c;
           
           }
            if(s.Sunday_timings__c!=null){
           s.Sunday_Values__c =s.Sunday_timings__c;
           
           }
            if(s.Class_Timings__c!=null){
           s.Class_Days_Values__c =s.Class_Timings__c;
           
           }
           if(s.Class_Timings__c!=null && s.Same_time_for_all_days__c == true){
           s.Class_Days_Values__c =s.Class_Timings__c;
            s.Monday_Values__c =s.Class_Timings__c;
             s.Tuesday_Values__c =s.Class_Timings__c;
              s.Wednesday_Values__c =s.Class_Timings__c;
               s.Thursday_Values__c =s.Class_Timings__c;
                s.Friday_Values__c =s.Class_Timings__c;
                 s.Saturday_Values__c =s.Class_Timings__c;
                  s.Sunday_Values__c =s.Class_Timings__c;
           
           }
            
            /*if(string.isNotBlank(s.Monday_Timings_For_Testing__c)){
                 string tm = s.Monday_Timings_For_Testing__c.contains('PM') ? s.Monday_Timings_For_Testing__c.remove('PM')  : s.Monday_Timings_For_Testing__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Monday_Timings_For_Testing__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    s.Monday_Start_Time__c = myTime;
            }else if(s.Monday_Start_Time1__c == null){
             s.Monday_Start_Time__c = null;
            }*/ 
            
            if(string.isNotBlank(s.Monday_Timings_For_Testing__c)){
                if(val.contains(s.Monday_Timings_For_Testing__c)){
               
                List<String> splitSize = s.Monday_Timings_For_Testing__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Monday_Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                  
                      string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Monday_End_Time__c = myTime;
                                        system.debug('sss'+str3);

                }
                
            }
            }
            
            /*if(string.isNotBlank(s.Monday_End_Time2__c)){
               string tm = s.Monday_End_Time2__c.contains('PM') ? s.Monday_End_Time2__c.remove('PM')  : s.Monday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Monday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Monday_End_Time__c = myTime;
            }else if(s.Monday_End_Time__c == null){
             s.Monday_End_Time__c = null;
            }*/
              
            if(string.isNotBlank(s.Tuesday_Timings__c)){
                if(val.contains(s.Tuesday_Timings__c)){
                List<String> splitSize = s.Tuesday_Timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                     // integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                   integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Tuesday_Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                    //string  tm =  str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     
                     //integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                    //integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                     
                   //Time myTime = Time.newInstance(hrs+PmShift , Integer.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]), 0, 0);
                    string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Tuesday_End_Time__c = myTime;

                }
                
            }
              }
           /* if(string.isNotBlank(s.Tuesday_End_Time2__c)){
               string tm = s.Tuesday_End_Time2__c.contains('PM') ? s.Tuesday_End_Time2__c.remove('PM')  : s.Tuesday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Tuesday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Tuesday_End_Time__c = myTime;
            }else if(s.Tuesday_End_Time__c == null){
             s.Tuesday_End_Time__c = null;
            }*/
             if(string.isNotBlank(s.Wednesday_Timings__c)){
                if(val.contains(s.Wednesday_Timings__c)){
                List<String> splitSize = s.Wednesday_Timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                       integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);

                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Wednesday_Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                     string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Wednesday_End_Time__c = myTime;

                }
                
            }
             }
             /*if(string.isNotBlank(s.Wednesday_End_Time2__c)){
               string tm = s.Wednesday_End_Time2__c.contains('PM') ? s.Wednesday_End_Time2__c.remove('PM')  : s.Wednesday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Wednesday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Wednesday_End_Time__c = myTime;
            }else if(s.Wednesday_End_Time__c == null){
             s.Wednesday_End_Time__c = null;
            }*/
             
             if(string.isNotBlank(s.Thursday_Timings__c)){
                 if(val.contains(s.Thursday_Timings__c)){
                List<String> splitSize = s.Thursday_Timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                     integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);

                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Thursday_Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                    string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Thursday_End_Time__c = myTime;

                }
                
            }
             }
            
            /* if(string.isNotBlank(s.Thursday_End_Time2__c)){
               string tm = s.Thursday_End_Time2__c.contains('PM') ? s.Thursday_End_Time2__c.remove('PM')  : s.Thursday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Thursday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Thursday_End_Time__c = myTime;
            }else if(s.Thursday_End_Time__c == null){
             s.Thursday_End_Time__c = null;
            }*/
              if(string.isNotBlank(s.Friday_Timings__c)){
                if(val.contains(s.Friday_Timings__c)){
                List<String> splitSize = s.Friday_Timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                         integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);

                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Friday_Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                     string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Friday_End_Time__c = myTime;

                }
                
            }
              }
            /* if(string.isNotBlank(s.Friday_End_Time2__c)){
               string tm = s.Friday_End_Time2__c.contains('PM') ? s.Friday_End_Time2__c.remove('PM')  : s.Friday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Friday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Friday_End_Time__c = myTime;
            }else if(s.Friday_End_Time__c == null){
             s.Friday_End_Time__c = null;
            }*/
             
            if(string.isNotBlank(s.Saturday_Timings__c)){
                 if(val.contains(s.Saturday_Timings__c)){
                List<String> splitSize = s.Saturday_Timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                    integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);

                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Saturday_Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                  string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Saturday_End_Time__c = myTime;


                }
                
            }
             
            }
             /*if(string.isNotBlank(s.Saturday_End_Time2__c)){
               string tm = s.Saturday_End_Time2__c.contains('PM') ? s.Saturday_End_Time2__c.remove('PM')  : s.Saturday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Saturday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Saturday_End_Time__c = myTime;
            }else if(s.Saturday_End_Time__c == null){
             s.Saturday_End_Time__c = null;
            }*/
             
             if(string.isNotBlank(s.Sunday_timings__c)){
                if(val.contains(s.Sunday_timings__c)){
                List<String> splitSize = s.Sunday_timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                        integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);

                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Sunday_Start_Time1__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
               string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.Sunday_End_Time1__c = myTime;

                }
                
            }
             }
            /* if(string.isNotBlank(s.Sunday_End_Time__c)){
               string tm = s.Sunday_End_Time__c.contains('PM') ? s.Sunday_End_Time__c.remove('PM')  : s.Sunday_End_Time__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Sunday_End_Time__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Sunday_End_Time1__c = myTime;
            }else if(s.Sunday_End_Time1__c == null){
             s.Sunday_End_Time1__c = null;
            }*/
              
             if(string.isNotBlank(s.Class_Timings__c)){
               if(val.contains(s.Class_Timings__c)){
                List<String> splitSize = s.Class_Timings__c.split(';');
                
                string str1= splitSize[0];
                string str2 = str1.split('-')[0];
                if(string.isNotBlank(str2)){
                  string tm =  str2.contains('PM') ? str2.remove('PM')  : str2.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str2.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    system.debug('sss'+myTime);
                    s.Start_Time__c = myTime;
                }

                string str3= splitSize[splitSize.size()-1];
                //string str4 = str3.split('-')[1];
                 system.debug('sss'+str3);
                //system.debug('sss'+str4);
                if(string.isNotBlank(str3)){
                    
                     string tm = str3.contains('PM') ? str3.remove('PM')  : str3.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = str3.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                      s.End_Time__c = myTime;


                }
                
            }
             }
            /* if(string.isNotBlank(s.End_Time1__c)){
               string tm = s.End_Time1__c.contains('PM') ? s.End_Time1__c.remove('PM')  : s.End_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.End_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.End_Time__c = myTime;
            }else if(s.End_Time__c == null){
             s.End_Time__c = null;
            }*/
            /* if(string.isNotBlank(s.Tuesday_Start_Time1__c)){
               string tm = s.Tuesday_Start_Time1__c.contains('PM') ? s.Tuesday_Start_Time1__c.remove('PM')  : s.Tuesday_Start_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Tuesday_Start_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Tuesday_Start_Time__c = myTime;
            }else if(s.Tuesday_Start_Time__c == null){
             s.Tuesday_Start_Time__c = null;
            }
            
             if(string.isNotBlank(s.Tuesday_End_Time2__c)){
               string tm = s.Tuesday_End_Time2__c.contains('PM') ? s.Tuesday_End_Time2__c.remove('PM')  : s.Tuesday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Tuesday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Tuesday_End_Time__c = myTime;
            }else if(s.Tuesday_End_Time__c == null){
             s.Tuesday_End_Time__c = null;
            }
            
            if(string.isNotBlank(s.Wednesday_Start_Time1__c)){
             string tm = s.Wednesday_Start_Time1__c.contains('PM') ? s.Wednesday_Start_Time1__c.remove('PM')  : s.Wednesday_Start_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Wednesday_Start_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Wednesday_Start_Time__c = myTime;
            }else if(s.Wednesday_Start_Time__c == null){
             s.Wednesday_Start_Time__c = null;
            }
            
            if(string.isNotBlank(s.Wednesday_End_Time2__c)){
                 string tm = s.Wednesday_End_Time2__c.contains('PM') ? s.Wednesday_End_Time2__c.remove('PM')  : s.Wednesday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Wednesday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Wednesday_End_Time__c = myTime;
            }else if(s.Wednesday_End_Time__c == null){
             s.Wednesday_End_Time__c = null;
            }
            
            if(string.isNotBlank(s.Thursday_Start_Time1__c)){
             string tm = s.Thursday_Start_Time1__c.contains('PM') ? s.Thursday_Start_Time1__c.remove('PM')  : s.Thursday_Start_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Thursday_Start_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Thursday_Start_Time__c = myTime;
            }else if(s.Thursday_Start_Time__c == null){
             s.Thursday_Start_Time__c = null;
            }
            
            if(string.isNotBlank(s.Thursday_End_Time2__c)){
                string tm = s.Thursday_End_Time2__c.contains('PM') ? s.Thursday_End_Time2__c.remove('PM')  : s.Thursday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Thursday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Thursday_End_Time__c = myTime;
            }else if(s.Thursday_End_Time__c == null){
             s.Thursday_End_Time__c = null;
            }
            
             if(string.isNotBlank(s.Friday_Start_Time1__c)){
                string tm = s.Friday_Start_Time1__c.contains('PM') ? s.Friday_Start_Time1__c.remove('PM')  : s.Friday_Start_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Friday_Start_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Friday_Start_Time__c = myTime;
            }else if(s.Friday_Start_Time__c == null){
             s.Friday_Start_Time__c = null;
            }
                        
            if(string.isNotBlank(s.Friday_End_Time2__c)){
                 string tm = s.Friday_End_Time2__c.contains('PM') ? s.Friday_End_Time2__c.remove('PM')  : s.Friday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Friday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Friday_End_Time__c = myTime;
            }else if(s.Friday_End_Time__c == null){
             s.Friday_End_Time__c = null;
            }
            
            if(string.isNotBlank(s.Saturday_Start_Time1__c)){
                string tm = s.Saturday_Start_Time1__c.contains('PM') ? s.Saturday_Start_Time1__c.remove('PM')  : s.Saturday_Start_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Saturday_Start_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Saturday_Start_Time__c = myTime;
            }else if(s.Saturday_Start_Time__c == null){
             s.Saturday_Start_Time__c = null;
            }
            if(string.isNotBlank(s.Saturday_End_Time2__c)){
              string tm = s.Saturday_End_Time2__c.contains('PM') ? s.Saturday_End_Time2__c.remove('PM')  : s.Saturday_End_Time2__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Saturday_End_Time2__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : 0;
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.Saturday_End_Time__c = myTime;
            }else if(s.Saturday_End_Time__c == null){
             s.Saturday_End_Time__c = null;
            }*/
        }
    }
    
    
    //Classtimeings
  /* if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        for(SFDC_Class__c s : trigger.new){
           
            
            if(string.isNotBlank(s.Start_Time1__c)){
                 string tm = s.Start_Time1__c.contains('PM') ? s.Start_Time1__c.remove('PM')  : s.Start_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.Start_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) : ( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                    s.Start_Time__c = myTime;
            }else if(s.Start_Time1__c== null){
             s.Start_Time__c = null;
            }
            
            if(string.isNotBlank(s.End_Time1__c)){
               string tm = s.End_Time1__c.contains('PM') ? s.End_Time1__c.remove('PM')  : s.End_Time1__c.remove('AM');
                     integer hrs = Double.valueOf(tm.split(':')[0]).intValue();
                       integer mit= Double.valueOf(tm.split(':')[1].contains('00') ? '0':tm.split(':')[1]).intValue();
                      integer PmShift = s.End_Time1__c.contains('PM') ? ( hrs== 12 ? 24 : 12) :( hrs== 12 ? 12 : 24);
                    Time myTime = Time.newInstance(hrs+PmShift, mit, 0, 0);
                s.End_Time__c = myTime;
            }else if(s.End_Time1__c == null){
             s.End_Time__c = null;
            }
            
        }
    }*/

}