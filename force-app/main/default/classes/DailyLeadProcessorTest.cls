@isTest
public with sharing class DailyLeadProcessorTest {

	static String CRON_EXP = '0 0 0 22 9 ? 2018';
	@isTest static void DailyLeadProcessorTest() {

		//Setup
		List<Lead> listOfLeads = new List<Lead>();
		for (Integer i=0; i<200; i++){
			listOfLeads.add(New Lead(
				LastName = 'Test ' + i,
				Company = 'Test Company ' + i, 
				Status = 'Open - Not Contacted'));
		}
		insert listOfLeads;
		//Setup

		//Execute
		Test.startTest();
		String jobId = System.schedule('Daily Lead Processor', CRON_EXP , new DailyLeadProcessor());
		Test.stopTest();
		//Execute

		//Result
		System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
		//Result
	}
}