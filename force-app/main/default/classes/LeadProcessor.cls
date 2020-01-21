global class LeadProcessor implements 
		Database.Batchable<sObject> , Database.Stateful  {
	

	global Integer recordsProcessed = 0;

	global Database.QueryLocator start(Database.BatchableContext bc){
		return Database.getQueryLocator('SELECT Id FROM Lead');
	}

	global void execute(Database.BatchableContext bc, List<Lead> scope){
		for (Lead l : scope){
			l.LeadSource = 'Dreamforce';
			recordsProcessed += 1;
		}
	}

	global void finish(Database.BatchableContext bc){
		System.debug(recordsProcessed + ' Records Processed!');
		AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, 
		TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];
		System.debug(job + 'Jobs Processed!');
	}
}