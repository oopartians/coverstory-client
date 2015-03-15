package  {
	import BlurEffector;
	public class Effector {
		
		static private var root:MovieClip;
		public function Effector() {
			
		}
		
		static public function setRoot(_root:MovieClip){
			root = _root
			BlurEffector.setRoot(_root);
		}
		static public function BlurEffect(){
			BlurEffector.BlurEffect();
		}
		static public function BlurOn(){
			BlurEffector.BlurOn()
		}
		static public function BlurOff(){
			BlurEffector.BlurOff()
		}

	}
	
}
