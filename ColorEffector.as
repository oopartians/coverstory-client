package  {
	
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	public class ColorEffector {
		static private var root:MovieClip;
		static private var minus_gb:int = 0;
		static private var status:String = "before_change"

		
		static public function setRoot(_root:MovieClip){
			root = _root
		}
		
		static public function WarnEffect(){
			status = "before_change"
			root.addEventListener(Event.ENTER_FRAME,ef);
		}
		
		static public function ef(){
			if(status == "before_change" && minus_gb < 0.6){
				minus_gb+=0.02;
			}
			else if(status == "after_change" && minus_gb > 0.6){
				minus_gb -= 0.02;
			}
			if(minus_gb >= 0.6){
				status = "after_change"
			}
			else if(minus_gb <= 0 && status == "after_change"){
				status = "before_change"
				root.removeEventListener(Event.ENTER_FRAME,ef);
			}
		}
		static public function getFilter(){
			var matrix:Array = new Array();
			var V:Number = 1 - minus_gb;
            matrix = matrix.concat([1, 0, 0, 0, 0]);
            matrix = matrix.concat([0, V, 0, 0, 0]);
            matrix = matrix.concat([0, 0, V, 0, 0]);
            matrix = matrix.concat([0, 0, 0, 1, 0]);
			return new ColorMatrixFilter(matrix)
		}

	}
	
}
