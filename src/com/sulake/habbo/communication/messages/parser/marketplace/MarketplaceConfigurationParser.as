package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1579:Boolean;
      
      private var var_2262:int;
      
      private var var_1665:int;
      
      private var var_1664:int;
      
      private var var_2259:int;
      
      private var var_2261:int;
      
      private var var_2257:int;
      
      private var var_2260:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1579;
      }
      
      public function get commission() : int
      {
         return this.var_2262;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1665;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1664;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2261;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2259;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2257;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2260;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1579 = param1.readBoolean();
         this.var_2262 = param1.readInteger();
         this.var_1665 = param1.readInteger();
         this.var_1664 = param1.readInteger();
         this.var_2261 = param1.readInteger();
         this.var_2259 = param1.readInteger();
         this.var_2257 = param1.readInteger();
         this.var_2260 = param1.readInteger();
         return true;
      }
   }
}
