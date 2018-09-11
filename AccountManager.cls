@RestResource(urlMapping='/Accounts/*/Contacts')
global class AccountManager {

     @HttpGet
    global static Account getAccount()
    {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substringBetween('Accounts/', '/Contacts');
        Account acc = [select ID,name,(select ID,name from Contacts) from Account
                       where ID = :accId];
        return acc;

    }
}