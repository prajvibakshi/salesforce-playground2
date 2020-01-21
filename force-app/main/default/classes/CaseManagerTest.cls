@isTest
private class CaseManagerTest {
    @isTest static void testGetCaseById(){
        Id recordId = createTestRecord();
        //Setup a test resource
        //Create a REST request
        RestRequest request = new RestRequest();
        //Give the REST path/URI
        request.requestURI = 'https://cunning-goat-15777-dev-ed.my.salesforce.com/services/apexrest/Cases/' + recordId;
        //Define the REST method
        request.httpMethod = 'GET';
        RestContext.request = request;
        //Call the method to test
        Case thisCase = CaseManager.getCaseById();
        //Verify results
        System.assert(thisCase != null);
        System.assertEquals('Test record', thisCase.Subject);
        
    }
    
    @isTest static void testCreateCase(){
        //Call the method to test
        Id thisCaseId = CaseManager.createCase('Ferocious chipmunk', 'New', 'Phone', 'Low');
        
        //Verify results
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Subject FROM Case WHERE Id = :thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Subject, 'Ferocious chipmunk');
    }
    
    @isTest static void testDeleteCase(){
        //Create test record
        Id recordId = createTestRecord();
        //Create REST resource
        RestRequest request = new RestRequest();
        request.requestURI = 'https://cunning-goat-15777-dev-ed.my.salesforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        CaseManager.deleteCase();
        List<Case> cases = [SELECT Id FROM Case WHERE Id = :recordId];
        System.assert(cases.size() == 0);       
        
    }
    
    @isTest static void testUpsertCase(){
        //1. Insert new record
        Id case1Id = CaseManager.upsertCase('Ferocious chipmunk', 'New', 'Phone', 'Low', null);
        //Verify new record was created
        System.assert(case1Id != null);
        
        Case case1 = [SELECT Id, Subject FROM Case WHERE Id = :case1Id];
        System.assert(case1 != null);
        System.assertEquals(case1.Subject, 'Ferocious chipmunk');
        //2. Update Status to Working
        Id case2Id = CaseManager.upsertCase('Ferocious Chipmunk', 'Working', 'Phone', 'Low', case1Id);
        
        //Verify record was updated
        Case case2 = [SELECT Id, Status FROM Case WHERE Id = :case1Id];
        System.assert(case2 != null);
        System.assertEquals(case2.Status, 'Working');
    }
    
    @isTest static void testUpdateCaseFields(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://cunning-goat-15777-dev-ed/my.salesforce.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json;charset=UTF-8');
        request.requestBody = Blob.valueOf('{"status" : "Working"}');
        RestContext.request = request;
        //Update Status of existing Case record to Working
        Id thisCaseId = CaseManager.updateCaseFields();
        //Verify record was updated
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Status from Case where Id = :thisCaseId ];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Status, 'Working');
        
    }
    
    //Helper method
    static Id createTestRecord(){
        //Create test record
        Case caseTest = new Case(Subject = 'Test record', Status = 'New', Origin = 'Phone', Priority = 'Medium');
        insert caseTest;
        return caseTest.Id;
    }

}