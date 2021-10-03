package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2407:int;
      
      private var var_2408:int;
      
      private var var_2410:int;
      
      private var var_2409:int;
      
      private var var_99:Array;
      
      private var var_227:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_99 = new Array();
         this.var_227 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2407 = param1.readInteger();
         this.var_2408 = param1.readInteger();
         this.var_2410 = param1.readInteger();
         this.var_2409 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_99.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_227.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2407;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2408;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2410;
      }
      
      public function get categories() : Array
      {
         return this.var_99;
      }
      
      public function get friends() : Array
      {
         return this.var_227;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2409;
      }
   }
}
