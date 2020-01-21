@isTest
private class TestRestrictContactByName {
    @isTest static void ContactRestrictByLastName() {
        
        //Test data setup (Arrange)
        Contact con1 = new Contact(FirstName = 'Trigger Test1',
                                   LastName = 'INVALIDNAME');
        
        //Perform test (Act)
        Test.startTest();
        
        try {
            insert con1;
        }
        catch (DmlException dmlEx){
            //Verify (Assert)
            //In this case the insert should have been stopped by the trigger,
            //so we need to verify that we got a dml exception (and specifically we got the error message
            //that we were expecting)
            
            String expectedMessage = 'The Last Name "' +con1.LastName+ '" is not allowed for DML';
            System.assertEquals(expectedMessage, dmlEx.getDmlMessage(0));
        }      
        
        Test.stopTest();
        
    }

}