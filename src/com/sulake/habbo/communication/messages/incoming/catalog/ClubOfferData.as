package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1870:String;
      
      private var var_1869:int;
      
      private var var_2319:Boolean;
      
      private var var_2322:Boolean;
      
      private var var_2321:int;
      
      private var var_2317:int;
      
      private var var_2318:int;
      
      private var var_2320:int;
      
      private var var_2323:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1870 = param1.readString();
         this.var_1869 = param1.readInteger();
         this.var_2319 = param1.readBoolean();
         this.var_2322 = param1.readBoolean();
         this.var_2321 = param1.readInteger();
         this.var_2317 = param1.readInteger();
         this.var_2318 = param1.readInteger();
         this.var_2320 = param1.readInteger();
         this.var_2323 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1870;
      }
      
      public function get price() : int
      {
         return this.var_1869;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2319;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2322;
      }
      
      public function get periods() : int
      {
         return this.var_2321;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2317;
      }
      
      public function get year() : int
      {
         return this.var_2318;
      }
      
      public function get month() : int
      {
         return this.var_2320;
      }
      
      public function get day() : int
      {
         return this.var_2323;
      }
   }
}
