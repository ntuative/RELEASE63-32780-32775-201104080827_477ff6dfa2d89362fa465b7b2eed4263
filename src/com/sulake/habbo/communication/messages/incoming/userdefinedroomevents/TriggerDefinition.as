package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class TriggerDefinition extends Triggerable
   {
       
      
      private var var_2034:int;
      
      private var var_2035:Array;
      
      public function TriggerDefinition(param1:IMessageDataWrapper)
      {
         this.var_2035 = new Array();
         super(param1);
         this.var_2034 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_2035.push(param1.readInteger());
            _loc3_++;
         }
      }
      
      public function get method_10() : int
      {
         return this.var_2034;
      }
      
      override public function get code() : int
      {
         return this.var_2034;
      }
      
      public function get conflictingActions() : Array
      {
         return this.var_2035;
      }
   }
}
