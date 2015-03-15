package {
	import flash.net.URLVariables
	import RestCaller;
	
	public class Network {
		
		static public var session:String;
		

		public function Network() {
			// constructor code
		}
		
		public static function login(name:String,password:String,success:Function,fail:Function)
		{
			var body:URLVariables = new URLVariables();
			body.name = name
			body.password = password
			
			RestCaller.callWithBody('auth/session',body,
			function(param){
				trace(param.session_token)
				success()
			},
			function(){
				fail()
			});
			
		}

	}
	
}
