package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCGenreData;
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCGenreFeed
	{
		protected var _xml:XML;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "genre";
		
		public function DCGenreFeed(xml:XML) 
		{
			if (xml == null)
				xml = new XML("<genres></genres>");
				
			_xml = xml;
			_pointer = 0;
		}
		
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCGenreData
		{
			if (idx >= 0 && idx < count)
				return DCGenreData.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCGenreData
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCGenreData
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCGenreData
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCGenreData
		{
			return getAt(_pointer = count - 1);
		}
	}
}