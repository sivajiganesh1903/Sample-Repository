trigger UserStoryTrigger on copado__User_Story__c (before update) {
    UserStoryHandler.storyStatus(trigger.new);
}