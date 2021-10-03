package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1922:int;
      
      private var _currentPosition:int;
      
      private var var_1923:int;
      
      private var var_1920:int;
      
      private var var_1921:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1922;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1923;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1920;
      }
      
      public function get syncCount() : int
      {
         return this.var_1921;
      }
      
      public function flush() : Boolean
      {
         this.var_1922 = -1;
         this._currentPosition = -1;
         this.var_1923 = -1;
         this.var_1920 = -1;
         this.var_1921 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1922 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1923 = param1.readInteger();
         this.var_1920 = param1.readInteger();
         this.var_1921 = param1.readInteger();
         return true;
      }
   }
}
