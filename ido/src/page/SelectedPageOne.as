package page
{
	import widget.*;
	import flash.display.MovieClip;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import com.sina.microblog.events.*;
	import com.adobe.images.JPGEncoder;

	
	public class SelectedPageOne extends BaseSelectedPage {

		private var _friendsPanel:FriendsPanel;
		private var _friendsSelectedPanel:FriendsSelectedPanel;
		
		private var _mb:MicroBlog;
		
		
		
		public function SelectedPageOne(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page1;
		
			//
			_friendsSelectedPanel = new FriendsSelectedPanel(_mainPage.friends);
			_friendsSelectedPanel.x = 145;
			_friendsSelectedPanel.y = 100;
			//_mainPage.childPage.addChild(_friendsSelectedPanel);
			//


			_friendsPanel = new FriendsPanel(_mainPage.friends);
			_friendsPanel.x = 75;
			_friendsPanel.y = 360;
			_friendsPanel.addEventListener(DragCompleteEvent.DRAG_COMPLETE_EVENT,dragComplete)
			_mainPage.childPage.addChild(_friendsPanel);
					//

			//
			if (_mainPage.friends.length > 0){
				_mainPage.childPage.mcToPageThree.addEventListener(MouseEvent.CLICK,nextPage);
				_mainPage.childPage.btnl.addEventListener(MouseEvent.CLICK,leftPage);
				_mainPage.childPage.btnr.addEventListener(MouseEvent.CLICK,rightPage);			
			}

			//
			
		}
		
		private function nextPage(e:MouseEvent):void
		{
			//trace("========nextPage=========================");
			_mainPage.selectedFriends = _friendsSelectedPanel.friendsSelected;
			//updateBlogWithImage();
			_mainPage.changePage(2);
			
		}
		
		
		private function leftPage(e:MouseEvent):void
		{
			//trace("========leftPage=========================");
			_friendsPanel.prevPage(e);
			
		}
		
		
		private function rightPage(e:MouseEvent):void
		{
			//trace("========rightPage=========================");
			_friendsPanel.nextPage(e);
		}		
		
		
		private function updateBlogWithImage():void
		{
			var obj:Object = new Object();
			obj.status ="Hello";
			//obj.pic = 
			

			var bmd:BitmapData=new BitmapData(_mainPage.width,_mainPage.height,false,0xff000000);
			bmd.draw(_mainPage);
			
			
			var bmp:Bitmap=new Bitmap(bmd);
			
			var jpgEncode:JPGEncoder = new JPGEncoder();
			//obj.pic = jpgEncode.encode(bmd);

			
			
			_mb.addEventListener("updateBlogWithImageResultEvent", onUpdateBlogWithImage);
			_mb.addEventListener("updateBlogWithImageErrorEvent", onUpdateBlogWithImageError);
			_mb.callWeiboAPI("2/statuses/update ",obj, "GET", "updateBlogWithImageResultEvent", "updateBlogWithImageErrorEvent");
			
			
		}


		//成功调用API，事件名称是你自定义的字符串，而最终结果e.result的结构按照线上文档对应。
		private function onUpdateBlogWithImage(e:MicroBlogEvent):void 
		{
			trace(e.target.data);
			_mb.removeEventListener("updateBlogWithImageResultEvent", onUpdateBlogWithImage);


		}
		private function onUpdateBlogWithImageError(e:MicroBlogErrorEvent):void
		{
			trace(e.message);
		}

		
		
		private  function dragComplete(e:DragCompleteEvent):void
		{


			//_friendsSelectedPanel.dragHandler(e.dragItem);
				
			
		}	
		

	}
	
}
