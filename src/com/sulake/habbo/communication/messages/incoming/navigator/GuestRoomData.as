package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_362:int;
      
      private var var_765:Boolean;
      
      private var var_1013:String;
      
      private var _ownerName:String;
      
      private var var_2227:int;
      
      private var var_2118:int;
      
      private var var_2667:int;
      
      private var var_1825:String;
      
      private var var_2668:int;
      
      private var var_2229:Boolean;
      
      private var var_755:int;
      
      private var var_1456:int;
      
      private var var_2666:String;
      
      private var var_862:Array;
      
      private var var_2665:RoomThumbnailData;
      
      private var var_2622:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_862 = new Array();
         super();
         this.var_362 = param1.readInteger();
         this.var_765 = param1.readBoolean();
         this.var_1013 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2227 = param1.readInteger();
         this.var_2118 = param1.readInteger();
         this.var_2667 = param1.readInteger();
         this.var_1825 = param1.readString();
         this.var_2668 = param1.readInteger();
         this.var_2229 = param1.readBoolean();
         this.var_755 = param1.readInteger();
         this.var_1456 = param1.readInteger();
         this.var_2666 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_862.push(_loc4_);
            _loc3_++;
         }
         this.var_2665 = new RoomThumbnailData(param1);
         this.var_2622 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_862 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_362;
      }
      
      public function get event() : Boolean
      {
         return this.var_765;
      }
      
      public function get roomName() : String
      {
         return this.var_1013;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2227;
      }
      
      public function get userCount() : int
      {
         return this.var_2118;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2667;
      }
      
      public function get description() : String
      {
         return this.var_1825;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2668;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2229;
      }
      
      public function get score() : int
      {
         return this.var_755;
      }
      
      public function get categoryId() : int
      {
         return this.var_1456;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2666;
      }
      
      public function get tags() : Array
      {
         return this.var_862;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2665;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2622;
      }
   }
}
