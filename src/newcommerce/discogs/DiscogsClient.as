package newcommerce.discogs
{		
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.Responder;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.AsyncErrorEvent;	
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.utils.ByteArray;
	import newcommerce.discogs.data.DCArtistData;
	import newcommerce.discogs.data.DCReleaseData;
	import newcommerce.discogs.events.DiscogsArtistEvent;
	import newcommerce.discogs.events.DiscogsReleaseEvent;

	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DiscogsClient extends EventDispatcher
	{
		private static var _instance:DiscogsClient;
		public static function getInstance():DiscogsClient
		{
			if (_instance == null)
				_instance = new DiscogsClient();

			return _instance;
		}	
		
		public function get proxyUrl():String { return _proxyUrl; }		
		public function set proxyUrl(value:String):void { _proxyUrl = value; }
		
		protected var _conn:NetConnection;		
		protected var _proxyUrl:String = "http://www.martinlegris.com/amf3/gateway.php";
		
		public static var apiKey:String = "e2b01ed60a";
		protected var _baseUrl:String = "http://www.discogs.com/";
		protected var _requestQueue:Array;
		protected var _requestSequence:Number = 0;		
		
		public function DiscogsClient() 
		{
			_requestQueue = [];

			_conn = new NetConnection();
			_conn.addEventListener(AsyncErrorEvent.ASYNC_ERROR, doAsyncError);
			_conn.addEventListener(NetStatusEvent.NET_STATUS, doNetStatus);
			_conn.addEventListener(IOErrorEvent.IO_ERROR, doIOError);
			_conn.addEventListener(SecurityErrorEvent.SECURITY_ERROR, doSecurityError);
			_conn.connect(_proxyUrl);
		}
		
		public function getArtist(artistName:String):Number
		{
			var url:String = _baseUrl;
			url += "artist/" + encodeURI(artistName);
			
			var getVars:Array = ["f=xml",
								 "rand=" + Math.random(),
								 "api_key=" + apiKey];
								 
			var headers:Array = ["Accept-Encoding: gzip"];
			
			var responder:Responder = new Responder(doArtist, doFault);
			var wrapper:Object = getWrapper(responder, "getReleases");

			placeCall(url, wrapper.id, responder, "GET", getVars, null, headers);

			return wrapper.id;
		}
		
		protected function doArtist(result:Object):void
		{			
			var wrapper:Object = getWrapperFromResult(result);
			var xml:XML = new XML(result.content);
			var artist:DCArtistData = DCArtistData.fromXML(xml.artist[0]);
			dispatchEvent(new DiscogsArtistEvent(DiscogsArtistEvent.ARTIST_INFO_RECEIVED, artist, wrapper.id));	
		}
		
		public function getRelease(releaseId:Number):Number
		{
			var url:String = _baseUrl;
			url += "release/" + releaseId;
			
			var getVars:Array = ["f=xml",
			                     "api_key=" + apiKey];
								 
			var headers:Array = ["Accept-Encoding: gzip"];
								
			var responder:Responder = new Responder(doRelease, doFault);
			var wrapper:Object = getWrapper(responder, "getRelease");
			
			placeCall(url, wrapper.id, responder, "GET", getVars, null, headers);
			
			return wrapper.id;
		}
		
		public function doRelease(result:Object):void
		{
			var wrapper:Object = getWrapperFromResult(result);
			var xml:XML = new XML(result.content);
			var release:DCReleaseData = DCReleaseData.fromXML(xml.release[0]);
			dispatchEvent(new DiscogsReleaseEvent(DiscogsReleaseEvent.RELEASE_RECEIVED, release, wrapper.id));
		}
		
		protected function placeCall(url:String, id:Number, responder:Responder, method:String = "GET", getVars:Array = null, postVars:Array = null, headers:Array = null):void
		{
			if (getVars == null)
				getVars = [];
				
			if (postVars == null)
				postVars = [];
				
			if (headers == null)
				headers = [];
				
			//headers.push("Accept-Encoding: gzip");
				
			_conn.call("RESTProxy.request", responder, url, method, getVars, postVars, headers, id);
		}
		
		protected function getWrapper(responder:Responder, type:String):Object
		{
			var wrapper:Object = { };
			wrapper.id = _requestSequence++;
			wrapper.success = false;
			wrapper.type = type;
			wrapper.responder = responder;
			_requestQueue.push(wrapper);
			
			return wrapper;
		}
		
		protected function getWrapperById(requestId:Number):Object
		{
			for (var i:Number = 0; i < _requestQueue.length; i++)
			{
				if (_requestQueue[i].id == requestId)
					return _requestQueue[i];
			}
			
			trace("wrapper with requestId:" + requestId + " not found. Returning null");
			return null;
		}
		
		protected function getWrapperFromResult(result:Object):Object
		{
			var requestId:Number = parseInt(result.requestId);
			return getWrapperById(requestId);
		}
		
		protected function doAsyncError(evt:AsyncErrorEvent):void
		{
			trace("doAsyncError: " + evt.text);
		}
		
		protected function doNetStatus(evt:NetStatusEvent):void
		{
			trace("doNetStatus: " + evt.info);
		}
		
		protected function doIOError(evt:IOErrorEvent):void
		{
			trace("doIOError: " + evt.text);
		}
		
		protected function doSecurityError(evt:SecurityErrorEvent):void
		{
			trace("doSecurityError: " + evt.text);
		}
		
		protected function doFault(fault:Object):void
		{
			trace("doFault:" + fault);
		}
	}
}