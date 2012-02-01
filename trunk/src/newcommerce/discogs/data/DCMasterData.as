package newcommerce.discogs.data 
{
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCMasterData extends DCAbstractReleaseData
	{
		protected var _mainRelease:Number;
		
		public function DCMasterData(id:Number = -1, mainRelease:Number = -1, role:String = "", title:String = "", year:Number = -1, thumb:String = "") 
		{
			super(id, role, title, year, thumb);
			_mainRelease = mainRelease;
		}
		
		public function get mainRelease():Number { return _mainRelease; }
		public function set mainRelease(value:Number):void { _mainRelease = value; }
	
		public static function fromXML(xml:*):DCMasterData
		{
			var data:DCMasterData = new DCMasterData();
			data.id = parseInt(xml.attribute("id"));
			data.mainRelease = xml.attribute("main_release");
			data.role = xml.attribute("role");
			data.title = xml.title;
			data.year = parseInt(xml.year);
			data.thumb = xml.thumb;
			
			return data;
		}
	}
}