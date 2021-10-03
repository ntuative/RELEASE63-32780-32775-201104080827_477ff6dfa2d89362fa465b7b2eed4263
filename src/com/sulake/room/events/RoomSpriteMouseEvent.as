package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1719:String = "";
      
      private var var_1875:String = "";
      
      private var var_2312:String = "";
      
      private var var_2314:Number = 0;
      
      private var var_2311:Number = 0;
      
      private var var_2313:Number = 0;
      
      private var var_2315:Number = 0;
      
      private var var_2218:Boolean = false;
      
      private var var_2217:Boolean = false;
      
      private var var_2220:Boolean = false;
      
      private var var_2219:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1719 = param2;
         this.var_1875 = param3;
         this.var_2312 = param4;
         this.var_2314 = param5;
         this.var_2311 = param6;
         this.var_2313 = param7;
         this.var_2315 = param8;
         this.var_2218 = param9;
         this.var_2217 = param10;
         this.var_2220 = param11;
         this.var_2219 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1719;
      }
      
      public function get canvasId() : String
      {
         return this.var_1875;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2312;
      }
      
      public function get screenX() : Number
      {
         return this.var_2314;
      }
      
      public function get screenY() : Number
      {
         return this.var_2311;
      }
      
      public function get localX() : Number
      {
         return this.var_2313;
      }
      
      public function get localY() : Number
      {
         return this.var_2315;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2218;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2217;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2220;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2219;
      }
   }
}
