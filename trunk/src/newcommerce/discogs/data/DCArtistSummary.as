package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCArtistSummary
	{
		protected var _name:String;
		
		public function get name():String { return _name; }		
		public function set name(value:String):void { _name = value; }		
		
		public static function fromXML(xml:XML):DCArtistSummary
		{
			var data:DCArtistSummary = new DCArtistSummary();
			data.name = xml.text();
			return data;
		}
	}
}