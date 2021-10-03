package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_834:TileHeightMap = null;
      
      private var var_1273:LegacyWallGeometry = null;
      
      private var var_1274:RoomCamera = null;
      
      private var var_835:SelectedRoomObjectData = null;
      
      private var var_836:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_547:Map;
      
      private var var_548:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_547 = new Map();
         this.var_548 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1273 = new LegacyWallGeometry();
         this.var_1274 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_834;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_834 != null)
         {
            this.var_834.dispose();
         }
         this.var_834 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1273;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1274;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_835;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_835 != null)
         {
            this.var_835.dispose();
         }
         this.var_835 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_836;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_836 != null)
         {
            this.var_836.dispose();
         }
         this.var_836 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_834 != null)
         {
            this.var_834.dispose();
            this.var_834 = null;
         }
         if(this.var_1273 != null)
         {
            this.var_1273.dispose();
            this.var_1273 = null;
         }
         if(this.var_1274 != null)
         {
            this.var_1274.dispose();
            this.var_1274 = null;
         }
         if(this.var_835 != null)
         {
            this.var_835.dispose();
            this.var_835 = null;
         }
         if(this.var_836 != null)
         {
            this.var_836.dispose();
            this.var_836 = null;
         }
         if(this.var_547 != null)
         {
            this.var_547.dispose();
            this.var_547 = null;
         }
         if(this.var_548 != null)
         {
            this.var_548.dispose();
            this.var_548 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_547.remove(param1.id);
            this.var_547.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_547.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_547.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_547.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_548.remove(param1.id);
            this.var_548.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_548.length > 0)
         {
            return this.getWallItemDataWithId(this.var_548.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_548.remove(param1);
      }
   }
}
