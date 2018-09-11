public class ContactSearch {
    public static list<Contact> searchForContacts(string lname,string mpc)
    {
        list<Contact> contactsls = [select ID,FirstName,LastName from Contact Where 
                                      LastName = :lname AND MailingPostalCode = :mpc];
        //system.debug(contactsls.size());
        return contactsls;
    }
}