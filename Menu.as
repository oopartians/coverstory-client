package  {
	import flash.display.MovieClip;
	public class Menu {
		
		static private var accessablePages:Vector.<String> = null;
		static private var root:MovieClip;
		static private var currentPage:String;
		static private var pageChangingListener:Function = null;
		
		static public function setRoot(_root:MovieClip){
			root = _root
		}
		
		static public function getCurrentPage(){
			return currentPage;
		}
		
		static public function changePage(page:String){
			currentPage = page
			root.gotoAndStop(currentPage);
			if(pageChangingListener != null)
				pageChangingListener(currentPage)	
		}
		
		static public function getAccessablePages(){
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
			
		
		
		public function Menu() {
			// constructor code
		}

	}
	
}
