package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_358:int;
      
      private var var_2221:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_358 = param1;
         this.var_2221 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_358,this.var_2221];
      }
      
      public function dispose() : void
      {
      }
   }
}
