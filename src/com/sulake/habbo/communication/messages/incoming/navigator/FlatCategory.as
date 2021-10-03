package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1810:int;
      
      private var var_2729:String;
      
      private var var_299:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1810 = param1.readInteger();
         this.var_2729 = param1.readString();
         this.var_299 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1810;
      }
      
      public function get nodeName() : String
      {
         return this.var_2729;
      }
      
      public function get visible() : Boolean
      {
         return this.var_299;
      }
   }
}
