package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_812:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1254:String = "inventory_effects";
      
      public static const const_1062:String = "inventory_badges";
      
      public static const const_1501:String = "inventory_clothes";
      
      public static const const_1543:String = "inventory_furniture";
       
      
      private var var_2155:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_812);
         this.var_2155 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2155;
      }
   }
}
