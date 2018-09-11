global class DailyLeadProcessor implements schedulable 
{
  global void execute(SchedulableContext ctx)
  {
       List<Lead> ldlist = [select Id, LeadSource from Lead where LeadSource = null LIMIT 200];
      if(!ldlist.isEmpty())
      {
         for(Lead ld: ldlist)
        {
          ld.LeadSource = 'Dreamforce';
         }
          update ldlist;
      }
  }
}