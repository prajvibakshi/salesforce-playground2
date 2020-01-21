@isTest
private class UpdateContactAddressesTest {
	@testSetup
	static void setup(){
		List<Account> accounts = new List<Account>();
		List<Contact> contacts = new List<Contact>();
		//insert 10 accounts
		for(Integer i = 0; i < 10 ; i++){
			accounts.add(New Account(Name='Account ' + i, BillingCity = 'New York',
				BillingCountry = 'USA'));
		}
		insert accounts;
		//find the accounts just inserted. Add contacts for each
		for(Account account : [SELECT Id FROM Account]){
			contacts.add(New Contact(FirstName='first', LastName = 'last', 
				AccountId = account.Id));
		}
		insert contacts;
	}

	static testmethod void test(){
		Test.startTest();
		UpdateContactAddresses uca = new UpdateContactAddresses();
		Id batchId = Database.executeBatch(uca);
		Test.stopTest();
		//after the testing stops, assert records were updated properly
		System.assertEquals(10, [SELECT count() FROM Contact where MailingCity = 'New York']);
	}

}