@isTest
private class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data setup
        // Create one account with one opportunity by calling a utility method 

        Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);

        // And then try to delete it
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                             result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestDeleteAccountWithNoOpportunities(){
        
        Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
    }
    
    @isTest static void TestDeleteBulkAccountWithOneOpportunity(){
        
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);
        
        Test.startTest();
        Database.DeleteResult[] result = Database.delete(accts, false);
        Test.stopTest();
        
        for (Database.DeleteResult dr : result){
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Cannot delete accounts with related opportunities.', dr.getErrors()[0].getMessage());
            
        }
    }
    
    @isTest static void TestDeleteBulkAccountsWithNoOpportunities(){
        
        Account[] accts = TestDataFactory.createAccountsWithOpps(200,0);
        
        Test.startTest();
        Database.DeleteResult[] result = Database.delete(accts, false);
        Test.stopTest();
        
        for(Database.DeleteResult dr : result){
        	System.assert(dr.isSuccess());    
        }
        
 
        

    }
    
}