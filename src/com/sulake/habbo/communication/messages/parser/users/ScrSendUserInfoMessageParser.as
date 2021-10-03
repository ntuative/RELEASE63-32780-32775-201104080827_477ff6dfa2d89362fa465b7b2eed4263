package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1899:int = 1;
      
      public static const const_1684:int = 2;
       
      
      private var var_947:String;
      
      private var var_2785:int;
      
      private var var_2788:int;
      
      private var var_2787:int;
      
      private var var_2786:int;
      
      private var var_2789:Boolean;
      
      private var var_2134:Boolean;
      
      private var var_2133:int;
      
      private var var_2135:int;
      
      private var var_2792:Boolean;
      
      private var var_2791:int;
      
      private var var_2790:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_947 = param1.readString();
         this.var_2785 = param1.readInteger();
         this.var_2788 = param1.readInteger();
         this.var_2787 = param1.readInteger();
         this.var_2786 = param1.readInteger();
         this.var_2789 = param1.readBoolean();
         this.var_2134 = param1.readBoolean();
         this.var_2133 = param1.readInteger();
         this.var_2135 = param1.readInteger();
         this.var_2792 = param1.readBoolean();
         this.var_2791 = param1.readInteger();
         this.var_2790 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_947;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2785;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2788;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2787;
      }
      
      public function get responseType() : int
      {
         return this.var_2786;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2789;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2134;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2133;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2135;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2792;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2791;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2790;
      }
   }
}
