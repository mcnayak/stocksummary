public with sharing class PosttoMyNewHerokuWebService {
    public PosttoMyNewHerokuWebService() {
    }

    @AuraEnabled
    public static String postAccounttoHerokuWS(String account_name){
        String strResponse = '';
        String some_path = '/getJobs/' + account_name + '/categories';
        // http://lwc-python-api.herokuapp.com/fetchJobs
        HttpRequest httpRequest = new HttpRequest();  
        Http http = new Http();
        HttpResponse httpResponse = new HttpResponse();

        // httpRequest.setEndpoint('callout:LWC_Python_Heroku_Web_Service' + some_path);
        // httpRequest.setMethod('GET');   
        // httpRequest.setHeader('Content-Type', 'application/json');


        httpRequest.setEndpoint('callout:LWC_Python_Heroku_Web_Service/fetchJobs');
        httpRequest.setMethod('POST');
        httpRequest.setHeader('Content-Type', 'application/json');
        // Set the body as a JSON object
        httpRequest.setBody('{ "accountName": "' + account_name + '" }');
        
        try {  
            httpResponse = http.send(httpRequest);
                
            if (httpResponse.getStatusCode() == 200 || httpResponse.getStatusCode() == 201) {  
                strResponse = httpResponse.getBody(); 
            }
            else {  
                throw new CalloutException(httpResponse.getBody());  
            }   
        } 
        catch(Exception ex) {  
            throw ex;  
        } 

        return strResponse;
    }

}