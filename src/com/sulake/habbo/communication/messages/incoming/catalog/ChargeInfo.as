package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2160:int;
      
      private var var_2301:int;
      
      private var var_1265:int;
      
      private var var_1266:int;
      
      private var var_1968:int;
      
      private var var_2302:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2160 = param1.readInteger();
         this.var_2301 = param1.readInteger();
         this.var_1265 = param1.readInteger();
         this.var_1266 = param1.readInteger();
         this.var_1968 = param1.readInteger();
         this.var_2302 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2160;
      }
      
      public function get charges() : int
      {
         return this.var_2301;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1265;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1266;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2302;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1968;
      }
   }
}
