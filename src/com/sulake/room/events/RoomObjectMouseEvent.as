package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_158:String = "ROE_MOUSE_CLICK";
      
      public static const const_1862:String = "ROE_MOUSE_ENTER";
      
      public static const const_532:String = "ROE_MOUSE_MOVE";
      
      public static const const_1897:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1938:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1719:String = "";
      
      private var var_2217:Boolean;
      
      private var var_2218:Boolean;
      
      private var var_2220:Boolean;
      
      private var var_2219:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1719 = param2;
         this.var_2217 = param5;
         this.var_2218 = param6;
         this.var_2220 = param7;
         this.var_2219 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1719;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2217;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2218;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2220;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2219;
      }
   }
}
