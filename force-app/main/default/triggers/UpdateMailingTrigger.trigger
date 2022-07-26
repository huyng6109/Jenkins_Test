trigger UpdateMailingTrigger on Account (after update) {
    if (Trigger.isAfter) {
        if (Trigger.isUpdate){
            UpdateMailingAddress.updateMailingAddress(Trigger.oldMap, Trigger.new);
        }
    }
}