package  {
	
	public class BlurEffector {
		static private var root:MovieClip;
		static private var filter_force:int = 0;
		static private var status:String = "before_change"
		static private var waiting:Boolean = false

		
		static public function setRoot(_root:MovieClip){
			root = _root
		}
		
		static public function BlurEffect(){
			status = "before_change"
			root.addEventListener(Event.ENTER_FRAME,ef);
		}
		
		static public function BlurOn(){
			waiting = true;
			status = "before_change"
			root.addEventListener(Event.ENTER_FRAME,ef);
		}
		static public function BlurOff(){
			status = "after_change"
		}
		static public function flush(){
			waiting = false;
		}
		static public function ef(){
			if(status == "before_change" && filter_force < 500){
				filter_force+=8;
			}
			else if(status == "after_change" && filter_force > 0){
				filter_force-=8;
			}
			if(filter_force >= 500 && !waiting){
				status = "after_change"
			}
			else if(filter_force <= 0 && status == "after_change"){
				status = "before_change"
				root.removeEventListener(Event.ENTER_FRAME,ef);
			}
		}
		static public function getFilter(){
			return new BlurFilter(filter_force,filter_force,3)
		}

	}
	
}
