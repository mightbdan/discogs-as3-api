package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCGenreData
	{
		protected var _name:String;
		
		public function get name():String { return _name; }
		public function set name(value:String):void { _name = value; }		
		

		public static function fromXML(xml:XML):DCGenreData
		{
			var data:DCGenreData = new DCGenreData();
			data.name = xml.text();
			return data;
		}
	}
}