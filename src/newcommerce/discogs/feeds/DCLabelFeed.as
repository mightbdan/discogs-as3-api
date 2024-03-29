﻿package newcommerce.discogs.feeds 
{
	import newcommerce.discogs.data.DCLabelSummary;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DCLabelFeed 
	{
		protected var _xml:XML;
		protected var _pointer:Number = 0;
		protected var _nodeName:String = "label";
		
		public function DCLabelFeed(xml:XML) 
		{
			if (xml == null)
				xml = new XML("<labels></labels>");
				
			_xml = xml;
			_pointer = 0;
		}
		
		public function get count():Number
		{
			return _xml.child(_nodeName).length();
		}
		
		public function getAt(idx:Number):DCLabelSummary
		{
			if (idx >= 0 && idx < count)
				return DCLabelSummary.fromXML(_xml.child(_nodeName)[idx]);
			else
			{
				return null;
			}
		}
		
		public function first():DCLabelSummary
		{
			return getAt(_pointer = 0);
		}
		
		public function next():DCLabelSummary
		{
			if (_pointer < count)
				return getAt(_pointer++);
			else
			{
				_pointer = 0;
				return null;
			}
		}
		
		public function previous():DCLabelSummary
		{
			if (_pointer >= 0)
				return getAt(_pointer--);
			else
			{
				_pointer = count - 1;
				return null;
			}
		}
		
		public function last():DCLabelSummary
		{
			return getAt(_pointer = count - 1);
		}
		
	}
	
}