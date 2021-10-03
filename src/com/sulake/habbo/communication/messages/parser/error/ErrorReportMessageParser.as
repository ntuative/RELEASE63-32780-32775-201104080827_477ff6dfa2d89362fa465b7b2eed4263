package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1634:int;
      
      private var var_1893:int;
      
      private var var_1892:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1893 = param1.readInteger();
         this.var_1634 = param1.readInteger();
         this.var_1892 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1634 = 0;
         this.var_1893 = 0;
         this.var_1892 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1634;
      }
      
      public function get messageId() : int
      {
         return this.var_1893;
      }
      
      public function get timestamp() : String
      {
         return this.var_1892;
      }
   }
}
