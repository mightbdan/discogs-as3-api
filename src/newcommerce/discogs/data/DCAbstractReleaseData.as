package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCAbstractReleaseData 
	{
		protected var _id:Number;
		protected var _role:String;
		protected var _title:String;
		protected var _year:Number;
		protected var _thumb:String;
		
		public function DCAbstractReleaseData(id:Number = -1, role:String = "", title:String = "", year:Number = -1, thumb:String = "") 
		{
			_id = id;
			_role = role;
			_title = title;
			_year = year;
			_thumb = thumb;
		}
		
		public function get year():Number { return _year; }
		public function set year(value:Number):void { _year = value; }

		public function get title():String { return _title; }
		public function set title(value:String):void { _title = value; }
		
		public function get role():String { return _role; } 	
		public function set role(value:String):void { _role = value; }
		
		public function get id():Number { return _id; }
		public function set id(value:Number):void { _id = value; }
		
		public function get thumb():String { return _thumb; }
		public function set thumb(value:String):void { _thumb = value; }
	}
}