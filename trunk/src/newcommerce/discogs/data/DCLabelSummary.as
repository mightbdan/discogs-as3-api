package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	
	public class DCLabelSummary
	{
		protected var _name:String;
		protected var _catno:String;
		
		public function get catno():String { return _catno; }
		public function set catno(value:String):void { _catno = value; }
		
		public function get name():String { return _name; }
		public function set name(value:String):void { _name = value; }
		
		public static function fromXML(xml:XML):DCLabelSummary
		{
			var data:DCLabelSummary = new DCLabelSummary();
			data.catno = xml.@catno.toString();
			data.name = xml.@name.toString();
			
			return data;
		}
	}
}