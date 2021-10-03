package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1950:int;
      
      private var var_2717:int;
      
      private var var_1415:int;
      
      private var var_2718:int;
      
      private var var_119:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1950 = param1.readInteger();
         this.var_2717 = param1.readInteger();
         this.var_1415 = param1.readInteger();
         this.var_2718 = param1.readInteger();
         this.var_119 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1950);
      }
      
      public function get callId() : int
      {
         return this.var_1950;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2717;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1415;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2718;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_119;
      }
   }
}
