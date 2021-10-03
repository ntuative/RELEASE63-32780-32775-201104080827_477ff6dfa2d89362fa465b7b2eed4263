package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1970:Boolean;
      
      private var var_2765:int;
      
      private var var_428:Boolean;
      
      private var var_1267:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1970;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2765;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1267;
      }
      
      public function get owner() : Boolean
      {
         return this.var_428;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1267 != null)
         {
            this.var_1267.dispose();
            this.var_1267 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1970 = param1.readBoolean();
         if(this.var_1970)
         {
            this.var_2765 = param1.readInteger();
            this.var_428 = param1.readBoolean();
         }
         else
         {
            this.var_1267 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
