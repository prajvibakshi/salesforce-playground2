trigger AddRelatedRecord on Account (after insert, after update) {
    
    //Create an opportunity list placeholder
    List<Opportunity> oppList = new List<Opportunity>();
    
    //Check for every account which does not have a related opportunity
    for (Account a : [SELECT Id,Name FROM Account 
                      WHERE Id IN :Trigger.New 
                      AND Id NOT IN (SELECT AccountId FROM Opportunity)]){
                          
                          //If there is no related opportunity for the account, add the opportunity
                          oppList.add(new Opportunity(Name = a.Name + ' Opportunity', 
                                                     StageName = 'Prospecting',
                                                     CloseDate = System.today().addMonths(1),
                                                     AccountId = a.Id,
                                                     Discount_Percent__c = 10));
        
    }
    //now that the opptys have been added to the list placeholder, insert them in the DB
    if(oppList.size() > 0){
        insert oppList;
    }
}

/* OLD Code
List<Opportunity> oppList = new List<Opportunity>(); //Create a List variable for oppty
    
    //Get related opportunities for the accounts in this trigger
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
    
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate through each account.
    for(Account a : Trigger.New){
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size() = ' + acctsWithOpps.get(a.Id).Opportunities.size());
        // Check if the account already has a related opportunity.
        if (acctsWithOpps.get(a.Id).Opportunities.size() == 0){
            // If it doesn't, add a default opportunity
            oppList.add(new Opportunity(Name = a.Name + ' Opportunity',
                                       StageName = 'Prospecting',
                                       CloseDate = System.today().addMonths(1),
                                       AccountId = a.Id,
                       Discount_Percent__c = 30));
        }
    }
    
    if (oppList.size() > 0){
        insert oppList;
    }

}*/