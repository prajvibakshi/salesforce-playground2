public with sharing class BusScheduleCache {

	private Cache.OrgPartition part;

	public BusScheduleCache() {
		this.part = Cache.Org.getPartition('local.BusSchedule');
	}

	public void putSchedule(String busLine, Time[] schedule){
		if(part != null){
			part.put('busLine',schedule);
		}
	}

	public Time[] getSchedule(String busLine){

		Time[] schedule = (Time[])part.get(busLine);

		if(schedule!=null){
			return schedule;
		} else {
			return new List<Time>{Time.newInstance(8,0,0,0), Time.newInstance(17,0,0,0)};
		}
	}
}