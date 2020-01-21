@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock {
    //Implement this interface method
    global HTTPResponse respond(HTTPRequest request){
        //Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setStatusCode(200);
        response.setBody('{"animals":["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        return response;
    }
}