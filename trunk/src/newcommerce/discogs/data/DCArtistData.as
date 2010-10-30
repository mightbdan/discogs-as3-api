package newcommerce.discogs.data 
{
	import newcommerce.discogs.feeds.DCImageFeed;
	import newcommerce.discogs.feeds.DCReleaseFeed;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCArtistData 
	{
		protected var _urls:Array;
		protected var _name:String;
		protected var _members:Array;
		protected var _images:DCImageFeed;
		protected var _releases:DCReleaseFeed;
		
		public function DCArtistData(name:String = "", members:Array = null, urls:Array = null, images:DCImageFeed = null, releases:DCReleaseFeed = null) 
		{
			_name = name;
			_members = members;
			_urls = urls;
			_images = images;
			_releases = releases;
		}
		
		public function get urls():Array { return _urls; }		
		public function set urls(value:Array):void { _urls = value; }
		
		public function get name():String { return _name; }
		public function set name(value:String):void { _name = value; }
		
		public function get members():Array { return _members; }
		public function set members(value:Array):void {	_members = value; }
		
		public function get images():DCImageFeed { return _images; }
		public function set images(value:DCImageFeed):void { _images = value; }
		
		public function get releases():DCReleaseFeed { return _releases; }
		public function set releases(value:DCReleaseFeed):void { _releases = value; }
		
		public static function fromXML(xml:*):DCArtistData
		{
			var data:DCArtistData = new DCArtistData();
			var urlArr:Array = [];
			for (var i:Number = 0; i < xml.urls.url.length(); i++)
			{
				urlArr.push(xml.urls.url[i].text());
			}
			
			data.urls = urlArr;
			
			var memberArr:Array = [];
			for (i = 0; i < xml.members.name.length(); i++)
			{
				memberArr.push(xml.members.name[i].text());
			}
			
			data.images = new DCImageFeed(xml.images);
			data.releases = new DCReleaseFeed(xml.releases);
			
			return data;
		}
	}
	
}