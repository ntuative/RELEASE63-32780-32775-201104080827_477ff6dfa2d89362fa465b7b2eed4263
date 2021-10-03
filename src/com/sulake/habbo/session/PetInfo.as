package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1625:int;
      
      private var var_1562:int;
      
      private var var_2188:int;
      
      private var var_2180:int;
      
      private var var_2191:int;
      
      private var _energy:int;
      
      private var var_2190:int;
      
      private var _nutrition:int;
      
      private var var_2189:int;
      
      private var var_2116:int;
      
      private var _ownerName:String;
      
      private var var_2179:int;
      
      private var var_488:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1625;
      }
      
      public function get level() : int
      {
         return this.var_1562;
      }
      
      public function get levelMax() : int
      {
         return this.var_2188;
      }
      
      public function get experience() : int
      {
         return this.var_2180;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2191;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2190;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2189;
      }
      
      public function get ownerId() : int
      {
         return this.var_2116;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2179;
      }
      
      public function get age() : int
      {
         return this.var_488;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1625 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1562 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2188 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2180 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2191 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2190 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2189 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2116 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2179 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_488 = param1;
      }
   }
}
