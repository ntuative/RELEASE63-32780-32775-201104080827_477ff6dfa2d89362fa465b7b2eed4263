package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1625:int;
      
      private var var_2221:String;
      
      private var var_1562:int;
      
      private var var_1078:int;
      
      private var var_1603:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1625 = param1.readInteger();
         this.var_2221 = param1.readString();
         this.var_1562 = param1.readInteger();
         this.var_1078 = param1.readInteger();
         this.var_1603 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1625;
      }
      
      public function get petName() : String
      {
         return this.var_2221;
      }
      
      public function get level() : int
      {
         return this.var_1562;
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
   }
}
