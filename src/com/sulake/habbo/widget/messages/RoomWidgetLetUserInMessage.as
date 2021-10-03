package com.sulake.habbo.widget.messages
{
   public class RoomWidgetLetUserInMessage extends RoomWidgetMessage
   {
      
      public static const const_649:String = "RWLUIM_LET_USER_IN";
       
      
      private var _userName:String;
      
      private var var_2494:Boolean;
      
      public function RoomWidgetLetUserInMessage(param1:String, param2:Boolean)
      {
         super(const_649);
         this._userName = param1;
         this.var_2494 = param2;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get canEnter() : Boolean
      {
         return this.var_2494;
      }
   }
}