package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_783:String = "RWUAM_WHISPER_USER";
      
      public static const const_795:String = "RWUAM_IGNORE_USER";
      
      public static const const_804:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_571:String = "RWUAM_KICK_USER";
      
      public static const const_691:String = "RWUAM_BAN_USER";
      
      public static const const_745:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_666:String = "RWUAM_RESPECT_USER";
      
      public static const const_861:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_754:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_929:String = "RWUAM_START_TRADING";
      
      public static const const_869:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_466:String = "RWUAM_KICK_BOT";
      
      public static const const_779:String = "RWUAM_REPORT";
      
      public static const const_525:String = "RWUAM_PICKUP_PET";
      
      public static const const_1639:String = "RWUAM_TRAIN_PET";
      
      public static const const_495:String = " RWUAM_RESPECT_PET";
      
      public static const const_421:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_733:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
