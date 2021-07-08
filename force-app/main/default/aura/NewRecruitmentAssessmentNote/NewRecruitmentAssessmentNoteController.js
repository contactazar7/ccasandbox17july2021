({
	myAction : function(component, event, helper) {
		
	},  
    handleSuccess: function(component, event, helper) {
        
      //  cmp.find("editForm").submit(); 
        var payload = event.getParams().response;
    var navService = component.find("navService");
    var pageReference = {
        type: 'standard__recordPage',
        attributes: {
            "recordId": payload.id,
            "objectApiName": "Recruitment_Assessment_Note__c",
            "actionName": "view"
        }

    }
    event.preventDefault();
    navService.navigate(pageReference);
        
        
        
      /*  var homeEvt = $A.get("e.force:navigateToObjectHome");
        homeEvt.setParams({
            "scope": "Recruitment_Assessment_Note__c"
        });
        homeEvt.fire();*/
        
    },
    doInit : function(component, event, helper) {
        var value = helper.getParameterByName(component , event, 'inContextOfRef');
        var context = JSON.parse(window.atob(value));
        var recordId = context.attributes.recordId;
        //alert(context.attributes.recordId)
        
        var action = component.get("c.getContactInfo"); 
        // method name i.e. getEntity should be same as defined in apex class
        // params name i.e. entityType should be same as defined in getEntity method
        
        
        action.setParams({
            "recordId" : recordId
        });
        action.setCallback(this, function(a){
            
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                 component.set("v.ContactId",result);
             /*   var objectname = result['ObjectName'];
              
                for(var key in result['Ids']) {
                    
                    if(objectname == 'contact') {
                        component.set('v.ContactId',key);
                       //component.set('v.consumerID','');
                    }
                    else {
                        component.set('v.ContactId',result['Ids'][key]);
                        component.set('v.consumerID',key);
                    } 
                }*/
            }
        });
        $A.enqueueAction(action);
    },
    onCancel : function(component, event) {
        
        var homeEvt = $A.get("e.force:navigateToObjectHome");
        homeEvt.setParams({
            "scope": "Recruitment_Assessment_Note__c"
        });
        homeEvt.fire();
        
    }  
  
})