package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.utils.setTimeout;
	import Effector;
	
	public class Menu {
		
		static private var accessablePages:Vector.<String> = null;
		static private var root:MovieClip;
		static private var currentPage:String;
		static private var pageChangingListener:Function = null;
		
		static private var filter_force:int = 0;
		static private var status:String = "before_change"
		static private var waiting:Boolean = false;
		static private var future_page:String = ""
		
		static public function setRoot(_root:MovieClip)
		{
			root = _root
		}
		
		static public function getCurrentPage()
		{
			return currentPage;
		}
		
		static public function changePage(page:String)
		{
			currentPage = page
			root.gotoAndStop(currentPage);
			if(pageChangingListener != null)
				pageChangingListener(currentPage)	
		}

		static public function getAccessablePages()
		{
			return accessablePages
		}

		static public function setPageChangingListener(listener:Function)
		{
			pageChangingListener = listener
		}

		static public function setAccessablePages(pages:Vector.<String>)
		{
			accessablePages = pages
		}
		
		static public function changeScene(page:String,wait:Boolean = false)
		{
			Effector.BlurEffect(function()
			{ 
				root.gotoAndStop(page) 
				if(pageChangingListener != null)
					pageChangingListener(currentPage)

			})
		}
	}
}
