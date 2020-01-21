trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> tasks = new List<Task>();

	//Get Task ID
	User myUser = [SELECT Id FROM User WHERE Name = 'Prajvi Bakshi' LIMIT 1];

	for (Order_Event__e event : Trigger.New){
		if (event.has_Shipped__c == true){
			tasks.add(New Task(Priority = 'Medium',
				               Subject = 'Follow up on shipped order ' + event.Order_Number__c,
				               Status = 'New',
				               OwnerId = myUser.Id));
		}
	}
	insert tasks;
}