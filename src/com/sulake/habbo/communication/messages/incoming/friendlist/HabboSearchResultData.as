package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2351:int;
      
      private var var_1785:String;
      
      private var var_2349:String;
      
      private var var_2352:Boolean;
      
      private var var_2354:Boolean;
      
      private var var_2353:int;
      
      private var var_2355:String;
      
      private var var_2350:String;
      
      private var var_1781:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2351 = param1.readInteger();
         this.var_1785 = param1.readString();
         this.var_2349 = param1.readString();
         this.var_2352 = param1.readBoolean();
         this.var_2354 = param1.readBoolean();
         param1.readString();
         this.var_2353 = param1.readInteger();
         this.var_2355 = param1.readString();
         this.var_2350 = param1.readString();
         this.var_1781 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2351;
      }
      
      public function get avatarName() : String
      {
         return this.var_1785;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2349;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2352;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2354;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2353;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2355;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2350;
      }
      
      public function get realName() : String
      {
         return this.var_1781;
      }
   }
}
