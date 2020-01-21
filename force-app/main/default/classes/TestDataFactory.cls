@isTest
public class TestDataFactory {
    
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct){
        List<Account> accts = new List<Account>();
        
        //passes a number for the number of accounts to be added to the list
        for (Integer i = 0; i < numAccts; i++){
            Account a = new Account (Name = 'Test Account' + i);
            accts.add(a);
            
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        
        for (Integer j = 0; j < numAccts ; j++){
            //For each account just inserted, add opportunities
            Account acct = accts[j];
            for (Integer k = 0; k < numOppsPerAcct ; k++){
                opps.add(new Opportunity(Name = acct.Name + ' Opportunity ' + k ,
                                        StageName = 'Prospecting',
                                        AccountId = acct.Id, 
                                        CloseDate = System.today().addMonths(1)));
                
            }
            
        }
        insert opps;
        
        return accts;
    }

}