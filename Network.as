package {
	import RestCaller;
	
	public class Network {
		
		static public String session;
		

		public function Network() {
			// constructor code
		}
		
		public static function login(name:String,password:String)
		{
			RestCaller.call('auth/session',
		}
		private static function login_success(

	}
	
}
