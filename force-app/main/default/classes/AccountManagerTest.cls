@isTest
private class AccountManagerTest {
    @isTest static void testGetAccount(){
        Id accountId = createAccount();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://cunning-goat-15777-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + accountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        //Test the method
        Account acc1 = AccountManager.getAccount();
        System.assert(acc1 != null);
        System.assertEquals(acc1.Name, 'Test Account');
        List<Contact> con1 = [SELECT LastName, Id FROM Contact WHERE AccountId =:acc1.Id];
        System.assert(con1.size() != 0);
        System.assertEquals(con1[0].LastName, 'Test Contact');        
        
    }

    //Helper method
    static Id createAccount(){
        Account account1 = new Account(Name = 'Test Account');
        insert account1;
        Contact contact1 = new Contact(LastName = 'Test Contact', AccountId = account1.Id);
        insert contact1;
        return account1.Id;
    }
}