package  {
	public class Member {
		
		public var id:String;
		public var name:String = "익명";
		public var period_number:int = -1;
		public var phone_number:String;
		public var mentor:Member;
		public var mentees:Vector.<Member>;
		public var admin:Boolean;

		public function Member(jsonObject:Object = null) {
			if(jsonObject == null)
				return;
			

			name = jsonObject.name;
			period_number = jsonObject.period_number;
			phone_number = jsonObject.phone_number;
			admin = jsonObject.admin;
		}

	}
	
}
