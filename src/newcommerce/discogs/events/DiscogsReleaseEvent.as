package newcommerce.discogs.events 
{
	import flash.events.Event;
	import newcommerce.discogs.data.DCReleaseData;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DiscogsReleaseEvent extends Event
	{
		public static const RELEASE_RECEIVED:String = "release_received";
		
		protected var _release:DCReleaseData;
		protected var _requestId:Number = -1;
		
		public function get release():DCReleaseData { return _release; }
		public function get requestId():Number { return _requestId; }
		
		public function DiscogsReleaseEvent(type:String, release:DCReleaseData, requestId:Number)
		{
			super(type);
			_release = release;
			_requestId = requestId;
		}
	}

}