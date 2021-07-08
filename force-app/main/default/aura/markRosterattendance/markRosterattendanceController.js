({
    onPageReferenceChange: function(component, event, helper) {
        var pageState = component.get("v.pageReference").state;
        var id = pageState.c__id;
        component.set("v.id", id);
        if(component.get("v.id") != null){
            helper.setupTable(component,event,helper);
        }
    }, 
    //Below onChangeVal function is used for to pass the Class scheduled date to get the attendance.
    onChangeVal:function(component,event,helper) {
        console.log(' set Id '+component.get("v.id"));
        helper.setupTable(component,event,helper);
    },
    reset : function(component,event,helper){
        component.set('v.searchName','');
        component.set('v.selectedRowsCount', 0);
        helper.setupTable(component,event,helper);
    },
    Search : function(component,event,helper){
        helper.setupTable(component,event,helper);
    },
    saveTableRecords : function(component, event, helper) {
        var recordsData = event.getParam("recordsString");
        var tableAuraId = event.getParam("tableAuraId");
        var action = component.get("c.updateRecords");
        action.setParams({
            jsonString: recordsData
        });
        action.setCallback(this,function(response){
            var datatable = component.find(tableAuraId);
            datatable.finishSaving("SUCCESS");
        });
        $A.enqueueAction(action);        
    },
    navigate : function(component, event, helper){
        var recordlinkto = component.get("v.id");
        var navEvt = $A.get("e.force:navigateToSObject");
        console.log('navEvt '+navEvt);
        navEvt.setParams({
            "recordId": recordlinkto,
        });
        navEvt.fire();
    },
    updateSelectedRecs: function (component, event) {
        var rowstoUpdate = event.getParam('selectedRows');
        component.set("v.selectedRowsCount", rowstoUpdate.length);
        component.set("v.rowsToupdate" , rowstoUpdate);
    },
    handleRecordSelectEvent : function(component, event, helper){
        var selectedRecords = event.getParam("selectedRecords");
        console.log(JSON.stringify(selectedRecords));
        component.set('v.selectedRecords',selectedRecords); 
    },
    handleSelect : function(component, event, helper){
        var selectedMenu = event.getSource().get("v.name");
        console.log( ' selectedMenu from handleSelect ' + selectedMenu);
        var selectedRecords = JSON.stringify(component.get("v.rowsToupdate"));
        console.log( ' selectedRecords from  handleSelect ' + selectedRecords);
        var action = component.get("c.updateMassRecords");
        action.setParams({
            selectedMenu : selectedMenu,
            attrecs : JSON.stringify(component.get("v.rowsToupdate"))
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            $A.get('e.force:refreshView').fire();
        }); 
        $A.enqueueAction(action);  
    },
    viewRoster : function(component, event, helper){
        var pageReference = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__ClassRelatedlist',
            },
            state: {
                "c__id": component.get("v.classId")
            }
        } 
        var nService = component.find("nService");
        event.preventDefault();
        nService.navigate(pageReference);
    },
    handleSort: function(component, event, helper) {
        helper.handleSort(component, event);
    },
    showModel: function(component, event, helper) {
        component.set("v.showModal", true);
    },
    hideModel: function(component, event, helper) {
        component.set("v.showModal", false);
    }
})