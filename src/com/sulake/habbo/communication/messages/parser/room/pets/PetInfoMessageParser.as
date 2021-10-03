package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1625:int;
      
      private var _name:String;
      
      private var var_1562:int;
      
      private var var_2176:int;
      
      private var var_2180:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_687:String;
      
      private var var_2181:int;
      
      private var var_2178:int;
      
      private var var_2177:int;
      
      private var var_2179:int;
      
      private var var_2116:int;
      
      private var _ownerName:String;
      
      private var var_488:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1625;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1562;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2176;
      }
      
      public function get experience() : int
      {
         return this.var_2180;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_687;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2181;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2178;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2177;
      }
      
      public function get respect() : int
      {
         return this.var_2179;
      }
      
      public function get ownerId() : int
      {
         return this.var_2116;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_488;
      }
      
      public function flush() : Boolean
      {
         this.var_1625 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1625 = param1.readInteger();
         this._name = param1.readString();
         this.var_1562 = param1.readInteger();
         this.var_2176 = param1.readInteger();
         this.var_2180 = param1.readInteger();
         this.var_2181 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2178 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2177 = param1.readInteger();
         this.var_687 = param1.readString();
         this.var_2179 = param1.readInteger();
         this.var_2116 = param1.readInteger();
         this.var_488 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
