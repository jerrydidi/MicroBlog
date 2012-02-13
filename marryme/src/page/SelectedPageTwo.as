﻿package page
{
	import widget.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;

	

	public class SelectedPageTwo extends BaseSelectedPage {

		private var _mb:MicroBlog;
		
		//
		private var answer:int = -1;
				//
		public function SelectedPageTwo(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{	
			_mainPage.childPage = _mainPage.page2;
			answer = _mainPage.answer[0];
			checkAnswer();



			_mainPage.childPage.answer1.buttonMode = true;
			_mainPage.childPage.answer1.addEventListener(MouseEvent.CLICK,answer1Click);
			//_mainPage.childPage.answer1.gotoAndStop(2);

			_mainPage.childPage.answer2.buttonMode = true;
			_mainPage.childPage.answer2.addEventListener( MouseEvent.CLICK,answer2Click);

			_mainPage.childPage.answer3.buttonMode = true;
			_mainPage.childPage.answer3.addEventListener( MouseEvent.CLICK,answer3Click);

			_mainPage.childPage.answer4.buttonMode = true;
			_mainPage.childPage.answer4.addEventListener( MouseEvent.CLICK,answer4Click);

			
			_mainPage.childPage.btnPrevPage.addEventListener( MouseEvent.CLICK,prevPage);
						
			_mainPage.childPage.btnNextPage.addEventListener( MouseEvent.CLICK,nextPage);
						
		}
		
		private function prevPage(e:MouseEvent):void
		{
			if(answer != -1)
			{
				_mainPage.changePage(1);
				_mainPage.answer[0] = answer;
			}
			
		}
		
		private function nextPage(e:MouseEvent):void
		{
			if(answer != -1)
			{
				_mainPage.changePage(3);
				_mainPage.answer[0] = answer;
			}
			
		}
		
		private function answer1Click(e:MouseEvent):void
		{
			
			answer =1;
			checkAnswer();
		}

		

		
		private function answer2Click(e:MouseEvent):void
		{
			answer =2;
			checkAnswer();
		}

		
		private function answer3Click(e:MouseEvent):void
		{
			answer =3;
			checkAnswer();
		}

		private function answer4Click(e:MouseEvent):void
		{
			answer =4;
			checkAnswer();
		}

		private function checkAnswer():void
		{

			if(answer == 1)
			{
				_mainPage.childPage.answer1.gotoAndStop(2);
				_mainPage.childPage.answer2.gotoAndStop(1);
				_mainPage.childPage.answer3.gotoAndStop(1);
				_mainPage.childPage.answer4.gotoAndStop(1);
			}
			else  if(answer == 2)
			{
				_mainPage.childPage.answer1.gotoAndStop(1);
				_mainPage.childPage.answer2.gotoAndStop(2);
				_mainPage.childPage.answer3.gotoAndStop(1);
				_mainPage.childPage.answer4.gotoAndStop(1);

				
			}
			else  if(answer == 3)
			{
				_mainPage.childPage.answer1.gotoAndStop(1);
				_mainPage.childPage.answer2.gotoAndStop(1);
				_mainPage.childPage.answer3.gotoAndStop(2);
				_mainPage.childPage.answer4.gotoAndStop(1);

				
			}
			else  if(answer == 4)
			{
				_mainPage.childPage.answer1.gotoAndStop(1);
				_mainPage.childPage.answer2.gotoAndStop(1);
				_mainPage.childPage.answer3.gotoAndStop(1);
				_mainPage.childPage.answer4.gotoAndStop(2);
				
			}
		}
		

	}
}
