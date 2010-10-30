package newcommerce.discogs 
{
	import flash.events.Event;
	import newcommerce.discogs.data.DCArtistData;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DiscogsReleaseEvent extends Event
	{
		public static const RELEASES_RECEIVED:String = "release_received";
		
		protected var _artist:DCArtistData;
		
		public function get artist():DCArtistData { return _artist; }
		
		public function DiscogsReleaseEvent(type:String, artist:DCArtistData) 
		{
			super(type);
			_artist = artist;
			
		}
	}
}