package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2370:Number;
      
      private var var_1601:Number;
      
      private var var_925:Number;
      
      private var var_506:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2370 = param1;
         this.var_1601 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_925 = param1;
         this.var_506 = 0;
      }
      
      public function update() : void
      {
         this.var_925 += this.var_1601;
         this.var_506 += this.var_925;
         if(this.var_506 > 0)
         {
            this.var_506 = 0;
            this.var_925 = this.var_2370 * -1 * this.var_925;
         }
      }
      
      public function get location() : Number
      {
         return this.var_506;
      }
   }
}
