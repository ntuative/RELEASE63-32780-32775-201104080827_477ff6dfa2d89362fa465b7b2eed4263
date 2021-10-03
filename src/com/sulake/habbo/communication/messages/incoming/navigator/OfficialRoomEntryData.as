package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1124:int = 1;
      
      public static const const_887:int = 2;
      
      public static const const_645:int = 3;
      
      public static const const_1732:int = 4;
       
      
      private var _index:int;
      
      private var var_2631:String;
      
      private var var_2628:String;
      
      private var var_2630:Boolean;
      
      private var var_2629:String;
      
      private var var_924:String;
      
      private var var_2627:int;
      
      private var var_2118:int;
      
      private var _type:int;
      
      private var var_2437:String;
      
      private var var_990:GuestRoomData;
      
      private var var_989:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2631 = param1.readString();
         this.var_2628 = param1.readString();
         this.var_2630 = param1.readInteger() == 1;
         this.var_2629 = param1.readString();
         this.var_924 = param1.readString();
         this.var_2627 = param1.readInteger();
         this.var_2118 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1124)
         {
            this.var_2437 = param1.readString();
         }
         else if(this._type == const_645)
         {
            this.var_989 = new PublicRoomData(param1);
         }
         else if(this._type == const_887)
         {
            this.var_990 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_990 != null)
         {
            this.var_990.dispose();
            this.var_990 = null;
         }
         if(this.var_989 != null)
         {
            this.var_989.dispose();
            this.var_989 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2631;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2628;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2630;
      }
      
      public function get picText() : String
      {
         return this.var_2629;
      }
      
      public function get picRef() : String
      {
         return this.var_924;
      }
      
      public function get folderId() : int
      {
         return this.var_2627;
      }
      
      public function get tag() : String
      {
         return this.var_2437;
      }
      
      public function get userCount() : int
      {
         return this.var_2118;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_990;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_989;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1124)
         {
            return 0;
         }
         if(this.type == const_887)
         {
            return this.var_990.maxUserCount;
         }
         if(this.type == const_645)
         {
            return this.var_989.maxUsers;
         }
         return 0;
      }
   }
}
