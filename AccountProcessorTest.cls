@isTest
public class AccountProcessorTest {
  @isTest static void getContactsnum()
  {
      List<Id> accIdslist = new List<Id>();
      Id AccountId1 = createTestRecord(10);
      Id AccountId2 = createTestRecord(20);
      accIdslist.add(AccountId1);
      accIdslist.add(AccountId2);
      Test.startTest();
      Accountprocessor.countContacts(accIdslist);
      Test.stopTest();
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