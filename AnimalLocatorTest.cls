@isTest
public class AnimalLocatorTest {
   @isTest static void testAnimalLocator()
   {
       Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
       string response = AnimalLocator.getAnimalNameById(2);
       system.assertEquals('chicken', response);
   }
    
}