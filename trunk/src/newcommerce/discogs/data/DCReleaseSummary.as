package newcommerce.discogs.data 
{
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCReleaseSummary
	{
		protected var _id:Number;
		protected var _status:String;
		protected var _type:String;
		protected var _title:String;
		protected var _format:String;
		protected var _label:String;
		protected var _year:Number;
		
		public function DCReleaseSummary(id:Number = -1, title:String = "", format:String = "", label:String = "", year:Number = -1, type:String = "", status:String = "")
		{
			_id = id;
			_title = title;
			_type = type;
			_status = status;
			_format = format;
			_label = label;
			_year = year;
		}
		
		public function get year():Number { return _year; }
		public function set year(value:Number):void { _year = value; }
		
		public function get label():String { return _label; }
		public function set label(value:String):void { _label = value; }
		
		public function get format():String { return _format; }	
		public function set format(value:String):void { _format = value; }
		
		public function get title():String { return _title; }
		public function set title(value:String):void { _title = value; }
		
		public function get type():String { return _type; } 	
		public function set type(value:String):void { _type = value; }
		
		public function get status():String { return _status; }	
		public function set status(value:String):void { _status = value; }
		
		public function get id():Number { return _id; }
		public function set id(value:Number):void { _id = value; }
		
		public static function fromXML(xml:*):DCReleaseSummary
		{
			var data:DCReleaseSummary = new DCReleaseSummary();
			data.id = parseInt(xml.attribute("id"));
			data.status = xml.attribute("status");
			data.type = xml.attribute("type");
			
			data.title = xml.title;
			data.format = xml.format;
			data.label = xml.label;
			data.year = parseInt(xml.year);
			
			return data;
		}
	}
}