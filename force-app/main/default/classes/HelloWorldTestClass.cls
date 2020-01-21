@isTest
public class HelloWorldTestClass{
    @isTest static void validateHelloWorld(){
    //1. Setup the data
    Book__c b = new Book__c(Name = 'Behind the Cloud', Price__c = 100);
    System.debug('Price before inserting new book: ' + b.Price__c);

    //2. Execute the test
    //insert the book
    insert b;
    
    //retrieve the new book
    b = [SELECT Price__c FROM Book__c WHERE Id = :b.Id];
    System.debug('Price after trigger fired: ' + b.Price__c);
    
    //3. Validate the results
    System.assertEquals(90,b.Price__c);
    }
}