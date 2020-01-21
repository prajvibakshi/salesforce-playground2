public class CalloutClass {
    @future(callout=true)
    public static void makeCallout(){
        HttpRequest request = new HttpRequest();
        //Set the endpoint URL 
        String endpoint = 'http://bit-tech.net';
        request.setEndPoint(endpoint);
        
        //Set the HTTP verb to GET
        request.setMethod('GET');
        
        //Send the HTTP request and get the response
        HttpResponse response = new HTTP().send(request);
    }

}