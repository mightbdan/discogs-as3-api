package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCFormatData;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCFormatFeed 
	{
		protected var _xml:XML;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "format";
		
		public function DCFormatFeed(xml:XML) 
		{
			if (xml == null)
				xml = new XML("<format></format>");
				
			_xml = xml;
			_pointer = 0;
		}

		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCFormatData
		{
			if (idx >= 0 && idx < count)
				return DCFormatData.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCFormatData
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCFormatData
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCFormatData
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCFormatData
		{
			return getAt(_pointer = count - 1);
		}
	}
}