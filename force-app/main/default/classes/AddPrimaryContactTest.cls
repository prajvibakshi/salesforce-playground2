@isTest
public class AddPrimaryContactTest {
	//----testSetup
	@isTest static void testQueueable(){
		List<Account> account = new List<Account>();

		for(Integer i=0; i<50; i++){
			account.add(New Account(Name = 'Test Account ' +i,
				BillingState = 'NY'));
		}

		for(Integer i=0; i<50; i++){
			account.add(New Account(Name = 'Test Account ' + i,
				BillingState = 'CA'));
		}
		insert account;

		Contact co = new Contact(FirstName = 'Test', LastName = 'Demo');
		String state = 'CA';
		//----testSetup

		AddPrimaryContact apc = new AddPrimaryContact(co, state);

		//----testExecute
		Test.startTest();
		System.enqueueJob(apc);
		Test.stopTest();
		//----testExecute

		//----testResult
		System.assertEquals(50, [SELECT count() FROM Contact WHERE AccountId IN 
			(SELECT Id FROM Account WHERE BillingState = :state)]);



	}
}