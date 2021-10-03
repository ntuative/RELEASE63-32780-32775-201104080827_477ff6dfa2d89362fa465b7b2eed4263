package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2238:String;
      
      private var var_2235:int;
      
      private var var_2149:int;
      
      private var var_2236:String;
      
      private var var_2237:int;
      
      private var var_1810:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2238 = param1.readString();
         this.var_2235 = param1.readInteger();
         this.var_2149 = param1.readInteger();
         this.var_2236 = param1.readString();
         this.var_2237 = param1.readInteger();
         this.var_1810 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2238;
      }
      
      public function get unitPort() : int
      {
         return this.var_2235;
      }
      
      public function get worldId() : int
      {
         return this.var_2149;
      }
      
      public function get castLibs() : String
      {
         return this.var_2236;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2237;
      }
      
      public function get nodeId() : int
      {
         return this.var_1810;
      }
   }
}
