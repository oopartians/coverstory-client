package  {
	
	import flash.events.Event; 
	import flash.events.ErrorEvent; 
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent; 
	import flash.net.URLLoader; 
	import flash.net.URLRequest; 
	import flash.net.URLRequestMethod; 
	import flash.net.URLVariables; 
		
	public class RestCaller {
		
		public function RestCaller() {
			
		}
		
		public static function call(url:String, success:Function = null, fail:Function = null):void 
		{
			var request:URLRequest = new URLRequest( "https://come-on-ooparts.herokuapp.com/"+url ); 
			request.method = URLRequestMethod.GET; 
			 
			var variables:URLVariables = new URLVariables();
			
			request.data = variables;
			
			trace('rest call : '+url);
			var httpRequestComplete:Function = function (e:Event) {
				if(success != null){
					success(((URLLoader)(e.target)).data);
				}
				else{
					trace( 'response : ' + ((URLLoader)(e.target)).data );
				}
			}

			var requestor:URLLoader = new URLLoader(); 
			requestor.addEventListener( Event.COMPLETE, httpRequestComplete ); 
			requestor.addEventListener( IOErrorEvent.IO_ERROR, httpRequestError ); 
			requestor.addEventListener( SecurityErrorEvent.SECURITY_ERROR, httpRequestError ); 
			requestor.load( request ); 
		} 
		
		private static function httpRequestError( error:ErrorEvent ):void{ 
			trace( "error: " + error.toString() );     
		}

	}
	
}
