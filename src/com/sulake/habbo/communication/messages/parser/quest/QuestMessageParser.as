package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestMessageParser implements IMessageParser
   {
       
      
      private var var_529:QuestMessageData;
      
      public function QuestMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         if(this.var_529)
         {
            this.var_529.dispose();
         }
         this.var_529 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_529 = new QuestMessageData(param1);
         return true;
      }
      
      public function get quest() : QuestMessageData
      {
         return this.var_529;
      }
   }
}
