public class AccountProcessor {
    
    @future
    public static void countContacts(Set<id> setId){
        List<Account> acc = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :setId];
        for (Account a : acc){
            List<Contact> con = a.contacts;
            a.Number_of_Contacts__c = con.size();
        }
        update acc;
    }
    
}