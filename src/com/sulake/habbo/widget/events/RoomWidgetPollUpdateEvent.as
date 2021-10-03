package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_154:String = "RWPUW_OFFER";
      
      public static const const_69:String = "RWPUW_ERROR";
      
      public static const const_134:String = "RWPUW_CONTENT";
       
      
      private var _id:int = -1;
      
      private var var_1910:String;
      
      private var var_1554:int = 0;
      
      private var var_2018:String = "";
      
      private var var_2019:String = "";
      
      private var var_1555:Array = null;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         this._id = param1;
         super(param2,param3,param4);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get summary() : String
      {
         return this.var_1910;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1910 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1554;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1554 = param1;
      }
      
      public function get startMessage() : String
      {
         return this.var_2018;
      }
      
      public function set startMessage(param1:String) : void
      {
         this.var_2018 = param1;
      }
      
      public function get endMessage() : String
      {
         return this.var_2019;
      }
      
      public function set endMessage(param1:String) : void
      {
         this.var_2019 = param1;
      }
      
      public function get questionArray() : Array
      {
         return this.var_1555;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1555 = param1;
      }
   }
}
