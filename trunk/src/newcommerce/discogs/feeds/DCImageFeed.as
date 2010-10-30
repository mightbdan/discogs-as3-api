package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCImageData;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCImageFeed 
	{
		protected var _xml:*;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "image";
		
		public function DCImageFeed(xml:*) 
		{
			_xml = xml;
			_pointer = 0;
		}
		
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCImageData
		{
			if (idx >= 0 && idx < count)
				return DCImageData.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCImageData
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCImageData
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCImageData
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCImageData
		{
			return getAt(_pointer = count - 1);
		}
	}
	
}