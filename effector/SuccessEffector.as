package effector {
	import effector.ColorEffector
	import flash.filters.GlowFilter;
	
	public class SuccessEffector extends ColorEffector{
		public override function getFilter(){
			var V:Number = 1 - minus;
			return [new GlowFilter(0x00cc00,1,64,64,3*minus,3,true)];
		}
	}
	
}
