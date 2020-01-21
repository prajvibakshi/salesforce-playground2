public class BankAcct {
    private Integer balance = 0;
    public String acctName;
    
    //Declare a public String attribute called accttype
    public String accttype;
    
    public void makeDeposit(Integer deposit){
        balance += deposit;
    }
    
    //Declare a method named getBalance that returns an Integer and no input parameter
    public Integer getBalance(){
        //return the balance attribute
        return balance;
    }
}