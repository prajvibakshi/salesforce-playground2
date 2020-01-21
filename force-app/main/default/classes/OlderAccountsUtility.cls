public class OlderAccountsUtility {
    
    public static void updateOlderAccounts() {
        //Get the 5 oldest accounts
        Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5 ];
        //Loop through them and update the Description field
            for(Account acc : oldAccounts){
                acc.Description = 'Heritage Account';
            }
        //save the changes
        update oldAccounts;
    }

}