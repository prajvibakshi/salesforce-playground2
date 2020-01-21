@isTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
    Object stub,
    Object request,
    Map<String, Object> response,
    String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
        //START - Specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();

        List<String> myStrings = new List<String>{'Germany','India','Japan','United States'};
            response_x.return_x = myStrings;
        //END
        response.put('response_x',response_x);
        
            
        
    }

}