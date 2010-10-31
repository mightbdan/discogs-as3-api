package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCTrackData
	{
		protected var _duration:Number;
		protected var _title:String;
		protected var _position:String;

		public function get duration():Number { return _duration; }
		public function set duration(value:Number):void { _duration = value; }
		
		public function get title():String { return _title; }
		public function set title(value:String):void { _title = value; }
		
		public function get position():String { return _position; }
		public function set position(value:String):void { _position = value; }
		
		public static function fromXML(xml:XML):DCTrackData
		{
			var data:DCTrackData = new DCTrackData();
			
			// get duration
			var durationExp:RegExp = /^([0-9]*):([0-9]+)$/;
			var res:Object = durationExp.exec(xml.duration.toString());
			if (isNaN(res[1]))
				res[1] = 0;
			if (isNaN(res[2]))
				res[2] = 0;
				
			data.duration = res[1] * 60 + res[2];
			
			data.position = xml.position.toString();
			data.title = xml.title.toString();
			
			return data;
		}
	}
}