package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_588:int = 0;
      
      public static const const_200:int = 1;
      
      public static const const_115:int = 2;
      
      public static const const_785:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1825:String;
      
      private var var_2227:int;
      
      private var var_1456:int;
      
      private var var_2621:int;
      
      private var var_2634:int;
      
      private var var_862:Array;
      
      private var var_2624:Array;
      
      private var var_2633:int;
      
      private var var_2622:Boolean;
      
      private var var_2619:Boolean;
      
      private var var_2620:Boolean;
      
      private var var_2623:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2622;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2622 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2619;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2619 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2620;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2620 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2623;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2623 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1825;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1825 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2227;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2227 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1456;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1456 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2621;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2621 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2634;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2634 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_862;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_862 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2624;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2624 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2633;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2633 = param1;
      }
   }
}
