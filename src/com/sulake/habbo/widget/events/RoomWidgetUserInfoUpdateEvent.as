package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_117:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_151:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1205:int = 2;
      
      public static const const_1133:int = 3;
      
      public static const const_1612:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1782:String = "";
      
      private var var_2361:int;
      
      private var var_2359:int = 0;
      
      private var var_2357:int = 0;
      
      private var var_687:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_279:Array;
      
      private var var_1499:int = 0;
      
      private var var_2519:String = "";
      
      private var var_2518:int = 0;
      
      private var var_2520:int = 0;
      
      private var var_1843:Boolean = false;
      
      private var var_1781:String = "";
      
      private var var_2745:Boolean = false;
      
      private var var_2744:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2746:Boolean = false;
      
      private var var_2747:Boolean = false;
      
      private var var_2742:Boolean = false;
      
      private var var_2743:Boolean = false;
      
      private var var_2748:Boolean = false;
      
      private var var_2749:Boolean = false;
      
      private var var_2750:int = 0;
      
      private var var_1844:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_279 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1782 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1782;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2361 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2361;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2359 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2359;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2357 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2357;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_687 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_687;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_279 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_279;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1499 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1499;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2519 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2519;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2745 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2745;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2746 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2746;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2747 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2747;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2742 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2742;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2743 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2743;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2748 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2748;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2749 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2749;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2750 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2750;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2744 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2744;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1844 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1844;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2518 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2518;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2520 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2520;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1843 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1843;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1781 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1781;
      }
   }
}
