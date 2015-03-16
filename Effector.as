package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import BlurEffector;
	public class Effector {
		
		static private var root:MovieClip;
		public function Effector() {
			
		}
		
		static public function setRoot(_root:MovieClip){
			root = _root
			BlurEffector.setRoot(_root);
			ColorEffector.setRoot(_root);
			root.addEventListener(Event.ENTER_FRAME,ef)
		}
		static public function BlurEffect(next:Function = null){
			BlurEffector.BlurEffect(next);
		}
		static public function BlurOn(){
			BlurEffector.BlurOn()
		}
		static public function BlurOff(){
			BlurEffector.BlurOff()
		}

		static public function WarnEffect(){
			ColorEffector.WarnEffect()
		}

		static public function ef(e:Event){
			MovieClip(root).filters = [BlurEffector.getFilter()].concat(ColorEffector.getFilter())
		}

	}
	
}
