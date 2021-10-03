package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureCounterClockVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1299:String = "seconds_sprite";
      
      private static const const_1301:String = "ten_seconds_sprite";
      
      private static const const_1300:String = "minutes_sprite";
      
      private static const const_1298:String = "ten_minutes_sprite";
       
      
      public function FurnitureCounterClockVisualization()
      {
         super();
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1299:
               return _loc4_ % 60 % 10;
            case const_1301:
               return _loc4_ % 60 / 10;
            case const_1300:
               return _loc4_ / 60 % 10;
            case const_1298:
               return _loc4_ / 60 / 10 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
   }
}
