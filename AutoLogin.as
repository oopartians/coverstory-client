package  {
	import flash.net.SharedObject
	
	public class AutoLogin {
		
		private static var object:SharedObject = SharedObject.getLocal("come-on-ooparts");

		public static function savePass(name:String,password:String)
		{
			object.data.name = name;
			object.data.password = password;
			object.data.saved = true;
			object.flush();
			
		}
		public static function loadPass()
		{
			if(object.data.saved)
				return object.data;
			else
				return null;
			
		}
		public static function removePass(){
			object.data.name = "";
			object.data.password = "";
			object.data.saved = false;
		}

	}
	
}
