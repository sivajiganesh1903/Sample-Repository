/**
 * @description Account Related Methods are Here...
 */
public class AccountHandler {
    /**
     * @description Description Field Updation based on Annual Revenue.
     * @param accData List of Account objects for which the description field will be updated.
     */
    public static void accountUpadtion(List<Account>accData){
        if(accData.size() > 0){
            for(Account acc : accData){
                if(acc.AnnualRevenue > Decimal.valueOf(label.Account_Annual_Revenue)){
                    acc.Description = acc.Name + ' is Premium Customer';
                }else{
                    acc.Description = acc.Name + ' is Normal Customer';
                }
            }
        }
    }
}