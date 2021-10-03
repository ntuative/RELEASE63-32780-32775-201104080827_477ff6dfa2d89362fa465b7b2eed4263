package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1055:int;
      
      private var var_763:Boolean;
      
      private var var_2022:Boolean;
      
      private var var_687:String;
      
      private var var_1456:int;
      
      private var var_1782:String;
      
      private var var_1779:String;
      
      private var var_1781:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1781 = param3;
         this.var_1782 = param4;
         this.var_1055 = param5;
         this.var_763 = param6;
         this.var_2022 = param7;
         this.var_687 = param8;
         this.var_1456 = param9;
         this.var_1779 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1055;
      }
      
      public function get online() : Boolean
      {
         return this.var_763;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_2022;
      }
      
      public function get figure() : String
      {
         return this.var_687;
      }
      
      public function get categoryId() : int
      {
         return this.var_1456;
      }
      
      public function get motto() : String
      {
         return this.var_1782;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1779;
      }
      
      public function get realName() : String
      {
         return this.var_1781;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_1055 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_763 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_2022 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_687 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1456 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1782 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1779 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1781 = param1;
      }
   }
}
