public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(string searchstr)
    {
        List<List<sObject>> searchConLeads = [FIND :searchstr IN NAME FIELDS RETURNING 
                                              Contact(FirstName,LastName) , Lead(FirstName,LastName)];
        //system.debug(searchConLeads.size());
        //system.debug(searchConLeads[0].size());
        //system.debug(searchConLeads[1].size());
        return searchConLeads;
    }

}