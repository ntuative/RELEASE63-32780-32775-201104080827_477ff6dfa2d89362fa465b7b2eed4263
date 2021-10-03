package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1704:int;
      
      private var var_1755:Number;
      
      private var var_2444:Number;
      
      private var var_2443:int;
      
      private var var_2441:Number;
      
      private var var_2442:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1704 = param1;
         this.var_1755 = param2;
         this.var_2444 = param3;
         this.var_2441 = param4;
         this.var_2442 = param5;
         this.var_2443 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1704;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1755 < 0)
         {
            return 0;
         }
         return this.var_1755 + (getTimer() - this.var_2443) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2444;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2441;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2442;
      }
   }
}
