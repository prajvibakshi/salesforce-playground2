trigger AccountDeletion on Account (before delete) {
    //Prevent deletion of Account if there are related opportunities
    for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]){
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
    }
}