package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1884:int;
      
      private var var_1885:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return this.var_1884;
      }
      
      public function get answerText() : String
      {
         return this.var_1885;
      }
      
      public function flush() : Boolean
      {
         this.var_1884 = -1;
         this.var_1885 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1884 = param1.readInteger();
         this.var_1885 = param1.readString();
         return true;
      }
   }
}
