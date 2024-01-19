public class UserStoryHandler {
    public static void storyStatus(List<copado__User_Story__c> usrData){
        List<copado__User_Story__c> storyData = [SELECT Id, copado__Status__c, copado__Promote_and_Deploy__c,
                   								 copado__Org_Credential__c, copado__Environment__c FROM 
                                                 copado__User_Story__c WHERE Id IN :usrData];
        copado__Environment__c envDev1 = [SELECT Id, Name FROM copado__Environment__c WHERE Name = 'Dev1'];
        System.debug(envDev1.Id);
        for(copado__User_Story__c us : storyData){
            if(us.copado__Environment__c == envDev1.Id && us.copado__Status__c == 'QA Approved'){
                us.copado__Promote_and_Deploy__c = true;
            }
        }
    }
    
   /* public static void storyTask(List<copado__User_Story__c> usrData){
        List<copado__User_Story__c> storyData = [SELECT Id, copado__Status__c, copado__Promote_and_Deploy__c,
                                                 copado__Org_Credential__r.Name, (SELECT Id, Environment__c FROM Tasks) 
                                                 FROM copado__User_Story__c WHERE Id IN :usrData];
        for (copado__User_Story__c us : storyData) {
            if (us.copado__Org_Credential__r.Name != NULL) {
                for (Task t : us.Tasks) {
                    t.Environment__c = us.copado__Org_Credential__r.Name;
                }
            }
        }
    }  */
}