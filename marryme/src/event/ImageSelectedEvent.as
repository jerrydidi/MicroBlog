
package  event{
	import flash.events.Event;
	import widget.*;
	
	public class ImageSelectedEvent extends Event{

		public static const IMAGE_SELECTED_EVENT:String = "IMAGE_SELECTED_EVENT";
		

		
		public function ImageSelectedEvent(type:String,bubbled:Boolean = false) {
			// constructor code
			super(type,bubbled);
		}

	}

}