package  {
	
	import flash.events.Event; 
	import flash.events.ErrorEvent; 
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent; 
	import flash.net.URLLoader; 
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest; 
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables; 
	import flash.events.HTTPStatusEvent;
	import Network;
	
	public class RestCaller {
		
		public function RestCaller() {
			
		}
		
		public static function callWithBody(url:String, body:URLVariables = null, success:Function = null, fail:Function = null){
			
			var suffix:String = url;
			if(Network.session != null){
				suffix.concat("?session_token="+Network.session)
			}
			
			var request:URLRequest = new URLRequest( "http://come-on-ooparts.herokuapp.com/"+suffix); 
			var request:URLRequest = new URLRequest( "http://localhost:5000/"+suffix); 
			request.method = URLRequestMethod.POST;
			
			
			trace('rest call : '+url);
			
			if(body != null){
				request.contentType = "application/json"
				body.format = "rest";
				request.data = JSON.stringify(body)
			}
			
			
			var httpRequestComplete:Function = function (e:Event) {
				if(success != null){
					success(((URLLoader)(e.target)).data);
				}
				else{
					trace( 'response : ' + ((URLLoader)(e.target)).data );
				}
			}
			
			var httpRequestError:Function = function (e:ErrorEvent) {
				if(fail != null){
					fail(e.toString());
				}
				else{
					trace( 'responseERROR : ' + e.toString() );
				}
			}

			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener( Event.COMPLETE, httpRequestComplete ); 
			loader.addEventListener( IOErrorEvent.IO_ERROR, httpRequestError ); 
			loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, httpRequestError ); 
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function(e:HTTPStatusEvent){trace("HTTPSTATUSEVENT",e,(URLLoader)(e.target).data)});
			loader.load( request ); 

		}
		
		public static function call(url:String, success:Function = null, fail:Function = null):void 
		{
			callWithBody(url,null,success,fail);
		} 
		
	}
	
}
