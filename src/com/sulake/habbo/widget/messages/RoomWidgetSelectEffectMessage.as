package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_866:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_791:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_762:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_852:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_852 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_852;
      }
   }
}
