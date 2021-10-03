package com.sulake.habbo.widget.events
{
   public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_799:String = "RWFCE_FLOOD_CONTROL";
       
      
      private var var_1932:int = 0;
      
      public function RoomWidgetFloodControlEvent(param1:int)
      {
         super(const_799,false,false);
         this.var_1932 = param1;
      }
      
      public function get seconds() : int
      {
         return this.var_1932;
      }
   }
}
