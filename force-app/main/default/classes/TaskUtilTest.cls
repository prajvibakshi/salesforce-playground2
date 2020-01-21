@isTest

private class TaskUtilTest {
    @isTest static void testTaskNormalPriority(){
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    
    @isTest static void testTaskHighPriority(){
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    
    @isTest static void testTaskPriorityNegativeNullValue(){
        String pri = TaskUtil.getTaskPriority('');
        System.assertEquals(null, pri, 'Value cannot be null.');    
    }
    
    @isTest static void testTaskPriorityStringLength(){
        String pri = TaskUtil.getTaskPriority('Blablabla');
        System.assertEquals(null, pri, 'State Name cannot be greater than 2 characters.');
    }

}