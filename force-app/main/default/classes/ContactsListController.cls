public class ContactsListController {
    
    //controller code goes here
	private String sortOrder ='LastName';
    
    //getter
    public List<Contact> getContacts(){
        										//Take care of spacing here within the quotes
        List<Contact> results = Database.query('SELECT Id, FirstName, LastName, Title, Email' + ' FROM Contact ' 
                                              + 'ORDER BY ' + sortOrder + ' ASC ' + ' LIMIT 10');
        
        return results;
    }
    
    public void sortByLastName(){
        this.sortOrder = 'LastName';
    }
    
    public void sortByFirstName(){
        this.sortOrder = 'FirstName';
    }
    
}