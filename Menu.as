package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.utils.setTimeout;
	
	public class Menu {
		
		static private var accessablePages:Vector.<String> = null;
		static private var root:MovieClip;
		static private var currentPage:String;
		static private var pageChangingListener:Function = null;
		
		static private var filter_force:int = 0;
		static private var status:String = "before_change"
		static private var waiting:Boolean = false;
		static private var future_page:String = ""
		
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
		
		static public function flush(){
			waiting = false
		}
		static public function changeScene(page:String,wait:Boolean = false){
			status = "before_change"
			waiting = wait;
			future_page = page;
			root.addEventListener(Event.ENTER_FRAME,changeSceneEf);
			//gotoAndStop(frame);
		}
		static private function changeSceneEf(e:Event){
			
			MovieClip(root).filters = [new BlurFilter(filter_force,filter_force,3)]
			if(status == "before_change" && filter_force < 500){
				filter_force+=8;
			}
			else if(status == "after_change" && filter_force > 0){
				filter_force-=8;
			}
			if(filter_force > 500 && !waiting){
				realChange()
			}
		}
		static private function realChange(){
			status = "after_change"
			
			currentPage = future_page
			if(pageChangingListener != null)
				pageChangingListener(currentPage)
			root.gotoAndStop(currentPage);
		}

	}
	
}
