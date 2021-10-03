package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1562:int;
      
      private var var_1956:int;
      
      private var var_2490:int;
      
      private var var_2029:int;
      
      private var var_1561:int;
      
      private var var_2136:String = "";
      
      private var var_2491:String = "";
      
      private var var_2489:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1562 = param1.readInteger();
         this.var_2136 = param1.readString();
         this.var_1956 = param1.readInteger();
         this.var_2490 = param1.readInteger();
         this.var_2029 = param1.readInteger();
         this.var_1561 = param1.readInteger();
         this.var_2489 = param1.readInteger();
         this.var_2491 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1562;
      }
      
      public function get points() : int
      {
         return this.var_1956;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2490;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2029;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1561;
      }
      
      public function get badgeID() : String
      {
         return this.var_2136;
      }
      
      public function get achievementID() : int
      {
         return this.var_2489;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2491;
      }
   }
}
