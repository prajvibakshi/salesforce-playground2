trigger HelloWorldTrigger on Account (before insert) {
    
    System.debug('---Trigger executed before before Account insertion---');

}