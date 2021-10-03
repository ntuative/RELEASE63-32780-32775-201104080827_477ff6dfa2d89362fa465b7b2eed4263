package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_147:Number = 0;
      
      private var var_148:Number = 0;
      
      private var var_353:int = 0;
      
      private var var_526:int = 0;
      
      private var var_637:int = 0;
      
      private var _type:int = 0;
      
      private var var_2948:String = "";
      
      private var var_1363:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2380:int = 0;
      
      private var var_2547:String = null;
      
      private var var_177:Boolean = false;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_177 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_177)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_147;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_177)
         {
            this.var_147 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_148;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_177)
         {
            this.var_148 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_353;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_353 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_526;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_526 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_637;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_637 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_177)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_177)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_177)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2547;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_177)
         {
            this.var_2547 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1363;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_1363 = param1;
         }
      }
      
      public function get method_1() : int
      {
         return this.var_2380;
      }
      
      public function set method_1(param1:int) : void
      {
         if(!this.var_177)
         {
            this.var_2380 = param1;
         }
      }
   }
}
