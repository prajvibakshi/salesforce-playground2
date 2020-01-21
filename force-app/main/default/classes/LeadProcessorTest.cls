@isTest
public class LeadProcessorTest {
	@testSetup
	static void setup() {
		List<Lead> lead = new List<Lead>();

		for(Integer i=0; i<200; i++){
			lead.add(New Lead(LastName = 'Lead Test ' + i,
			Company = 'Test ' + i, 
			Status = 'Open - Not Contacted',
			LeadSource = 'Dreamforce'));
		}
		insert lead;
	}

	static testmethod void test(){
		Test.startTest();
		LeadProcessor lp = new LeadProcessor();
		Id BatchId = Database.executeBatch(lp);
		Test.stopTest();

		System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
	}
}