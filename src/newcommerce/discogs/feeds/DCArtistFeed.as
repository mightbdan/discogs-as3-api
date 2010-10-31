package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCArtistSummary;
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCArtistFeed
	{
		public var _xml:XML;
		public var _pointer:Number = 0;
		public var _nodeName:String = "artist";
		
		public function DCArtistFeed(xml:XML) 
		{
			if (xml == null)
				xml = new XML("<artists></artists>");
				
			_xml = xml;
			_pointer = 0;
		}

		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCArtistSummary
		{
			if (idx >= 0 && idx < count)
				return DCArtistSummary.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCArtistSummary
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCArtistSummary
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCArtistSummary
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCArtistSummary
		{
			return getAt(_pointer = count - 1);
		}
	}
}