package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_212:int = 0;
       
      
      private var var_1792:int = 0;
      
      private var var_1328:Dictionary;
      
      private var var_1600:int = 0;
      
      private var var_1599:int = 0;
      
      private var var_2134:Boolean = false;
      
      private var var_2133:int = 0;
      
      private var var_2135:int = 0;
      
      public function Purse()
      {
         this.var_1328 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1792;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1792 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1600;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1600 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1599;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1599 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1600 > 0 || this.var_1599 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2134;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2134 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2133;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2133 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2135;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2135 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1328;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1328 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1328[param1];
      }
   }
}
