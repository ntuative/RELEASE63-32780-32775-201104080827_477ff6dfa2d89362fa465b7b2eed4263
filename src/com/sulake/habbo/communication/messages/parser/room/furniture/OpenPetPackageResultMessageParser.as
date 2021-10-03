package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_358:int = 0;
      
      private var var_1733:int = 0;
      
      private var var_1602:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_358;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1733;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1602;
      }
      
      public function flush() : Boolean
      {
         this.var_358 = 0;
         this.var_1733 = 0;
         this.var_1602 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_358 = param1.readInteger();
         this.var_1733 = param1.readInteger();
         this.var_1602 = param1.readString();
         return true;
      }
   }
}
