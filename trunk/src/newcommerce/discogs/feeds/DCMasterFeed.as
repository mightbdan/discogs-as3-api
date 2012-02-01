package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCMasterData;
	import newcommerce.discogs.data.DCReleaseSummary;
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCMasterFeed 
	{
		protected var _xml:*;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "master";
		
		public function DCMasterFeed(xml:*) 
		{
			if (xml == null)
				xml = new XML("<releases></releases>");
				
			_xml = xml;
			_pointer = 0;
		}
		
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCMasterData
		{
			if (idx >= 0 && idx < count)
				return DCMasterData.fromXML(_xml.child(_nodeName)[idx]);
			else
				return null;
		}
		
		public function first():DCMasterData
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCMasterData
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCMasterData
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count -1;
				return null;
			}
		}
		
		public function last():DCMasterData
		{
			return getAt(_pointer = count - 1);
		}
		
		public function getById(id:Number):DCMasterData
		{
			var lastPointer:Number = _pointer;
			var master:DCMasterData = null;
			first();
			while (master = next())
			{
				if (master.id == id)
					break;
			}
			
			_pointer = lastPointer;
			
			return master;
		}
	}
}