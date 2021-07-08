({
    doInit : function(component, event, helper) {
        //alert(component.get("v.contactId"))
        var stringURL = window.location.hostname;
        stringURL = stringURL.split('--c')[0];
        var enrollmentURL = 'https://'+stringURL+'.lightning.force.com/lightning/r/Contact/';
        component.set("v.customURL", enrollmentURL);
        helper.fetchEnrollmentDetails(component, event, helper);
        helper.fetchClassDetails(component, event, helper);
    },
    backtoClass : function (component, event, helper) {
        var baseURL = window.location.href;
        var domain = baseURL.substring(8, baseURL.indexOf("--c"));
        window.open('https://'+domain+'.lightning.force.com/lightning/r/contact/'+component.get('v.contactId')+'/view',"_self");
    },
     showSpinner: function(component, event, helper) {
        // make Spinner attribute true for displaying loading spinner 
        component.set("v.spinner", true); 
    },
     
    // function automatic called by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hiding loading spinner    
        component.set("v.spinner", false);
    },
     
    handleClassCheck: function(component, event, helper) {
       // alert('ClassId--'+event.getSource().get("v.name"))
        //component.set('v.selectedClassId', event.getSource().get("v.name"));    
        component.set('v.selectedClassId', event.getSource().get("v.text"));    
    },
    transferStudent : function(component, event, helper) {
    
        var action = component.get("c.studentTransfer");
        action.setParams({
            "enrollmentId":component.get("v.enrollmentId"),
            "newClassId":component.get("v.selectedClassId")
           
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Transfer Request sent for Approval..');
                helper.fetchEnrollmentDetails(component, event, helper);
                helper.fetchClassDetails(component, event, helper);              
            }
            else{
                alert("Error Occured");
            }
        });
        $A.enqueueAction(action);
    },
     createRecords: function(component, event, helper) {
        
         //alert('here')
       // alert('ClassId2--'+component.get("v.selectedClassId"))
       component.set("v.spinner", true);
        var action = component.get("c.createEnrollments");
        action.setParams({           
            "classId":component.get("v.selectedClassId"),
            "contactId":component.get("v.contactId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.spinner", false);
                alert('Records Created..');
                helper.fetchEnrollmentDetails(component, event, helper);
                helper.fetchClassDetails(component, event, helper);
            }
            else{
                component.set("v.spinner", false);
                alert("Error Occured");
            }
        });
        $A.enqueueAction(action);
       // component.set("v.isModalOpen", false);
    },
     classSearch: function(component, event, helper) {
        //alert('here')
        var searchClassNameField = component.find('className');
        var searchClassNameText = searchClassNameField.get('v.value');
        var searchClassCourseField = component.find('classCourse');
        var searchClassCourseText = searchClassCourseField.get('v.value');
        var searchClassCategoryField = component.find('classCategory');
        var searchClassCategoryText = searchClassCategoryField.get('v.value');
        var searchClassPreferredDayField = component.find('classPreferredDay');
        var searchClassPreferredDayText = searchClassPreferredDayField.get('v.value');
        var searchLanguageField = component.find('language');
        var searchLanguageText = searchLanguageField.get('v.value');
         
        //alert(searchClassNameText)
        helper.classSearchHelper(component, event, searchClassNameText, searchClassCourseText, searchClassCategoryText, searchClassPreferredDayText, searchLanguageText);
    },
    Clear: function(component, event, helper) {
        //alert(component.find('v.searchKeyword'));
         var searchClassNameField = component.find('className').set("v.value", "");
         var searchClassCourseField = component.find('classCourse').set("v.value", "");
         var searchClassCategoryField = component.find('classCategory').set("v.value", "");
         var searchClassPreferredDayField = component.find('classPreferredDay').set("v.value", "");
         var searchLanguageField = component.find('language').set("v.value", "");
         //var searchEdFundPrimaryField = component.find('EdFundPrimary').set("v.value", "");
        // var searchEdFundSecondaryField = component.find('EdFundSecondary').set("v.value", "");
        
            helper.classSearchHelper(component, event );
       
    }  
})