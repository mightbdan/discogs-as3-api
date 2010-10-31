package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCStyleData;
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCStyleFeed
	{
		protected var _xml:XML;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "style";
		
		public function DCStyleFeed(xml:XML) 
		{
			if (xml == null)
				xml = new XML("<styles></styles>");
				
			_xml = xml;
			_pointer = 0;
		}
		
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCStyleData
		{
			if (idx >= 0 && idx < count)
				return DCStyleData.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCStyleData
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCStyleData
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCStyleData
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCStyleData
		{
			return getAt(_pointer = count - 1);
		}
	}
}