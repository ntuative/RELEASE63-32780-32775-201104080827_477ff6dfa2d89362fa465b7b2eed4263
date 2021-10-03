package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1562:int;
      
      private var var_325:String;
      
      private var var_2545:int;
      
      private var var_2490:int;
      
      private var var_2029:int;
      
      private var var_2546:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1562 = param1.readInteger();
         this.var_325 = param1.readString();
         this.var_2545 = param1.readInteger();
         this.var_2490 = param1.readInteger();
         this.var_2029 = param1.readInteger();
         this.var_2546 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_325;
      }
      
      public function get level() : int
      {
         return this.var_1562;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2545;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2490;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2029;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2546;
      }
   }
}
