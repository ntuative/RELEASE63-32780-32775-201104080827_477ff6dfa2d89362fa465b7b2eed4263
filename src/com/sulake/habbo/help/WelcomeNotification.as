package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2681:String;
      
      private var var_2680:String;
      
      private var var_2682:String;
      
      public function WelcomeNotification(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2681 = param1;
         this.var_2680 = param2;
         this.var_2682 = param3;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2681;
      }
      
      public function get titleLocalizationKey() : String
      {
         return this.var_2680;
      }
      
      public function get descriptionLocalizationKey() : String
      {
         return this.var_2682;
      }
   }
}
