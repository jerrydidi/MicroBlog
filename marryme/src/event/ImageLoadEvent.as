package  event{
	import flash.events.Event;
	import widget.*;
	
	public class ImageLoadEvent extends Event{

		public static const IMAGE_LOAD_EVENT:String = "IMAGE_LOAD_EVENT";
		

		
		public function ImageLoadEvent(type:String,bubbled:Boolean = false) {
			// constructor code
			super(type,bubbled);
		}

	}
	
}
