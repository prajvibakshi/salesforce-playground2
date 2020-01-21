public with sharing class AddPrimaryContact implements Queueable {
	

	private Contact c;
	private String state;

	//Constructor
	public AddPrimaryContact(Contact c, String stateAbbreviation) {
		this.c = c;
		this.state = stateAbbreviation;

	}

	public void execute(QueueableContext context){
		
		//Get 200 Accounts
		List<Account> listAccount = [SELECT Id, Name, (SELECT Id, FirstName, 
								LastName FROM Contacts ) 
								FROM Account WHERE BillingState = :state LIMIT 200];

		List<Contact> lstContact = new List<Contact>();
		for(Account acc : listAccount){
			Contact cont = c.clone(false, false, false, false);
			cont.AccountId = acc.Id;
			lstContact.add(cont);
			}

		if(lstContact.size() > 0){
			insert lstContact;
		}

	}
}