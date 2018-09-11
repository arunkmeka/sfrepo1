public class AccountUtils {
    public static List<Account> accountsByState(string st)
    {
        List<Account> acntlst = [select ID,Name from Account where
                                 BillingState = :st];
        //system.debug(acntlst.size());
        return acntlst;
    }

}