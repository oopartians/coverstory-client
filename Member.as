package  {
	public class Member {
		
		public var id:String;
		public var name:String = "익명";
		public var period_number:int = -1;
		public var mentor:Member;
		public var mentees:Vector<Member>;

		public function Member(jsonObject:Object = null) {
			if(jsonObject == null)
				return;
			
			name = jsonObject.name;
			period_number = jsonObject.period_number;
		}

	}
	
}
