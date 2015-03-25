package effector {
	
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;

	public class ColorEffector {
		protected var minus:Number = 0;
		private var root:MovieClip;
		private var status:String = "before_change"

		
		public function setRoot(_root:MovieClip){
			root = _root
		}
		
		public function go(){
			status = "before_change"
			root.addEventListener(Event.ENTER_FRAME,ef);
		}
		
		public function ef(e:Event){
			if(status == "before_change" && minus < 0.6){
				minus+=0.1;
			}
			else if(status == "after_change" && minus > 0){
				minus -= 0.01;
			}
			if(minus >= 0.6){
				status = "after_change"
			}
			else if(minus <= 0 && status == "after_change"){
				status = "before_change"
				root.removeEventListener(Event.ENTER_FRAME,ef);
			}
		}
		public function getFilter(){
			var V:Number = 1 - minus;
			return [new GlowFilter(0xcc0000,1,64,64,3*minus,3,true)];
		}

	}
	
}
