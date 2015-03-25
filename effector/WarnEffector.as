package effector {
	import effector.ColorEffector
	import flash.filters.GlowFilter;
	
	public class WarnEffector extends ColorEffector{
		public override function getFilter(){
			var V:Number = 1 - minus;
			return [new GlowFilter(0xcc0000,1,64,64,3*minus,3,true)];
		}
	}
	
}
