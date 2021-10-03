package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_688:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2136:String;
      
      private var var_2137:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_688,param3,param4);
         this.var_2136 = param1;
         this.var_2137 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2136;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2137;
      }
   }
}
