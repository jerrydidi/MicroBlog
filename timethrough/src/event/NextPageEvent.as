
package  event{
	import flash.events.Event;
	import widget.*;
	
	public class NextPageEvent extends Event{

		public static const NEXT_PAGE_EVENT:String = "NEXT_PAGE_EVENT";
		

		
		public function NextPageEvent(type:String,bubbled:Boolean = false) {
			// constructor code
			super(type,bubbled);
		}

	}
	
}
