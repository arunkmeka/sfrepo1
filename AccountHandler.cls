public class AccountHandler {
    public static Account insertNewAccount(string acc)
 {
     try
     {
         Account acnt = new Account();
         acnt.name = acc;
         insert acnt;
         return acnt;
         //test changes
    }
     
     catch(dmlException e)
     {
         system.debug('Unable to create the account and the exception details:  ' +e.getMessage());
         return null;
     }
    finally
     {
       //return acnt;  
     }
 }
}