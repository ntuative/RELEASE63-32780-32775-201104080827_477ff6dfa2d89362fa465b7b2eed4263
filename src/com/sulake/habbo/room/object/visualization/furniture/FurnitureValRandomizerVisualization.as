package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_952:int = 20;
      
      private static const const_636:int = 10;
      
      private static const const_1264:int = 31;
      
      private static const const_1263:int = 32;
      
      private static const const_637:int = 30;
       
      
      private var var_311:Array;
      
      private var var_719:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_311 = new Array();
         super();
         super.setAnimation(const_637);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_719)
            {
               this.var_719 = true;
               this.var_311 = new Array();
               this.var_311.push(const_1264);
               this.var_311.push(const_1263);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_636)
         {
            if(this.var_719)
            {
               this.var_719 = false;
               this.var_311 = new Array();
               if(direction == 2)
               {
                  this.var_311.push(const_952 + 5 - param1);
                  this.var_311.push(const_636 + 5 - param1);
               }
               else
               {
                  this.var_311.push(const_952 + param1);
                  this.var_311.push(const_636 + param1);
               }
               this.var_311.push(const_637);
               return;
            }
            super.setAnimation(const_637);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
