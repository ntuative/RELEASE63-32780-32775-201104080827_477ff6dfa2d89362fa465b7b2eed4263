package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2677:int;
      
      private var var_2676:int;
      
      private var var_2679:int;
      
      private var var_2678:String;
      
      private var var_1723:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2677 = param1.readInteger();
         this.var_2676 = param1.readInteger();
         this.var_2679 = param1.readInteger();
         this.var_2678 = param1.readString();
         this.var_1723 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2677;
      }
      
      public function get minute() : int
      {
         return this.var_2676;
      }
      
      public function get chatterId() : int
      {
         return this.var_2679;
      }
      
      public function get chatterName() : String
      {
         return this.var_2678;
      }
      
      public function get msg() : String
      {
         return this.var_1723;
      }
   }
}
