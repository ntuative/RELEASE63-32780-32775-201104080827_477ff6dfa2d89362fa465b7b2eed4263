package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2564:String;
      
      private var var_2565:int;
      
      private var var_2568:int;
      
      private var var_1968:int;
      
      private var _id:int;
      
      private var var_2569:Boolean;
      
      private var _type:String;
      
      private var var_1836:String;
      
      private var var_1838:int;
      
      private var var_2566:String;
      
      private var var_776:String;
      
      private var var_1837:String;
      
      private var var_2567:uint;
      
      private var var_2295:uint;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2564 = param1.readString();
         this.var_2565 = param1.readInteger();
         this.var_2568 = param1.readInteger();
         this.var_1968 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2569 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1836 = param1.readString();
         this.var_1838 = param1.readInteger();
         this.var_776 = param1.readString();
         this.var_2295 = param1.readInteger();
         var _loc2_:String = "";
         var _loc3_:int = this.var_776.length - 1;
         while(_loc3_ > 0 && this.isNumber(this.var_776.charAt(_loc3_)))
         {
            _loc2_ = this.var_776.charAt(_loc3_) + _loc2_;
            _loc3_--;
         }
         if(_loc3_ > 0)
         {
            this.var_1837 = this.var_776.substring(0,_loc3_ + 1);
         }
         else
         {
            this.var_1837 = this.var_776;
         }
         this.var_2567 = uint(_loc2_);
      }
      
      private function isNumber(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1836 = "";
         this.var_1838 = 0;
         this.var_2566 = "";
      }
      
      public function get campaignCode() : String
      {
         return this.var_2564;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2565;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2568;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1968;
      }
      
      public function get available() : Boolean
      {
         return this.var_2569;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1836;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1838;
      }
      
      public function get endDateTimeStamp() : String
      {
         return this.var_2566;
      }
      
      public function get localizationCode() : String
      {
         return this.var_776;
      }
      
      public function get sortCode() : uint
      {
         return this.var_2567;
      }
      
      public function get sortOrder() : uint
      {
         return this.var_2295;
      }
      
      public function get localizationPrefix() : String
      {
         return this.var_1837;
      }
   }
}
