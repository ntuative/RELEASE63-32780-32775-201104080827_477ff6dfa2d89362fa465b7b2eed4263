package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2641:int;
      
      private var var_2093:String;
      
      private var var_1869:int;
      
      private var var_401:int;
      
      private var var_2640:int = -1;
      
      private var var_2460:int;
      
      private var var_1953:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2641 = param3;
         this.var_2093 = param4;
         this.var_1869 = param5;
         this.var_401 = param6;
         this.var_2640 = param7;
         this.var_2460 = param8;
         this.var_1953 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2641;
      }
      
      public function get stuffData() : String
      {
         return this.var_2093;
      }
      
      public function get price() : int
      {
         return this.var_1869;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2640;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2460;
      }
      
      public function get offerCount() : int
      {
         return this.var_1953;
      }
   }
}
