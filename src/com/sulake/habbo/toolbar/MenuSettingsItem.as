package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2505:String;
      
      private var var_2503:Array;
      
      private var var_2504:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2505 = param1;
         this.var_2503 = param2;
         this.var_2504 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2505;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2503;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2504;
      }
   }
}
