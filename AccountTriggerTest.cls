@isTest
public class AccountTriggerTest {
   @isTest static void testsetupdate()
   {
       List<Account> accntlist = new List<Account>();
       for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i,BillingState='CA',BillingStreet ='123 Chase Rd'+i);
            accntlist.add(acct);
        }              
        // Perform Test
        Test.startTest();
        insert accntlist;                               
        Test.stopTest();
       List<Account> verifyAccts = [SELECT Id,Billingstate,shippingstate FROM Account];
       for(Account a: verifyAccts)
       {
           System.assertEquals(a.BillingState,a.ShippingState); 
       }
         
   }
}