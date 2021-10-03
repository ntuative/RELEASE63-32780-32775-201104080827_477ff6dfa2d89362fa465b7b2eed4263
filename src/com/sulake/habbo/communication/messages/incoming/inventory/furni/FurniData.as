package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2711:int;
      
      private var var_1388:String;
      
      private var _objId:int;
      
      private var var_1881:int;
      
      private var _category:int;
      
      private var var_2093:String;
      
      private var var_2857:Boolean;
      
      private var var_2855:Boolean;
      
      private var var_2856:Boolean;
      
      private var var_2392:Boolean;
      
      private var var_2380:int;
      
      private var var_1363:int;
      
      private var var_2046:String = "";
      
      private var var_1704:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2711 = param1;
         this.var_1388 = param2;
         this._objId = param3;
         this.var_1881 = param4;
         this._category = param5;
         this.var_2093 = param6;
         this.var_2857 = param7;
         this.var_2855 = param8;
         this.var_2856 = param9;
         this.var_2392 = param10;
         this.var_2380 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2046 = param1;
         this.var_1363 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2711;
      }
      
      public function get itemType() : String
      {
         return this.var_1388;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1881;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2093;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2857;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2855;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2856;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2392;
      }
      
      public function get method_1() : int
      {
         return this.var_2380;
      }
      
      public function get slotId() : String
      {
         return this.var_2046;
      }
      
      public function get songId() : int
      {
         return this.var_1704;
      }
      
      public function get extra() : int
      {
         return this.var_1363;
      }
   }
}
