trigger RestrictContactByName on Contact (before insert, before update) {
    
    //check contacts prior to insertion or updation for invalid data
    for (Contact c : Trigger.New){
        if(c.LastName == 'INVALIDNAME'){ //invalidname is invalid
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }
    }

}