({
    setupTable : function(component,event, helper) {
        var action = component.get("c.getPicklistValues");
        component.set("v.loaded",false);
        action.setParams({
            objectAPIName: "Attendance__c",
            fieldAPIName: "Status__c"
        });
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.loaded",true);
                console.log('response getState == '+response.getState());
                console.log('response getValues == '+response.getReturnValue());
                var types = [];
                Object.entries(response.getReturnValue()).forEach(([key, value]) => types.push({label:key,value:value}));
                var cols = [
                    {label: 'Attendance #', fieldName: 'attendanceLink', type: 'url', sortable: true , typeAttributes: { label: { fieldName: 'Name' }, target: '_blank', tooltip:{fieldName: 'Name'}}},
                    {label: 'Enrollment #', fieldName: 'Enrollment_No__c', type: 'Formula', sortable: true},
                    {label: 'Provider Name', fieldName: 'Contact_Name__c', type: 'Formula', sortable: true},
                    //{label: "Students RSVP", fieldName: "Students_RSVP__c", editable: false, type:"text"}, 
                    {label: 'Class Scheduled Date', fieldName: 'Date__c', type: 'Date', sortable: true},
                   	{label: "Attendance Status", fieldName: "Status__c", type:"picklist", selectOptions:types, sortable: true}, 
					{label: "Created Date", fieldName: "CreatedDate", type:"date", sortable: true}
              ];
                component.set("v.columns", cols);
                this.loadRecords(component);
            }else{
                var errors = response.getError();
                var message = "Error: Unknown error";
                if(errors && Array.isArray(errors) && errors.length > 0)
                    message = "Error: "+errors[0].message;
                component.set("v.error", message);
            }
        });
        $A.enqueueAction(action);
    },
    loadRecords : function(component) {
        console.log(' SearchName ' + component.get("v.searchName"));

        var action = component.get("c.fetchAttendance");
        action.setParams({
            'recId'         : component.get("v.id"),
            'providerName'  : component.get("v.searchName")
        });
        action.setCallback(this,function(response){
            if(response.getState() === "SUCCESS"){
                var allRecords = response.getReturnValue();
                if(allRecords.length == 0){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Error',
                        type: 'Error',
                        message: 'No records has found',
                        duration:'100',
                        key: 'info_alt',
                        mode: 'dismissible'
                    });
                    toastEvent.fire();
                }
                allRecords.forEach(rec => {
                    rec.attendanceLink = '/'+rec.Id;
                    component.set("v.classId" , rec.Class__c)
                });
                    component.set("v.data", allRecords);
                    component.set("v.cloneResult" , allRecords);
                    component.set("v.isLoading", false);
                    component.set("v.TotalNumberOfRecord", allRecords.length);
                    var filterdatamethods = component.find('datatableId');
                    if(allRecords.length>0){
                    filterdatamethods.filtermethod(allRecords);
                }
                }else{
                    var errors = response.getError();
                    var message = "Error: Unknown error";
                    if(errors && Array.isArray(errors) && errors.length > 0)
                    message = "Error: "+errors[0].message;
                    component.set("v.error", message);
                }
                });
         $A.enqueueAction(action);
     },
     sortBy: function(field, reverse, primer) {
        var key = primer
        ? function(x) {
            return primer(x[field]);
        }
        : function(x) {
            return x[field];
        };
        return function(a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    },
    handleSort: function(component, event) {
        var sortedBy = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        var cloneData = component.get('v.cloneResult');
        cloneData.sort((this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1)));
        component.set('v.data', cloneData);
        component.set('v.sortDirection', sortDirection);
        component.set('v.sortedBy', sortedBy);
    }
 })