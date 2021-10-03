package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingOpenParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var var_1945:Boolean;
      
      private var var_1944:int;
      
      private var var_1946:Boolean;
      
      public function TradingOpenParser()
      {
         super();
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function get userCanTrade() : Boolean
      {
         return this.var_1945;
      }
      
      public function get otherUserID() : int
      {
         return this.var_1944;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this.var_1946;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_1945 = false;
         this.var_1944 = -1;
         this.var_1946 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_1945 = param1.readInteger() == 1;
         this.var_1944 = param1.readInteger();
         this.var_1946 = param1.readInteger() == 1;
         return true;
      }
   }
}
