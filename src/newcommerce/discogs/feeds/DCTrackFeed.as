package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCTrackData;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCTrackFeed 
	{
		protected var _xml:XML;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "track";
		
		public function DCTrackFeed(xml:XML) 
		{
			if (xml == null)
				xml = new XML("<tracks></tracks>");
				
			_xml = xml;
			_pointer = 0;
		}
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCTrackData
		{
			if (idx >= 0 && idx < count)
				return DCTrackData.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCTrackData
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCTrackData
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCTrackData
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCTrackData
		{
			return getAt(_pointer = count - 1);
		}		
		
		
	}
	
}