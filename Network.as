package {
	import flash.net.URLVariables
	import flash.net.URLRequestMethod
	import RestCaller;
	import Member;
	
	public class Network {
		
		static public var session_token:String;
		static public var me:Member;

		public function Network() {
			// constructor code
		}
		
		public static function login(name:String,password:String,success:Function,fail:Function)
		{
			var body:URLVariables = new URLVariables();
			trace(body)
			body.name = name
			body.password = password
			
			RestCaller.callWithBody('auth/session',body,URLRequestMethod.POST,
			function(param){
				var data = JSON.parse(param);
				trace(JSON.stringify(data))
				me = new Member(data.you);
				session_token = data.session_token
				if(data.first_connection){
					Effector.MovieEffect(new MovieEffect_first_connection());

				}
				success()
			},
			function(){
				fail()
			});
		}
		public static function logout(){
			me = null;
			session_token = null;
			AutoLogin.removePass();
		}

	}
	
}
