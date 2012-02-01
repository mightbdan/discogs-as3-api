package newcommerce.discogs.data 
{
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCReleaseSummary extends DCAbstractReleaseData
	{
		protected var _status:String;
		protected var _format:String;
		protected var _label:String;
	
		public function DCReleaseSummary(id:Number = -1, title:String = "", format:String = "", label:String = "", year:Number = -1, role:String = "", status:String = "", thumb:String = "")
		{
			super(id, role, title, year, thumb);
			
			_status = status;
			_format = format;
			_label = label;
		}
		
		public function get label():String { return _label; }
		public function set label(value:String):void { _label = value; }
		
		public function get format():String { return _format; }	
		public function set format(value:String):void { _format = value; }
		
		public function get status():String { return _status; }	
		public function set status(value:String):void { _status = value; }
		
		public static function fromXML(xml:*):DCReleaseSummary
		{
			var data:DCReleaseSummary = new DCReleaseSummary();
			data.id = parseInt(xml.attribute("id"));
			data.status = xml.attribute("status");
			data.role = xml.attribute("role");
			
			data.title = xml.title;
			data.format = xml.format;
			data.label = xml.label;
			data.year = parseInt(xml.year);
			data.thumb = xml.thumb;
			
			return data;
		}
	}
}