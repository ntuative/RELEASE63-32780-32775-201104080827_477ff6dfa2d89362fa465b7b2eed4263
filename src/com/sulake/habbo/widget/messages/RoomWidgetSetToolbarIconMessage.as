package com.sulake.habbo.widget.messages
{
   import flash.display.BitmapData;
   
   public class RoomWidgetSetToolbarIconMessage extends RoomWidgetMessage
   {
      
      public static const const_1168:String = "RWCM_MESSAGE_SET_TOOLBAR_ICON";
      
      public static const const_1668:String = "me_menu";
       
      
      private var var_2583:String;
      
      private var _icon:BitmapData;
      
      public function RoomWidgetSetToolbarIconMessage(param1:String, param2:BitmapData)
      {
         super(const_1168);
         this.var_2583 = param1;
         this._icon = param2;
      }
      
      public function get widgetType() : String
      {
         return this.var_2583;
      }
      
      public function get icon() : BitmapData
      {
         return this._icon;
      }
   }
}
