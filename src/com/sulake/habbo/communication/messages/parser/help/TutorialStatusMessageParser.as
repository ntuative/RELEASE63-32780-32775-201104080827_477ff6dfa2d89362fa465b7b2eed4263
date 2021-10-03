package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1215:Boolean;
      
      private var var_1216:Boolean;
      
      private var var_1480:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1215;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1216;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1480;
      }
      
      public function flush() : Boolean
      {
         this.var_1215 = false;
         this.var_1216 = false;
         this.var_1480 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1215 = param1.readBoolean();
         this.var_1216 = param1.readBoolean();
         this.var_1480 = param1.readBoolean();
         return true;
      }
   }
}
