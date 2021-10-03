package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_925:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2522:int;
      
      private var var_2523:int;
      
      private var _color:uint;
      
      private var var_1196:int;
      
      private var var_2521:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_925);
         this.var_2522 = param1;
         this.var_2523 = param2;
         this._color = param3;
         this.var_1196 = param4;
         this.var_2521 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2522;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2523;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1196;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2521;
      }
   }
}
