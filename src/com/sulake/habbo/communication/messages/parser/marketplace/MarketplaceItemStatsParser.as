package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2460:int;
      
      private var var_2462:int;
      
      private var var_2461:int;
      
      private var _dayOffsets:Array;
      
      private var var_2047:Array;
      
      private var var_2048:Array;
      
      private var var_2463:int;
      
      private var var_2464:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2460;
      }
      
      public function get offerCount() : int
      {
         return this.var_2462;
      }
      
      public function get historyLength() : int
      {
         return this.var_2461;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_2047;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_2048;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2463;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2464;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2460 = param1.readInteger();
         this.var_2462 = param1.readInteger();
         this.var_2461 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_2047 = [];
         this.var_2048 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_2047.push(param1.readInteger());
            this.var_2048.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2464 = param1.readInteger();
         this.var_2463 = param1.readInteger();
         return true;
      }
   }
}
