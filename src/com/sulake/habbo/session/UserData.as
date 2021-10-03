package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_930:String = "";
      
      private var var_687:String = "";
      
      private var var_2358:String = "";
      
      private var var_2361:int;
      
      private var var_2359:int = 0;
      
      private var var_2356:String = "";
      
      private var var_2360:int = 0;
      
      private var var_2357:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2361;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2361 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_930;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_930 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_687;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_687 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2358;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2358 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2359;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2359 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2356;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2356 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2360;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2360 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2357;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2357 = param1;
      }
   }
}
