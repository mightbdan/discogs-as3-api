package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCReleaseSummary;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCReleaseFeed 
	{
		protected var _xml:*;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "release";
		
		public function DCReleaseFeed(xml:*) 
		{
			_xml = xml;
			_pointer = 0;
		}
		
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCReleaseSummary
		{
			if (idx >= 0 && idx < count)
				return DCReleaseSummary.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCReleaseSummary
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCReleaseSummary
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCReleaseSummary
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCReleaseSummary
		{
			return getAt(_pointer = count - 1);
		}
	}
	
}