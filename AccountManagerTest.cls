@isTest(SeeAllData=true)
public class AccountManagerTest {
  @isTest static void getAccountsTest()
  {
      Id AccountId = createTestRecord(600);
      RestRequest req = new RestRequest();
      req.requestURI = 'https://na72.salesforce.com/services/apexrest/Accounts/' + AccountId + '/Contacts';
      req.httpMethod = 'GET';
      RestContext.request = req;
      Account accounttest = AccountManager.getAccount();
      system.assert(accounttest != null);
      system.assertEquals('Test Account from webservice trailhead 600', accounttest.name);
      system.assert(AccountId != null);
  }   
    static Id createTestRecord(integer i) {
        // Create test record
        Account accTest = new Account(Name='Test Account from webservice trailhead '+i);
        insert accTest;
        Contact conTest = new Contact(LastName = 'Test'+i , FirstName = 'Test', AccountID = accTest.Id);
        insert conTest;
        return accTest.Id;
    }          
  }