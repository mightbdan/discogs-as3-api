package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCFormatData
	{
		protected var _descriptions:Array;
		protected var _name:String;
		protected var _qty:Number;
		
		public function get qty():Number { return _qty; }		
		public function set qty(value:Number):void { _qty = value; }
		
		public function get name():String { return _name; }
		public function set name(value:String):void { _name = value; }
		
		public function get descriptions():Array { return _descriptions; }
		public function set descriptions(value:Array):void { _descriptions = value; }
		
		public static function fromXML(xml:XML):DCFormatData
		{
			var data:DCFormatData = new DCFormatData();
			data.name = xml.@name.toString();
			data.qty = parseInt(xml.@qty.toString());
			
			var description:XML;
			data.descriptions = [];
			for each(description in xml.descriptions)
			{
				data.descriptions.push(description.toString());
			}
			
			return data;
		}
	}
}