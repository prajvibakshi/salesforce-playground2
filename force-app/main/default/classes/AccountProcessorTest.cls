@isTest
public class AccountProcessorTest {
    @isTest static void testCountContacts(){
        
        Id testId = createData();
        Set<Id> accId = new Set<Id>();
        accId.add(testId);
        
        //future tests come in here
        Test.startTest();
        AccountProcessor.countContacts(accId);
        Test.stopTest();
        
        Account acc = [SELECT Number_of_Contacts__c FROM Account where Id in :accId LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);
      //  System.assert(condition)
    }
    
    static Id createData(){
        Account acc1 = new Account(Name = 'Test Account');
        insert acc1;
        
        Contact con1 = new Contact(AccountId = acc1.Id, LastName = 'Test Contact');
        insert con1;
        
        return acc1.Id;
    }

}