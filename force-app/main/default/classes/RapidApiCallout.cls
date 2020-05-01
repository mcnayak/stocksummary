public with sharing class RapidApiCallout {
    public RapidApiCallout() {
        Http http = new HTTP();

        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint('callout:YahooFin/mcnayak');
        req.setHeader('APIKEY','{!$Credential.Passwword');
        res = http.send(req);
        system.debug(res.getBody());

    }
}
