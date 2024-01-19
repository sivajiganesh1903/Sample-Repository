@isTest
public class AccountTestCalss {
    @isTest
    public static void accountTest(){
        // Your original test code here

        // Add a System.runAs() block to run the test as a system administrator
        System.runAs(new User(Id = UserInfo.getUserId())) {
            Account acc = new Account();
            acc.Name = 'Sample Account1';
            acc.AnnualRevenue = 12900000;
            insert acc;

            Account ac = new Account();
            ac.Name = 'Sample Account2';
            ac.AnnualRevenue = 12000;
            insert ac;

            if(acc.AnnualRevenue > 1000000){
                acc.Description = acc.Name + ' is Premium Customer';
            } else{
                acc.Description = acc.Description = acc.Name + ' is Normal Customer';
            }

            List<Account> accData = [SELECT Id, Name, AnnualRevenue, Description FROM Account];
            
            System.assertEquals('Sample Account1 is Premium Customer', accData[0].Description, 'Record Passed');
            System.assertEquals('Sample Account2 is Normal Customer', accData[1].Description, 'Record Passed');
        }
    }
}