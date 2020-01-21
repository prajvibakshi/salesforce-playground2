trigger NewHelloWorldTrigger on Book__c (before insert) {
    Book__c[] books = Trigger.new;
    
    //Static method called below - static methods do not need to be instantiated
    //They can directly be accessed using Classname.Methodname(arguments)
    MyHelloWorld.applyDiscount(books);
}