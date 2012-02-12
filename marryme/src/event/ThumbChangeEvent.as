package  event{
	import flash.events.Event;
	import widget.*;
	
	public class ThumbChangeEvent extends Event{

		public static const Thumb_Change_Event:String = "Thumb_Change_Event";
		public function ThumbChangeEvent(type:String,bubbled:Boolean = false) {
			// constructor code
			super(type,bubbled);
		}

	}
	
}
