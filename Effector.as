package  {
	import flash.events.Event;
	import flash.display.MovieClip;
	import effector.BlurEffector;
	import effector.SuccessEffector;
	import effector.WarnEffector;
	public class Effector {
		
		static private var root:MovieClip;
		static private var warnEffector:WarnEffector = new WarnEffector()
		static private var successEffector:SuccessEffector = new SuccessEffector()
		
		public function Effector() {
			
		}
		static public function setRoot(_root:MovieClip){
			root = _root
			BlurEffector.setRoot(_root);
			warnEffector.setRoot(_root);
			successEffector.setRoot(_root);
			root.addEventListener(Event.ENTER_FRAME,ef)
		}
		static public function MovieEffect(movie:MovieClip)
		{
			root.addChild(movie);
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
			warnEffector.go()
		}
		static public function SuccessEffect(){
			successEffector.go()
		}

		static public function ef(e:Event){
			MovieClip(root).filters = [BlurEffector.getFilter()].concat(successEffector.getFilter()).concat(warnEffector.getFilter())
		}


	}
	
}
