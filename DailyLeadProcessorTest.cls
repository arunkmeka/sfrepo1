@isTest
public class DailyLeadProcessorTest {
 public static string cron_exp = '0 0 1 * * ?';
    @isTest static void testleadjob()
    {
        List<Lead> ldlist = new List<Lead>();
        for(integer i=0;i<200;i++)
        {
            Lead l = new Lead(LastName ='Leadsch '+i , Company ='test company');
            ldlist.add(l);
        }
        insert ldlist;
        
        Map<Id,Lead> leadMap = new Map<Id,Lead> (ldlist);
        List<Id> ldIds = new List<Id>(leadMap.keyset());
        test.startTest();
        string jobId = system.schedule('ScheduledApexTest', cron_exp, new DailyLeadProcessor());	
        List<Lead> lt = [SELECT Id FROM Lead WHERE leadSource = null and Id IN :ldIds];
        System.assertEquals(200, lt.size(), 'Lead Count not 200 before executing');
        test.stopTest();
        
        lt = [SELECT Id FROM Lead WHERE leadSource = null and Id IN :ldIds];
        System.assertEquals(0, lt.size(),'Leads not updated');
        
        
    }
}