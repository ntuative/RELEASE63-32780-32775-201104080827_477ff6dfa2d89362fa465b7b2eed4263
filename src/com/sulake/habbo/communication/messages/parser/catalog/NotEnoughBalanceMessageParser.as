package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2016:int = 0;
      
      private var var_2017:int = 0;
      
      private var var_1968:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2016;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_2017;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1968;
      }
      
      public function flush() : Boolean
      {
         this.var_2016 = 0;
         this.var_2017 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2016 = param1.readInteger();
         this.var_2017 = param1.readInteger();
         this.var_1968 = param1.readInteger();
         return true;
      }
   }
}
