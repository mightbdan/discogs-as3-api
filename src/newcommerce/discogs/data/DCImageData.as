package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	
	public class DCImageData 
	{
		protected var _url:String;
		protected var _width:Number;
		protected var _height:Number;
		protected var _tnUrl:String;
		protected var _type:String;
		
		public function DCImageData(url:String = "", type:String = "", width:Number = 0, height:Number = 0, tnUrl:String = "") 
		{
			_url = url;
			_type = type;
			_height = height;
			_width = width;
			_tnUrl = tnUrl;
			_type = type;
		}
		
		public function get url():String { return _url; }		
		public function set url(value:String):void { _url = value; }
		
		public function get width():Number { return _width; }		
		public function set width(value:Number):void { _width = value; }
		
		public function get height():Number { return _height; }
		public function set height(value:Number):void { _height = value; }
		
		public function get tnUrl():String { return _tnUrl; }
		public function set tnUrl(value:String):void { _tnUrl = value; }
		
		public function get type():String { return _type; }
		public function set type(value:String):void { _type = value; }
		
		public static function fromXML(xml:*):DCImageData
		{
			var data:DCImageData = new DCImageData();
			data.url = xml.attribute("uri");
			data.type = xml.attribute("type");
			data.height = parseInt(xml.attribute("height"));
			data.width = parseInt(xml.attribute("width"));
			data.tnUrl = xml.attribute("uri150");
			
			return data;
		}
	}
}