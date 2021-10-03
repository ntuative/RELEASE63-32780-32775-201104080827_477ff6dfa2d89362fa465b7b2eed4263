package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2308:int = 0;
      
      private var var_1336:String = "";
      
      private var var_1627:String = "";
      
      private var var_2182:String = "";
      
      private var var_2452:String = "";
      
      private var var_1758:int = 0;
      
      private var var_2449:int = 0;
      
      private var var_2451:int = 0;
      
      private var var_1338:int = 0;
      
      private var var_2450:int = 0;
      
      private var var_1337:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2308 = param1;
         this.var_1336 = param2;
         this.var_1627 = param3;
         this.var_2182 = param4;
         this.var_2452 = param5;
         if(param6)
         {
            this.var_1758 = 1;
         }
         else
         {
            this.var_1758 = 0;
         }
         this.var_2449 = param7;
         this.var_2451 = param8;
         this.var_1338 = param9;
         this.var_2450 = param10;
         this.var_1337 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2308,this.var_1336,this.var_1627,this.var_2182,this.var_2452,this.var_1758,this.var_2449,this.var_2451,this.var_1338,this.var_2450,this.var_1337];
      }
   }
}
