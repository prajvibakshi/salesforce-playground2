@isTest
public class ParkLocatorTest {
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> expectedResults = new List<String>{'Germany','India','Japan','United States'};
            List<String> result = ParkLocator.country('India');
        System.assertEquals(expectedResults, result);
    }

}