@isTest
private class TalktoMyNewHerokuWebServiceTest {
    
    @isTest static void TestTalktoMyNewHerokuWebService() {
   
        Test.setMock(HttpCalloutMock.class, new TalktoMyNewHerokuWebServiceMockImpl());
        string res  = TalktoMyNewHerokuWebService.getJobsFromHerokuWS('CRM');
        String expectedValue = '{"example":"test"}';
    }
}