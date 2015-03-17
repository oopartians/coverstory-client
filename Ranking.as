package  {
	import Member
	import RestCaller
	public class Members {
		static public me:Member;
		static public list:Vector.<Member> = new Vector.<Member>()
		
		
		static public refreshMemberList(){
			RestCaller.call('/member/list',function(params){
				
				
				
				
			});
		}
	}
}
