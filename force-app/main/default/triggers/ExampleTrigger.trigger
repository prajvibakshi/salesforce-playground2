trigger ExampleTrigger on Contact (after insert, after delete) {
    
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        //Call a utility method from another class
        EmailManager.sendMail('prajvi.bakshi@gmail.com', 'Trailhead Trigger Tutorial', recordCount + ' contacts were inserted.');
        
    }
    else if (Trigger.isDelete){
        
    }

}