public class AccountHandler {
    
    public static Account insertNewAccount (String inputAcc) {
        
        if (inputAcc!=''){
            
        try {
            
            Account a = new Account(Name=inputAcc);
                insert a;
            System.debug('Account is inserted: ' + a.Name);
            return a;
            
        } catch (Exception e){
            System.debug('Account not created: ' + e.getMessage());
            return null;
            
        }
        } else {
            return null;
        }
    }

}