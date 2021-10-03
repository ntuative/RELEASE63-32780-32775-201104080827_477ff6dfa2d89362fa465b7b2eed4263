package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_358:int = -1;
      
      private var var_1078:int = -1;
      
      private var var_1603:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_358;
      }
      
      public function get petType() : int
      {
         return this.var_1078;
      }
      
      public function get breed() : int
      {
         return this.var_1603;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function flush() : Boolean
      {
         this.var_358 = -1;
         this.var_1078 = -1;
         this.var_1603 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_358 = param1.readInteger();
         this.var_1078 = param1.readInteger();
         this.var_1603 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
