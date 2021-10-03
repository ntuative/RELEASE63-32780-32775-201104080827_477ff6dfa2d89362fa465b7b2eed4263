package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_739:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_597:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_739);
         this.var_597 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_597;
      }
   }
}
