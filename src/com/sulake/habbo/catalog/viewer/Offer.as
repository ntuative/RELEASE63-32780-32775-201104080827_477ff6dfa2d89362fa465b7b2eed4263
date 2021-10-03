package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1674:String = "pricing_model_unknown";
      
      public static const const_426:String = "pricing_model_single";
      
      public static const const_384:String = "pricing_model_multi";
      
      public static const const_513:String = "pricing_model_bundle";
      
      public static const PRICE_TYPE_NONE:String = "price_type_none";
      
      public static const const_775:String = "price_type_credits";
      
      public static const const_1144:String = "price_type_activitypoints";
      
      public static const const_1084:String = "price_type_credits_and_activitypoints";
       
      
      private var var_820:String;
      
      private var var_1264:String;
      
      private var _offerId:int;
      
      private var var_1969:String;
      
      private var var_1265:int;
      
      private var var_1266:int;
      
      private var var_1968:int;
      
      private var var_354:ICatalogPage;
      
      private var var_665:IProductContainer;
      
      private var var_1414:String = "";
      
      private var var_2764:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1969 = param2;
         this.var_1265 = param3;
         this.var_1266 = param4;
         this.var_1968 = param5;
         this.var_354 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get extraParameter() : String
      {
         return this.var_1414;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1414 = param1;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_354;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1969;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1265;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1266;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1968;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_665;
      }
      
      public function get pricingModel() : String
      {
         return this.var_820;
      }
      
      public function get priceType() : String
      {
         return this.var_1264;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2764;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2764 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1969 = "";
         this.var_1265 = 0;
         this.var_1266 = 0;
         this.var_1968 = 0;
         this.var_354 = null;
         if(this.var_665 != null)
         {
            this.var_665.dispose();
            this.var_665 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_820)
         {
            case const_426:
               this.var_665 = new SingleProductContainer(this,param1);
               break;
            case const_384:
               this.var_665 = new MultiProductContainer(this,param1);
               break;
            case const_513:
               this.var_665 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_820);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_820 = const_426;
            }
            else
            {
               this.var_820 = const_384;
            }
         }
         else if(param1.length > 1)
         {
            this.var_820 = const_513;
         }
         else
         {
            this.var_820 = const_1674;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1265 > 0 && this.var_1266 > 0)
         {
            this.var_1264 = const_1084;
         }
         else if(this.var_1265 > 0)
         {
            this.var_1264 = const_775;
         }
         else if(this.var_1266 > 0)
         {
            this.var_1264 = const_1144;
         }
         else
         {
            this.var_1264 = PRICE_TYPE_NONE;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_354.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_665.products)
         {
            _loc4_ = this.var_354.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
