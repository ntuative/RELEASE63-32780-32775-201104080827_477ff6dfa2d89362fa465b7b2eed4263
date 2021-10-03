package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2093:String;
      
      protected var var_1363:Number;
      
      protected var var_2870:Boolean;
      
      protected var var_2871:Boolean;
      
      protected var var_2755:Boolean;
      
      protected var var_2372:Boolean;
      
      protected var var_2873:int;
      
      protected var var_2758:int;
      
      protected var var_2757:int;
      
      protected var var_2756:int;
      
      protected var var_2046:String;
      
      protected var var_1704:int;
      
      protected var var_872:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2755 = param5;
         this.var_2871 = param6;
         this.var_2870 = param7;
         this.var_2372 = param8;
         this.var_2093 = param9;
         this.var_1363 = param10;
         this.var_2873 = param11;
         this.var_2758 = param12;
         this.var_2757 = param13;
         this.var_2756 = param14;
         this.var_2046 = param15;
         this.var_1704 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2093;
      }
      
      public function get extra() : Number
      {
         return this.var_1363;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2870;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2871;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2755;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2372;
      }
      
      public function get expires() : int
      {
         return this.var_2873;
      }
      
      public function get creationDay() : int
      {
         return this.var_2758;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2757;
      }
      
      public function get creationYear() : int
      {
         return this.var_2756;
      }
      
      public function get slotId() : String
      {
         return this.var_2046;
      }
      
      public function get songId() : int
      {
         return this.var_1704;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_872 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_872;
      }
   }
}
