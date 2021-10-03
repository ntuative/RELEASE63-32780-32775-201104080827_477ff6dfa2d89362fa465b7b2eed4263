package com.sulake.habbo.room.events
{
   public class RoomEngineRoomColorEvent extends RoomEngineEvent
   {
      
      public static const const_683:String = "REE_ROOM_COLOR";
       
      
      private var _color:uint;
      
      private var var_2673:uint;
      
      private var var_2561:Boolean;
      
      public function RoomEngineRoomColorEvent(param1:int, param2:int, param3:uint, param4:uint, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_683,param1,param2,param6,param7);
         this._color = param3;
         this.var_2673 = param4;
         this.var_2561 = param5;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : uint
      {
         return this.var_2673;
      }
      
      public function get bgOnly() : Boolean
      {
         return this.var_2561;
      }
   }
}
