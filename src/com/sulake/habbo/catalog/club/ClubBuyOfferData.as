package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1870:String;
      
      private var var_1869:int;
      
      private var var_2319:Boolean;
      
      private var var_2322:Boolean;
      
      private var var_2321:int;
      
      private var var_2317:int;
      
      private var var_354:ICatalogPage;
      
      private var var_2318:int;
      
      private var var_2320:int;
      
      private var var_2323:int;
      
      private var var_1414:String;
      
      private var var_2604:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1870 = param2;
         this.var_1869 = param3;
         this.var_2319 = param4;
         this.var_2322 = param5;
         this.var_2321 = param6;
         this.var_2317 = param7;
         this.var_2318 = param8;
         this.var_2320 = param9;
         this.var_2323 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1414;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1414 = param1;
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_212;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1869;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_354;
      }
      
      public function get priceType() : String
      {
         return Offer.const_775;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1870;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_354 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2604;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2604 = param1;
      }
   }
}
