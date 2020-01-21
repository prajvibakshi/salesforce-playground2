public class ContactSearch {
    
    public static Contact[] searchforContacts (String input1, String input2){
        Contact[] conList = [SELECT Id,Name FROM Contact WHERE LastName=:input1 AND MailingPostalCode=:input2];
        System.debug('conList is ' + conList);
        return conList;
        
    }

}