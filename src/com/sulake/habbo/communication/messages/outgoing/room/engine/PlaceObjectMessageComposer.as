package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_358:int;
      
      private var var_2115:int;
      
      private var var_1975:String;
      
      private var _x:int = 0;
      
      private var var_147:int = 0;
      
      private var var_353:int = 0;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_358 = param1;
         this.var_2115 = param2;
         this.var_1975 = param3;
         this._x = param4;
         this.var_147 = param5;
         this.var_353 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_2115)
         {
            case RoomObjectCategoryEnum.const_27:
               return [this.var_358 + " " + this._x + " " + this.var_147 + " " + this.var_353];
            case RoomObjectCategoryEnum.const_25:
               return [this.var_358 + " " + this.var_1975];
            default:
               return [];
         }
      }
   }
}
