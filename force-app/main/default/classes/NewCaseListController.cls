public class NewCaseListController {

    
    //getter method
    public List<Case> getNewCases(){
        
        List<Case> results = Database.query('SELECT Id, CaseNumber FROM Case WHERE Status = \'New\' ');
        
        return results;
    }

}