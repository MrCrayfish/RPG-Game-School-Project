package 
{
	import flash.display.BitmapData;

	public class HomeVillage extends Level
	{
		private var level:BitmapData = new Village();

		public function HomeVillage()
		{
			super("village1", new Village());
			this.setExits();
			this.loadObjects();
		}
		
		private function setExits()
		{
			var door_1:ObjectWoodenDoor = new ObjectWoodenDoor();
			door_1.setExit(getStorageHouse(), 4, 6);
			this.setObject(3, 13, door_1);
			
			
			var door_2:ObjectWoodenDoor = new ObjectWoodenDoor();
			door_2.setExit(getInn(), 10, 10);
			this.setObject(25, 11, door_2);
			this.setObject(26, 11, door_2);
			
			var door_3:ObjectWoodenDoor = new ObjectWoodenDoor();
			door_3.setExit(getNormalHouse(), 4, 6);
			this.setObject(9, 13, door_3);
		}
		
		private function getStorageHouse()
		{
			var house:Level = new LevelCommonHouse();
			var door_1:ObjectWoodenDoor = new ObjectWoodenDoor();
			door_1.setExit(this, 3, 14);
			house.setObject(4, 7, door_1);
			house.setObject(1,1,Overlay.bed);
			house.setObject(1,2,Overlay.inivisible);
			house.setObject(7,1,Overlay.bed);
			house.setObject(7,2,Overlay.inivisible);
			house.setObject(2,1,Overlay.crate);
			house.setObject(6,1,Overlay.crate);
			house.setObject(1,4,Overlay.crate_stack);
			house.setObject(2,4,Overlay.inivisible);
			house.setObject(3,4,Overlay.fence);
			house.setObject(3,6,Overlay.fence);
			house.setObject(5,6,Overlay.fence);
			house.setObject(5,4,Overlay.fence);
			return house;
		}
		
		private function getNormalHouse()
		{
			var house:Level = new LevelCommonHouse();
			var door:ObjectWoodenDoor = new ObjectWoodenDoor();
			door.setExit(this, 9, 14);
			house.setObject(4, 7, door);
			return house;
		}
		
		private function getInn()
		{
			var house:Level = new LevelInn();
			var door_1:ObjectWoodenDoor = new ObjectWoodenDoor();
			door_1.setExit(this, 25, 12);
			house.setObject(10, 11, door_1);
			house.setObject(11, 11, door_1);
			return house;
		}

		private function loadObjects()
		{
			this.setObject(14,3,Overlay.fence);
			this.setObject(15,3,Overlay.fence);
			this.setObject(16,3,Overlay.fence);
			this.setObject(17,3,Overlay.fence);
			
			this.setObject(24, 11, Overlay.storeInn);
			this.setObject(8, 13, Overlay.storeBlank);
			this.setObject(2, 13, Overlay.storeGeneral);
			this.setObject(6, 4, Overlay.storeWeapons); 
			
			this.setObject(15, 15, Overlay.well);
			this.setObject(16, 15, Overlay.inivisible);
			this.setObject(16, 16, Overlay.inivisible);
			this.setObject(15, 16, Overlay.inivisible);
			
			this.setObject(14, 5, Overlay.bush_1);
			this.setObject(12, 25, Overlay.bush_1);
			this.setObject(13, 25, Overlay.bush_1);
			this.setObject(14, 25, Overlay.bush_1);
			this.setObject(12, 22, Overlay.bush_1);
			this.setObject(13, 22, Overlay.bush_1);
			this.setObject(14, 22, Overlay.bush_1);
			this.setObject(2, 5, Overlay.flower_1);
			this.setObject(3, 5, Overlay.flower_2);
			this.setObject(4, 5, Overlay.flower_1);
			this.setObject(5, 5, Overlay.flower_2);
			this.setObject(6, 5, Overlay.flower_1);
			this.setObject(8, 5, Overlay.flower_1);
			this.setObject(9, 5, Overlay.flower_2);
			this.setObject(10, 5, Overlay.flower_1);
			this.setObject(11, 5, Overlay.flower_2);
			this.setObject(14, 18, Overlay.sign);
			
			this.setObject(19,20,Overlay.fence);
			this.setObject(18,20,Overlay.fence);
			this.setObject(17,20,Overlay.fence);
			this.setObject(17,21,Overlay.fence);
			this.setObject(17,22,Overlay.fence);
			this.setObject(17,23,Overlay.fence);
			this.setObject(17,24,Overlay.fence);
			this.setObject(17,25,Overlay.fence);
			this.setObject(17,26,Overlay.fence);
			this.setObject(17,27,Overlay.fence);
			this.setObject(17,28,Overlay.fence);
			this.setObject(17,29,Overlay.fence);
			this.setObject(17,30,Overlay.fence);
			this.setObject(18,30,Overlay.fence);
			this.setObject(19,30,Overlay.fence);
			this.setObject(20,31,Overlay.crate);
			this.setObject(18, 21, Overlay.tree_2);
			this.setObject(18, 23, Overlay.tree_2);
			this.setObject(18, 25, Overlay.tree_2);
			this.setObject(18, 27, Overlay.tree_2);
			this.setObject(18, 29, Overlay.tree_2);
			this.setObject(12,18,Overlay.barrel_stack);
			
			this.setObject(18, 10, Overlay.fence);
			this.setObject(18, 11, Overlay.fence);
			this.setObject(18, 12, Overlay.fence);
			this.setObject(18, 13, Overlay.fence);
			this.setObject(19, 13, Overlay.fence);
			this.setObject(22, 13, Overlay.fence);
			this.setObject(23, 13, Overlay.fence);
			this.setObject(23, 12, Overlay.fence);
			
			this.setObject(20, 10, Overlay.well);
			this.setObject(21, 10, Overlay.inivisible);
			this.setObject(20, 11, Overlay.inivisible);
			this.setObject(21, 11, Overlay.inivisible);
			this.setObject(20, 12, Overlay.flower_1);
			this.setObject(19, 10, Overlay.flower_2);
			this.setObject(21, 12, Overlay.flower_2);
			this.setObject(22, 10, Overlay.flower_1);
			this.setObject(22, 11, Overlay.flower_6);
			this.setObject(22, 12, Overlay.flower_5);
			this.setObject(19, 11, Overlay.flower_6);
			this.setObject(19, 12, Overlay.flower_5);
			this.setObject(20, 13, new ObjectSign("In memory of Jeremy Webster. He was a good man!"));
			
			this.setObject(17, 13, Overlay.bush_1);
			this.setObject(17, 12, Overlay.bush_2);
			this.setObject(17, 11, Overlay.bush_3);
			this.setObject(17, 10, Overlay.bush_1);
			this.setObject(17, 9, Overlay.bush_2);
			this.setObject(17, 8, Overlay.bush_3);
			this.setObject(17, 7, Overlay.bush_1);
			this.setObject(17, 6, Overlay.bush_2);
			this.setObject(17, 5, Overlay.bush_3);
			
			this.setObject(1,8,Overlay.tree_3);
			this.setObject(2,8,Overlay.tree_3);
			this.setObject(4,8,Overlay.tree_3);
			this.setObject(6,8,Overlay.tree_3);
			this.setObject(7,8,Overlay.tree_3);
			this.setObject(9,8,Overlay.tree_3);
			this.setObject(10,8,Overlay.tree_3);
			this.setObject(11,8,Overlay.tree_3);
			this.setObject(13,8,Overlay.tree_3);
			this.setObject(13,10,Overlay.tree_2);
			this.setObject(13,11,Overlay.tree_2);
			this.setObject(13,12,Overlay.tree_2);
			this.setObject(12, 8, Overlay.bush_3);
			this.setObject(8, 8, Overlay.flower_3);
			
			this.setObject(12, 9, Overlay.fence);
			this.setObject(13, 9, Overlay.fence);
			this.setObject(14, 9, Overlay.fence);
			this.setObject(14, 10, Overlay.fence);
			this.setObject(14, 11, Overlay.fence);
			this.setObject(14, 12, Overlay.fence);
			this.setObject(14, 13, Overlay.fence);
			this.setObject(13, 13, Overlay.fence);
			this.setObject(12, 13, Overlay.fence);
			
			this.setObject(29,11,Overlay.barrel);
			this.setObject(30,11,Overlay.barrel);
			this.setObject(31,11,Overlay.barrel);
			this.setObject(30,20,Overlay.crate_stack);
			this.setObject(31,20,Overlay.inivisible);
			
			this.setObject(13,20,Overlay.tree_2);
			this.setObject(13,27,Overlay.tree_2);
			
			this.setObject(6,9,Overlay.barrel);
			this.setObject(6,10,Overlay.barrel);
			this.setObject(6,11,Overlay.barrel);
			this.setObject(6,12,Overlay.barrel);
			this.setObject(6,13,Overlay.barrel);
			
			this.setObject(19,18,Overlay.crate_stack);
			this.setObject(20,18,Overlay.inivisible);
			this.setObject(5,17,Overlay.tree_3);
			this.setObject(6,17,Overlay.tree_3);
			this.setObject(8,17,Overlay.tree_3);
			this.setObject(9,17,Overlay.tree_3);
			this.setObject(10,17,Overlay.tree_3);
			this.setObject(1,17,Overlay.tree_3);
			this.setObject(2,17,Overlay.tree_3);
			this.setObject(3,17,Overlay.tree_3);
			
			this.setObject(14,20,Overlay.charlotte_flower);
			this.setObject(12,20,Overlay.charlotte_flower);
			this.setObject(12,27,Overlay.charlotte_flower);
			this.setObject(14,27,Overlay.charlotte_flower);
			this.setObject(13,19,Overlay.charlotte_shroom);
			this.setObject(14,19,Overlay.charlotte_shroom);
			this.setObject(12,19,Overlay.charlotte_shroom);
			this.setObject(13,21,Overlay.charlotte_shroom);
			this.setObject(14,21,Overlay.charlotte_shroom);
			this.setObject(12,21,Overlay.charlotte_shroom);
			this.setObject(12,26,Overlay.charlotte_shroom);
			this.setObject(13,26,Overlay.charlotte_shroom);
			this.setObject(14,26,Overlay.charlotte_shroom);
			this.setObject(12,28,Overlay.charlotte_shroom);
			this.setObject(13,28,Overlay.charlotte_shroom);
			this.setObject(14,28,Overlay.charlotte_shroom);
			
			this.setObject(12,10,Overlay.flower_6);
			this.setObject(12,11,Overlay.flower_6);
			this.setObject(12,12,Overlay.flower_6);
			
			this.setObject(14,4,Overlay.barrel);
			this.setObject(17,4,Overlay.barrel);
			
			this.setObject(11,28,Overlay.fence);
			this.setObject(11,29,Overlay.fence);
			this.setObject(11,30,Overlay.fence);
			this.setObject(11,31,Overlay.fence);
			this.setObject(0,18,Overlay.barrel);
			this.setObject(1,18,Overlay.barrel);
			this.setObject(2,18,Overlay.barrel);
			this.setObject(0,4,Overlay.barrel_stack);
			this.setObject(1,4,Overlay.inivisible);
			this.setObject(0,13,Overlay.crate);
			this.setObject(0,9,Overlay.crate);
			
			this.setObject(19,21,Overlay.flower_6);
			this.setObject(19,22,Overlay.flower_6);
			this.setObject(19,23,Overlay.flower_6);
			this.setObject(19,24,Overlay.flower_6);
			this.setObject(19,25,Overlay.flower_6);
			this.setObject(19,26,Overlay.flower_6);
			this.setObject(19,27,Overlay.flower_6);
			this.setObject(19,28,Overlay.flower_6);
			this.setObject(19,29 ,Overlay.flower_6);
			
			this.setObject(30,12,Overlay.bed);
			this.setObject(28,13,Overlay.tree_3);
			
			this.setObject(12,29,Overlay.fence);
			this.setObject(13,29,Overlay.fence);
			this.setObject(14,29,Overlay.fence);
			this.setObject(12,30,Overlay.bed);
			
			this.setObject(4,14,Overlay.crate_stack);
		}
	}
}