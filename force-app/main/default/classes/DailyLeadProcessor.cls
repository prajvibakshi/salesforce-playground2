public with sharing class DailyLeadProcessor implements Schedulable {

	public void execute(SchedulableContext ctx){
		List<Lead> leads = new List<Lead>();
		leads = [SELECT Id, LastName FROM Lead WHERE LeadSource = null LIMIT 200];
		for (Lead l : leads){
			l.LeadSource = 'Dreamforce';
		}
		update leads;
	}
}