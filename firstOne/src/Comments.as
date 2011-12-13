package 
{

	public class Comments
	{
		static private var _comments:Array =["饲养了一匹草泥马",
		"买了一本《尔康写真集》",
		"送了一面镜子给芙蓉姐姐" ,
		"送了一部照相机给陈老师",
		"饲养了一只灰太狼",
		"买机票去美国找凤姐相亲",
		"去整容变成了容嬷嬷",
		"买蜘蛛侠套装去拯救地球",
		"养了一池塘的河蟹",
		"种下一个妹子等来年收获",
		"买了生发剂送给葛大爷",
		"买了增高鞋送给郭小明"];


		public function Comments()
		{
			// constructor code
		}
		//create the comments ramdomly
		static public function createComments():String
		{
			var ramdomAry:Array = Util.getRamdonListIndex(5,12);

			var comment:String = "";
			for (var i:int=0; i<5; i++)
			{

				comment +=  ("@" + _comments[ramdomAry[i]]);
			}
			return comment;
		}
		//get comment by id
		static public function getCommentByID(id:int):String
		{

			return _comments[id];
		}
		//get comment by Array
		static public function getCommentByArray(ary:Array):Array
		{

			var commentArray:Array = new Array();
			for (var i:int =0; i<ary.length; i++)
			{
				var idx:int;
				idx = ary[i];
				commentArray[i] = _comments[idx];
			}
			return commentArray;
		}


	}

}