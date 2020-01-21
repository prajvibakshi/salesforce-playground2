@isTest
private class TestVerifyDate { 
    @isTest static void TestVerifyDate2Within30Days(){
        //Within 30 days      //date1               //date2
        VerifyDate.CheckDates(System.today(), System.today().addDays(10));   
        
    }
    
    @isTest static void TestVerifyDate2Beyond30Days(){
        VerifyDate.CheckDates(System.today(), System.today().addDays(60));
    }
    
    @isTest static void TestVerifyDate1Greater(){
        VerifyDate.CheckDates(System.today().addDays(5), System.today());
    }

}