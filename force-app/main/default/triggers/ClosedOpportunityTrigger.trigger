trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskList = new List<Task>();
    
    //For every opportunity which is inserted or updated with Stage = Closed Won
    for (Opportunity opp : [SELECT Id FROM Opportunity WHERE StageName = 'Closed Won' 
                            AND Id IN :Trigger.New]){
                                
                                //Add a Task related to this oppty with Subject 
                          		taskList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
                            }
    if(taskList.size() > 0){
        insert taskList;
    }

}