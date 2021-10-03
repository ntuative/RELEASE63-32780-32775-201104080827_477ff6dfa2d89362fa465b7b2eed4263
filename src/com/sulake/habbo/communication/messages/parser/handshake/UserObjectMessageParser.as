package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_687:String;
      
      private var var_930:String;
      
      private var var_2280:String;
      
      private var var_1781:String;
      
      private var var_2281:int;
      
      private var var_2278:String;
      
      private var var_2284:int;
      
      private var var_2283:int;
      
      private var var_2282:int;
      
      private var _respectLeft:int;
      
      private var var_791:int;
      
      private var var_2279:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_687 = param1.readString();
         this.var_930 = param1.readString();
         this.var_2280 = param1.readString();
         this.var_1781 = param1.readString();
         this.var_2281 = param1.readInteger();
         this.var_2278 = param1.readString();
         this.var_2284 = param1.readInteger();
         this.var_2283 = param1.readInteger();
         this.var_2282 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_791 = param1.readInteger();
         this.var_2279 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_687;
      }
      
      public function get sex() : String
      {
         return this.var_930;
      }
      
      public function get customData() : String
      {
         return this.var_2280;
      }
      
      public function get realName() : String
      {
         return this.var_1781;
      }
      
      public function get tickets() : int
      {
         return this.var_2281;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2278;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2284;
      }
      
      public function get directMail() : int
      {
         return this.var_2283;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2282;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_791;
      }
      
      public function get identityId() : int
      {
         return this.var_2279;
      }
   }
}
