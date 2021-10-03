package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_504:WallRasterizer;
      
      private var var_503:FloorRasterizer;
      
      private var var_751:WallAdRasterizer;
      
      private var var_505:LandscapeRasterizer;
      
      private var var_750:PlaneMaskManager;
      
      private var var_771:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_504 = new WallRasterizer();
         this.var_503 = new FloorRasterizer();
         this.var_751 = new WallAdRasterizer();
         this.var_505 = new LandscapeRasterizer();
         this.var_750 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_771;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_503;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_504;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_751;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_505;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_750;
      }
      
      public function dispose() : void
      {
         if(this.var_504 != null)
         {
            this.var_504.dispose();
            this.var_504 = null;
         }
         if(this.var_503 != null)
         {
            this.var_503.dispose();
            this.var_503 = null;
         }
         if(this.var_751 != null)
         {
            this.var_751.dispose();
            this.var_751 = null;
         }
         if(this.var_505 != null)
         {
            this.var_505.dispose();
            this.var_505 = null;
         }
         if(this.var_750 != null)
         {
            this.var_750.dispose();
            this.var_750 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_504 != null)
         {
            this.var_504.clearCache();
         }
         if(this.var_503 != null)
         {
            this.var_503.clearCache();
         }
         if(this.var_505 != null)
         {
            this.var_505.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_504.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_503.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_751.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_505.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_750.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_771)
         {
            return;
         }
         this.var_504.initializeAssetCollection(param1);
         this.var_503.initializeAssetCollection(param1);
         this.var_751.initializeAssetCollection(param1);
         this.var_505.initializeAssetCollection(param1);
         this.var_750.initializeAssetCollection(param1);
         this.var_771 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
