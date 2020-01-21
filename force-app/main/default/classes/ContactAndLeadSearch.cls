public class ContactAndLeadSearch {
    
    public static List<List<sObject>> searchContactsAndLeads(String input1){
        
        List<List<sObject>> searchList = [FIND :input1 IN ALL FIELDS 
                                          RETURNING Contact(FirstName, LastName), 
                                          Lead(FirstName, LastName)];
        
        return searchList;
    }
   
}