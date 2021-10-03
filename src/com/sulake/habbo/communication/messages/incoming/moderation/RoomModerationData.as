package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_362:int;
      
      private var var_2118:int;
      
      private var var_2117:Boolean;
      
      private var var_2116:int;
      
      private var _ownerName:String;
      
      private var var_119:RoomData;
      
      private var var_765:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_362 = param1.readInteger();
         this.var_2118 = param1.readInteger();
         this.var_2117 = param1.readBoolean();
         this.var_2116 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_119 = new RoomData(param1);
         this.var_765 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_119 != null)
         {
            this.var_119.dispose();
            this.var_119 = null;
         }
         if(this.var_765 != null)
         {
            this.var_765.dispose();
            this.var_765 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_362;
      }
      
      public function get userCount() : int
      {
         return this.var_2118;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2117;
      }
      
      public function get ownerId() : int
      {
         return this.var_2116;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_119;
      }
      
      public function get event() : RoomData
      {
         return this.var_765;
      }
   }
}
