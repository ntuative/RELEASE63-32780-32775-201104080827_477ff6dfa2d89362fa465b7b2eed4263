package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1263:int = 3;
      
      private static const const_1380:int = 2;
      
      private static const const_1379:int = 1;
      
      private static const const_1381:int = 15;
       
      
      private var var_311:Array;
      
      private var var_1237:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_311 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1380)
         {
            this.var_311 = new Array();
            this.var_311.push(const_1379);
            this.var_1237 = const_1381;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1237 > 0)
         {
            --this.var_1237;
         }
         if(this.var_1237 == 0)
         {
            if(this.var_311.length > 0)
            {
               super.setAnimation(this.var_311.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
