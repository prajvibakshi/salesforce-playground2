public class ParkLocator {
    public static List<String> country(String input){
        ParkService.ParksImplPort countryList = new ParkService.ParksImplPort();
        return countryList.byCountry(input);
        
    }
}