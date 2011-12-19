package  {
	
	public class Util {

		public function Util() {
			// constructor code
		}
		

		//get random friend index
		public static function getRamdonListIndex(returnNum:int,sourceNum):Array
		{

			var ary:Array = new Array();
			var sourceArray:Array = new Array();
			for(var i:int=0;i<sourceNum;i++)
			{
				sourceArray[i] = true;
			}

			var ramNum:int;
			var j:int = 0;
			while (j<returnNum)
			{
				ramNum = Math.round(Math.random() * sourceNum);
				if (sourceArray[ramNum])
				{
					ary.push(ramNum);
					sourceArray[ramNum] = false;
					j++;
				}
			}


			return ary;

		}
		
		//get the link string
		public static function getLinkString(displayName:String,linkAddress:String):String
		{
			
			var templateString:String = "<a href='link_Address' target='_blank'><U><font color ='#0084D6'>display_name</font></U></a>";
			templateString = templateString.replace("link_Address",linkAddress);
			templateString = templateString.replace("display_name",displayName);
			return templateString;
		}
		//get the link string
		public static function getBlogLinkString(displayName:String,linkAddress:String):String
		{
			
			var templateString:String = "<a href='link_Address' target='_blank'><U><font color ='#0084D6'>@display_name</font></U></a>";
			templateString = templateString.replace("link_Address",linkAddress);
			templateString = templateString.replace("display_name",displayName);
			return templateString;
		}

	}
	
}
