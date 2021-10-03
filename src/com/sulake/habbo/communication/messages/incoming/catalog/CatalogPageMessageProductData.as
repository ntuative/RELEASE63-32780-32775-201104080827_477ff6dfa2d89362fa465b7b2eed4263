package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_74:String = "i";
      
      public static const const_82:String = "s";
      
      public static const const_201:String = "e";
       
      
      private var var_1532:String;
      
      private var var_2234:int;
      
      private var var_1534:String;
      
      private var var_1533:int;
      
      private var var_1978:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1532 = param1.readString();
         this.var_2234 = param1.readInteger();
         this.var_1534 = param1.readString();
         this.var_1533 = param1.readInteger();
         this.var_1978 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1532;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2234;
      }
      
      public function get extraParam() : String
      {
         return this.var_1534;
      }
      
      public function get productCount() : int
      {
         return this.var_1533;
      }
      
      public function get expiration() : int
      {
         return this.var_1978;
      }
   }
}
