public with sharing class RapidApiCallout {
    @AuraEnabled(cacheable=true)
    public static string ApiRequest(string url) {
        Http http = new HTTP();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint('callout:YahooFin');
      //  req.setEndpoint('callout:Yahoo_Finance/stock/v2/get-summary?symbol=CRM');
       
        req.setHeader('Content-Type','application/json');
        // If I uncomment rapid-key and use the hardcoded API key value it works.
     // req.setHeader('x-rapidapi-key','fed0dc9471msh19edb801e26a30ep1cba77jsn002db7d60898');
        req.setHeader('Authorization','{!$Credential.Password');
        req.setHeader('x-rapidapi-host','apidojo-yahoo-finance-v1.p.rapidapi.com');
        res = http.send(req);
        system.debug(res.getBody());
        return 'a';

    }
}