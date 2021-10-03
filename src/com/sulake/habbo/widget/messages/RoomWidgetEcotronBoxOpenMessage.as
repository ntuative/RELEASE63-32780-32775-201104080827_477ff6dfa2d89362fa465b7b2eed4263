package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_894:String = "RWEBOM_OPEN_ECOTRONBOX";
       
      
      private var var_358:int;
      
      public function RoomWidgetEcotronBoxOpenMessage(param1:String, param2:int)
      {
         super(param1);
         this.var_358 = param2;
      }
      
      public function get objectId() : int
      {
         return this.var_358;
      }
   }
}
