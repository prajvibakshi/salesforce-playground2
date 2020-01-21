@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        //grab the accountId from the end of the request URI
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [SELECT Id, Name, (SELECT LastName, Id FROM Contacts) FROM Account WHERE Id = :accountId LIMIT 1];
        return result;
    }

}