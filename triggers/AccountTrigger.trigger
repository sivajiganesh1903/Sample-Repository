trigger AccountTrigger on Account (before insert, before update) {
    AccountHandler.accountUpadtion(trigger.new);
}