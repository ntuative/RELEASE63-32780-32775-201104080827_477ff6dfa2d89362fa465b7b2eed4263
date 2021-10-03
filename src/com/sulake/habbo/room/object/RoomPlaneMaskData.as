package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2529:Number = 0.0;
      
      private var var_2526:Number = 0.0;
      
      private var var_2528:Number = 0.0;
      
      private var var_2527:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2529 = param1;
         this.var_2526 = param2;
         this.var_2528 = param3;
         this.var_2527 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2529;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2526;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2528;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2527;
      }
   }
}
