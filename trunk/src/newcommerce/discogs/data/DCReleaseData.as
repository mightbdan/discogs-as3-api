package newcommerce.discogs.data 
{
	import newcommerce.discogs.feeds.DCFormatFeed;
	import newcommerce.discogs.feeds.DCImageFeed;
	import newcommerce.discogs.feeds.DCLabelFeed;
	import newcommerce.discogs.feeds.DCTrackFeed;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCReleaseData 
	{
		protected var _images:DCImageFeed;
		protected var _artists:Array;
		protected var _labels:DCLabelFeed;
		protected var _formats:DCFormatFeed;
		protected var _styles:Array;
		protected var _genres:Array;
		protected var _country:String;
		protected var _releaseDate:Date;
		protected var _tracks:DCTrackFeed;
				
		public function DCReleaseData() 
		{
			
		}
		
		public function get images():DCImageFeed { return _images; }
		public function set images(value:DCImageFeed):void { _images = value; }
		
		public function get artists():Array { return _artists; }
		public function set artists(value:Array):void { _artists = value; }
		
		public function get labels():DCLabelFeed { return _labels; }
		public function set labels(value:DCLabelFeed):void { _labels = value; }
		
		public function get formats():DCFormatFeed { return _formats; }
		public function set formats(value:DCFormatFeed):void { _formats = value; }
		
		public function get styles():Array { return _styles; }
		public function set styles(value:Array):void { _styles = value; }
		
		public function get genres():Array { return _genres; }
		public function set genres(value:Array):void { _genres = value; }
		
		public function get country():String { return _country; }
		public function set country(value:String):void { _country = value; }
		
		public function get releaseDate():Date { return _releaseDate; }
		public function set releaseDate(value:Date):void { _releaseDate = value; }
		
		public function get tracks():DCTrackFeed { return _tracks; }
		public function set tracks(value:DCTrackFeed):void { _tracks = value; }
		
		public static function fromXML(xml:*):DCReleaseData
		{
			
		}
	}
}