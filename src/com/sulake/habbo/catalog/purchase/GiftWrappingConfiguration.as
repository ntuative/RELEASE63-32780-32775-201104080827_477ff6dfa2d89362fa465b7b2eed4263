package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1579:Boolean = false;
      
      private var var_1869:int;
      
      private var var_1685:Array;
      
      private var var_749:Array;
      
      private var var_748:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1579 = _loc2_.isWrappingEnabled;
         this.var_1869 = _loc2_.wrappingPrice;
         this.var_1685 = _loc2_.stuffTypes;
         this.var_749 = _loc2_.boxTypes;
         this.var_748 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1579;
      }
      
      public function get price() : int
      {
         return this.var_1869;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1685;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_749;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_748;
      }
   }
}
