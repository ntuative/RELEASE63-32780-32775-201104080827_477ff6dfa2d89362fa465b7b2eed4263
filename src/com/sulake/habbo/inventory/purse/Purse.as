package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1600:int = 0;
      
      private var var_1599:int = 0;
      
      private var var_2827:int = 0;
      
      private var var_2828:Boolean = false;
      
      private var var_2134:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1600 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1599 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2827 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2828 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2134 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1600;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1599;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2827;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2828;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2134;
      }
   }
}
