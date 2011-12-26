package  event{
	import flash.events.Event;
	import widget.*;
	
	public class DragCompleteEvent extends Event{

		public static const DRAG_COMPLETE_EVENT:String = "drag_complete_event";
		
		public var dragX:Number;
		public var dragY:Number;
		
		public var dragItem:PopupFriendItem;
		
		public function DragCompleteEvent(type:String) {
			// constructor code
			super(type);
		}

	}
	
}
