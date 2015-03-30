package  {
	public class Member {
		
		public var id:String;
		public var name:String = "익명";
		public var period_number:int = -1;
		public var phone_number:String;
		public var mentor:Member;
		public var mentees:Vector.<Member>;
		public var admin:Boolean;
		public var last_attendance_date_time:Number;
		public var cs_attendance:Number;
		public var cs_attendance_rank:Number;
		public var profile_url:String;

		public function Member(jsonObject:Object = null) {
			if(jsonObject == null)
				return;
			
			id = jsonObject.id;
			name = jsonObject.name;
			period_number = jsonObject.period_number;
			phone_number = jsonObject.phone_number;
			if(jsonObject.last_attendance_date_time == undefined){
				jsonObject.last_attendance_date_time = 0
			}
			if(jsonObject.cs_attendance == undefined){
				jsonObject.cs_attendance = 0
			}
			if(jsonObject.cs_attendance_rank == undefined){
				jsonObject.cs_attendance_rank = 0
			}
			last_attendance_date_time = jsonObject.last_attendance_date_time;
			profile_url = jsonObject.profile_url;
			admin = jsonObject.admin;
			cs_attendance = jsonObject.cs_attendance
			cs_attendance_rank = jsonObject.cs_attendance_rank
		}
		
		public function isEqual(_member:Member){
			return id == _member.id
		}

	}
	
}
