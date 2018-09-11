public class AccountProcessor {
 @future  public static void countContacts(List<Id> AccountIds)
     {
         List<Account> acclist = [select Id from Account where Id in :AccountIds];
         for(Account a: acclist)
         {
             Integer cnt = [select count() from Contact where AccountId = :a.Id];
             a.Number_of_Contacts__c = cnt ;
         }
         update acclist;
     }
}