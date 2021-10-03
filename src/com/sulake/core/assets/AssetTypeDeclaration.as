package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2417:String;
      
      private var var_2416:Class;
      
      private var var_2418:Class;
      
      private var var_1734:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2417 = param1;
         this.var_2416 = param2;
         this.var_2418 = param3;
         if(rest == null)
         {
            this.var_1734 = new Array();
         }
         else
         {
            this.var_1734 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2417;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2416;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2418;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1734;
      }
   }
}
