package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserNameChangedMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1658:int;
      
      private var _id:int;
      
      private var var_1657:String;
      
      public function UserNameChangedMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get webId() : int
      {
         return this.var_1658;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get newName() : String
      {
         return this.var_1657;
      }
      
      public function flush() : Boolean
      {
         this.var_1658 = -1;
         this._id = -1;
         this.var_1657 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1658 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1657 = param1.readString();
         return true;
      }
   }
}
