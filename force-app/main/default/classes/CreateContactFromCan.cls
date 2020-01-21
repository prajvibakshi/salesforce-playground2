public with sharing class CreateContactFromCan {
    public void createContact(List<Candidate__c> candsFromTrigger){
    
        Account candAcct = [SELECT a.Id FROM Account a WHERE a.Name = 'Recruiting'];
        List<Contact> conList = new List<Contact>();
        
        for(Candidate__c currentCandidate : candsFromTrigger){
            Contact con = new Contact();
            con.FirstName = currentCandidate.First_Name__c;
            con.LastName = currentCandidate.Last_Name__c;
            con.Email = currentCandidate.Email__c;
            
            conList.add(con);
        }
        
        Database.insert(conList);
    }

}