package  {
	
	import flash.events.Event; 
	import flash.events.ErrorEvent; 
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent; 
	import flash.net.URLLoader; 
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest; 
	import flash.net.URLRequestMethod;
	import flash.net.URLRequestHeader;
	import flash.net.URLVariables; 
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.system.LoaderContext;
	import flash.events.HTTPStatusEvent;
	import Network;
	import flash.system.LoaderContext;
	import flash.events.FullScreenEvent;
	
	public class RestCaller {
		
		static const REST = "http://come-on-ooparts.herokuapp.com/"
		
		public function RestCaller() {
			
		}
		public static function attachRestAndSession(url:String){
			if(Network.session_token != null){
				return REST+url+"?session_token="+Network.session_token
			}
			return REST+url
		}
		
		public static function callWithBody(url:String, body = null, method:String = URLRequestMethod.POST, success:Function = null, fail:Function = null,data_type:String = URLLoaderDataFormat.TEXT){
			
			var request:URLRequest = new URLRequest(attachRestAndSession(url)); 
			//var request:URLRequest = new URLRequest( "http://localhost:5000/"+suffix); 
			request.method = URLRequestMethod.POST;
			request.requestHeaders.push(new URLRequestHeader("pragma", "no-cache"));
			request.requestHeaders.push(new URLRequestHeader("Expires", "Thu, 01 Jan 1970 00:00:00 GMT, -1"));
			request.requestHeaders.push(new URLRequestHeader("Cache-Control", "no-cache, no-store, must-revalidate"));
			request.requestHeaders.push(new URLRequestHeader("X-HTTP-Method-Override", method))
			
			
			
			//trace('rest call : '+url);
			
			if(body is URLVariables){
				request.contentType = "application/json"
				body.format = "rest";
				request.data = JSON.stringify(body)
			}
			else{
				request.data = body;
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
			loader.addEventListener( Event.COMPLETE, httpRequestComplete, false, 0, true); 
			loader.addEventListener( IOErrorEvent.IO_ERROR, httpRequestError,false, 0, true); 
			loader.addEventListener( SecurityErrorEvent.SECURITY_ERROR, httpRequestError, false,  0, true); 
//			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function(e:HTTPStatusEvent){trace("HTTPSTATUSEVENT",e,(URLLoader)(e.target).data)}, 0, true);
			loader.load( request ); 

		}
		
		public static function call(url:String, method:String = URLRequestMethod.POST, success:Function = null, fail:Function = null,data_type:String = URLLoaderDataFormat.TEXT):void 
		{
			callWithBody(url,null,method,success,fail,data_type);
		}
		
		
		
		
		public static function loadImage(url:String){
			var loader:Loader = new Loader();
			loader.load(new URLRequest(REST+url));
			return loader
		}
		
		public static function uploadImage(success:Function = null){
			var url:String = attachRestAndSession('files/upload');
			
		}
	}
	
	
	
}
