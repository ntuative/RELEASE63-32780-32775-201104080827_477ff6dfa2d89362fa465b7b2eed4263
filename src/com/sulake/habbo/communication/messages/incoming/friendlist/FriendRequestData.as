package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1208:int;
      
      private var var_2266:String;
      
      private var var_2267:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1208 = param1.readInteger();
         this.var_2266 = param1.readString();
         this.var_2267 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1208;
      }
      
      public function get requesterName() : String
      {
         return this.var_2266;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2267;
      }
   }
}
