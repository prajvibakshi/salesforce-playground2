public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numOfCons, String lastName){
        
        List<Contact> cts = new List<Contact>();
        
        for(integer i = 0; i < numOfCons ; i++){
            cts.add(new Contact(FirstName = 'Test ' +i, LastName = lastName));
        }
        
        return cts;
    }

}