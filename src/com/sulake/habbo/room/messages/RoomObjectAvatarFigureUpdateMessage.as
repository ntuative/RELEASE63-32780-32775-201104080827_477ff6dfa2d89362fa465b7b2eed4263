package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_687:String;
      
      private var var_2223:String;
      
      private var var_1055:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_687 = param1;
         this.var_1055 = param2;
         this.var_2223 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_687;
      }
      
      public function get race() : String
      {
         return this.var_2223;
      }
      
      public function get gender() : String
      {
         return this.var_1055;
      }
   }
}
