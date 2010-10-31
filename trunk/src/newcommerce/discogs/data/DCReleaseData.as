package newcommerce.discogs.data 
{
	import newcommerce.discogs.feeds.DCArtistFeed;
	import newcommerce.discogs.feeds.DCFormatFeed;
	import newcommerce.discogs.feeds.DCGenreFeed;
	import newcommerce.discogs.feeds.DCImageFeed;
	import newcommerce.discogs.feeds.DCLabelFeed;
	import newcommerce.discogs.feeds.DCStyleFeed;
	import newcommerce.discogs.feeds.DCTrackFeed;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCReleaseData 
	{
		protected var _images:DCImageFeed;
		protected var _artists:DCArtistFeed;
		protected var _labels:DCLabelFeed;
		protected var _formats:DCFormatFeed;
		protected var _styles:DCStyleFeed;
		protected var _genres:DCGenreFeed;
		protected var _country:String;
		protected var _releaseDate:Date;
		protected var _tracks:DCTrackFeed;
		protected var _title:String;
		protected var _id:Number;
		protected var _status:String;
		
		public function get images():DCImageFeed { return _images; }
		public function set images(value:DCImageFeed):void { _images = value; }
		
		public function get labels():DCLabelFeed { return _labels; }
		public function set labels(value:DCLabelFeed):void { _labels = value; }
		
		public function get formats():DCFormatFeed { return _formats; }
		public function set formats(value:DCFormatFeed):void { _formats = value; }
		
		public function get country():String { return _country; }
		public function set country(value:String):void { _country = value; }
		
		public function get releaseDate():Date { return _releaseDate; }
		public function set releaseDate(value:Date):void { _releaseDate = value; }
		
		public function get tracks():DCTrackFeed { return _tracks; }
		public function set tracks(value:DCTrackFeed):void { _tracks = value; }
		
		public function get title():String { return _title; }		
		public function set title(value:String):void { _title = value; }
		
		public function get styles():DCStyleFeed { return _styles; }
		public function set styles(value:DCStyleFeed):void { _styles = value; }
		
		public function get genres():DCGenreFeed { return _genres; }
		public function set genres(value:DCGenreFeed):void { _genres = value; }
		
		public function get artists():DCArtistFeed { return _artists; }
		public function set artists(value:DCArtistFeed):void { _artists = value; }
		
		public function get id():Number { return _id; }
		public function set id(value:Number):void { _id = value; }
		
		public function get status():String { return _status; }
		public function set status(value:String):void { _status = value; }
		
		public static function fromXML(xml:XML):DCReleaseData
		{
			var data:DCReleaseData = new DCReleaseData();
			data.id = xml.@id.toString();
			data.status = xml.@status.toString();
			data.title = xml.title.toString();
			data.artists = new DCArtistFeed(xml.artists[0]);
			data.labels = new DCLabelFeed(xml.labels[0]);
			data.formats = new DCFormatFeed(xml.formats[0]);
			data.genres = new DCGenreFeed(xml.genres[0]);
			data.styles = new DCStyleFeed(xml.styles[0]);
			data.country = xml.country.toString();
			data.images = new DCImageFeed(xml.images[0]);
			
			// set release date!
			var year:int = parseInt(xml.released.toString().substr(0, 4));
			var month:int = parseInt(xml.released.toString().substr(5, 2));
			var day:int = parseInt(xml.released.toString().substr(8, 2));			
			data.releaseDate = new Date(year, month - 1, day);

			data.tracks = new DCTrackFeed(xml.tracklist[0]);
			
			return data;			
		}
	}
}