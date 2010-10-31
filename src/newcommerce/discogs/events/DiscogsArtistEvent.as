package newcommerce.discogs.events 
{
	import flash.events.Event;
	import newcommerce.discogs.data.DCArtistData;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DiscogsArtistEvent extends Event
	{
		public static const ARTIST_INFO_RECEIVED:String = "artist_info_received";
		
		protected var _artist:DCArtistData;
		protected var _requestId:Number = -1;
		
		public function get artist():DCArtistData { return _artist; }
		public function get requestId():Number { return _requestId; }
		
		public function DiscogsArtistEvent(type:String, artist:DCArtistData, requestId:Number) 
		{
			super(type);
			_artist = artist;
			_requestId = requestId;
		}
	}
}