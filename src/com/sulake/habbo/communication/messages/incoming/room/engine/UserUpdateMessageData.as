package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_148:Number = 0;
      
      private var var_2858:Number = 0;
      
      private var var_2862:Number = 0;
      
      private var var_2859:Number = 0;
      
      private var var_2860:Number = 0;
      
      private var var_353:int = 0;
      
      private var var_2112:int = 0;
      
      private var var_330:Array;
      
      private var var_2861:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_330 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_147 = param3;
         this.var_148 = param4;
         this.var_2858 = param5;
         this.var_353 = param6;
         this.var_2112 = param7;
         this.var_2862 = param8;
         this.var_2859 = param9;
         this.var_2860 = param10;
         this.var_2861 = param11;
         this.var_330 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_147;
      }
      
      public function get z() : Number
      {
         return this.var_148;
      }
      
      public function get localZ() : Number
      {
         return this.var_2858;
      }
      
      public function get targetX() : Number
      {
         return this.var_2862;
      }
      
      public function get targetY() : Number
      {
         return this.var_2859;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2860;
      }
      
      public function get dir() : int
      {
         return this.var_353;
      }
      
      public function get dirHead() : int
      {
         return this.var_2112;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2861;
      }
      
      public function get actions() : Array
      {
         return this.var_330.slice();
      }
   }
}
