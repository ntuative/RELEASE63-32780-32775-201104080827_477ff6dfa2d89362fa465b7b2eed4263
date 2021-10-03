package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.AcceptQuestMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.quest.GetQuestsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.quest.RejectQuestMessageComposer;
   import com.sulake.habbo.quest.enum.QuestTypeEnum;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   
   public class QuestController implements IDisposable
   {
      
      private static const const_1354:int = 5;
       
      
      private var var_137:HabboQuestEngine;
      
      private var var_1068:Boolean = false;
      
      private var _window:IFrameWindow;
      
      private var var_117:IWindowContainer;
      
      private var var_58:IItemListWindow;
      
      private var var_562:IScrollbarWindow;
      
      private var var_2552:int;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this.var_137 = param1;
      }
      
      public function onToolbarClick() : void
      {
         if(this.var_137.configuration.getKey("questing.enabled","false") != "true")
         {
            this.var_137.windowManager.alert("${quests.workinprogress.title}","${quests.workinprogress.text}",0,this.onAlert);
            return;
         }
         if(this.isVisible())
         {
            this.close();
         }
         else
         {
            this.var_137.send(new GetQuestsMessageComposer());
         }
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.checkTrackerClose(param1);
         if(!this.isVisible() && !param2)
         {
            return;
         }
         this.refresh(param1);
         this._window.visible = true;
         this._window.activate();
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_2552 = param1.id;
         this.prepareTrackerWindow();
         this.refreshTrackerDetails(param1);
         this.var_117.visible = true;
      }
      
      public function onRoomExit() : void
      {
         this.close();
         if(this.var_117 != null && this.var_117.visible)
         {
            this.var_117.findChildByName("more_info_txt").visible = false;
         }
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function get questEngine() : HabboQuestEngine
      {
         return this.var_137;
      }
      
      private function checkTrackerClose(param1:Array) : void
      {
         var _loc2_:* = null;
         if(!this.var_117)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            if(_loc2_.id == this.var_2552 && !_loc2_.available)
            {
               return;
            }
         }
         this.var_117.visible = false;
      }
      
      private function refresh(param1:Array) : void
      {
         var _loc3_:Boolean = false;
         this.prepareWindow();
         this.var_58.autoArrangeItems = false;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < param1.length)
            {
               this.refreshEntry(true,_loc2_,param1[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshEntry(false,_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_58.autoArrangeItems = true;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IFrameWindow(this.var_137.getXmlWindow("Quests"));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this.var_58 = IItemListWindow(this._window.findChildByName("quest_list"));
         this.var_562 = IScrollbarWindow(this._window.findChildByName("scroller"));
         this._window.center();
         this.var_58.spacing = 10;
      }
      
      private function prepareTrackerWindow() : void
      {
         if(this.var_117 != null)
         {
            return;
         }
         this.var_117 = IWindowContainer(this.var_137.getXmlWindow("QuestTracker"));
         var _loc1_:IDesktopWindow = this.var_117.desktop;
         this.var_117.x = _loc1_.width - this.var_117.width - 10;
         this.var_117.y = (_loc1_.height - this.var_117.height) / 2;
         this.var_117.findChildByName("more_info_txt").procedure = this.onMoreInfo;
         this.var_117.findChildByName("more_info_txt").mouseThreshold = 0;
      }
      
      private function refreshEntry(param1:Boolean, param2:int, param3:QuestMessageData) : Boolean
      {
         var _loc4_:IWindowContainer = IWindowContainer(this.var_58.getListItemAt(param2));
         var _loc5_:Boolean = false;
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = this.createListEntry();
            this.var_58.addListItem(_loc4_);
            _loc5_ = true;
         }
         if(param1)
         {
            this.refreshEntryDetails(_loc4_,param3);
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.visible = false;
         }
         return false;
      }
      
      private function createListEntry() : IWindowContainer
      {
         var _loc1_:IWindowContainer = IWindowContainer(this.var_137.getXmlWindow("QuestEntry"));
         var _loc2_:IWindowContainer = IWindowContainer(this.var_137.getXmlWindow("Campaign"));
         var _loc3_:IWindowContainer = IWindowContainer(this.var_137.getXmlWindow("Quest"));
         _loc1_.addChild(_loc2_);
         _loc1_.addChild(_loc3_);
         _loc3_.findChildByName("accept_button").procedure = this.onAcceptQuest;
         _loc3_.findChildByName("cancel_txt").procedure = this.onCancelQuest;
         _loc3_.x = _loc2_.x + _loc2_.width + const_1354;
         _loc3_.height = _loc2_.height;
         _loc1_.width = _loc3_.x + _loc3_.width;
         _loc1_.height = _loc2_.height;
         return _loc1_;
      }
      
      private function refreshEntryDetails(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         param1.findChildByName("campaign_header_txt").caption = this.getCampaignName(param2);
         param1.findChildByName("completion_txt").caption = param2.completedQuestsInCampaign + "/" + param2.questCountInCampaign;
         param1.findChildByName("quest_header_txt").caption = this.getQuestTitle(param2);
         param1.findChildByName("desc_txt").caption = this.getQuestDesc(param2);
         param1.findChildByName("cancel_txt").visible = !param2.available;
         param1.findChildByName("cancel_txt").mouseThreshold = 0;
         param1.findChildByName("accept_button").visible = param2.available;
         param1.findChildByName("accept_button").id = param2.id;
         var _loc3_:* = !param2.available;
         this.setColor(param1,"quest_bg",_loc3_,15982264,13158600);
         this.setColor(param1,"quest_header",_loc3_,15577658,9276813);
         this.setColor(param1,"bg",_loc3_,4290944315,4284769380);
         this.setColor(param1,"bg_top",_loc3_,4294956936,4290427578);
         this.setColor(param1,"bg_bottom",_loc3_,4294952792,4289440683);
         this.setupQuestImage(param1,param2);
         this.setupRewardImage(param1,param2);
         this.setupCampaignImage(param1,param2);
      }
      
      private function getQuestLocalizationKey(param1:QuestMessageData) : String
      {
         return "quest_" + param1.campaignCode + "_" + param1.localizationCode;
      }
      
      private function getQuestTitle(param1:QuestMessageData) : String
      {
         var _loc2_:* = this.getQuestLocalizationKey(param1) + ".short";
         return this.getCampaignName(param1) + ": " + (param1.completedQuestsInCampaign + 1) + "/" + param1.questCountInCampaign + ": " + this.questEngine.localization.getKey(_loc2_,_loc2_);
      }
      
      private function getQuestDesc(param1:QuestMessageData) : String
      {
         var _loc2_:* = this.getQuestLocalizationKey(param1) + ".desc";
         return this.questEngine.localization.getKey(_loc2_,_loc2_);
      }
      
      private function getCampaignName(param1:QuestMessageData) : String
      {
         return this.questEngine.localization.getKey("quest_" + param1.campaignCode + ".tab");
      }
      
      private function setColor(param1:IWindowContainer, param2:String, param3:Boolean, param4:uint, param5:uint) : void
      {
         param1.findChildByName(param2).color = !!param3 ? uint(param4) : uint(param5);
      }
      
      private function refreshTrackerDetails(param1:QuestMessageData) : void
      {
         this.var_117.findChildByName("header_txt").caption = this.getQuestTitle(param1);
         this.var_117.findChildByName("desc_txt").caption = this.getQuestDesc(param1);
         this.var_117.findChildByName("more_info_txt").visible = true;
         this.setupQuestImage(this.var_117,param1);
      }
      
      private function onAcceptQuest(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Accept quest: " + _loc3_);
         this.var_137.send(new AcceptQuestMessageComposer(_loc3_));
         this._window.visible = false;
      }
      
      private function onCancelQuest(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Reject quest");
         this.var_137.send(new RejectQuestMessageComposer());
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this.isVisible())
         {
            this.close();
         }
         else
         {
            this.questEngine.send(new GetQuestsMessageComposer());
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      public function dispose() : void
      {
         this.var_1068 = true;
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1068;
      }
      
      private function setupQuestImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("quest_pic_bitmap"));
         if(_loc3_.id == param2.id)
         {
            Logger.log("No need to refresh image...");
            return;
         }
         _loc3_.id = param2.id;
         if(param2.type == QuestTypeEnum.FIND_STUFF)
         {
            _loc4_ = param2.roomItemTypeName.split("*");
            _loc5_ = _loc4_.length > 0 ? _loc4_[0] : "";
            _loc6_ = _loc4_.length > 1 ? int(parseInt(_loc4_[1])) : 0;
            _loc7_ = this.var_137.sessionDataManager.getFloorItemDataByName(_loc5_,_loc6_);
            if(_loc7_)
            {
               new PendingFurniImage(this.var_137,_loc3_,_loc7_,_loc6_);
            }
         }
         else if(param2.type == QuestTypeEnum.FIND_HIDDEN_STUFF)
         {
            new PendingImage(this.var_137,_loc3_,"icon_quest_hidden");
         }
         else if(param2.type == QuestTypeEnum.GIVE_BADGE)
         {
            new PendingImage(this.var_137,_loc3_,"NewUserBadgeReceiver");
         }
         else
         {
            QuestUtils.setElementImage(_loc3_,new BitmapData(1,1,true));
         }
      }
      
      private function setupRewardImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("currency_bitmap"));
         if(_loc3_.id == param2.id)
         {
            Logger.log("No need to refresh reward image...");
            return;
         }
         _loc3_.id = param2.id;
         var _loc4_:String = "icon_" + param2.campaignCode + "_reward_" + param2.rewardCurrencyAmount;
         new PendingImage(this.var_137,_loc3_,_loc4_,true);
      }
      
      private function setupCampaignImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("campaign_pic_bitmap"));
         if(_loc3_.tags[0] == param2.campaignCode)
         {
            Logger.log("No need to refresh campaign image...");
            return;
         }
         _loc3_.tags[0] = param2.campaignCode;
         new PendingImage(this.var_137,_loc3_,"icon_quest_hidden",true);
      }
      
      public function onAlert(param1:IAlertDialog, param2:WindowEvent) : void
      {
         if(param2.type == WindowEvent.const_172 || param2.type == WindowEvent.const_477)
         {
            param1.dispose();
         }
      }
   }
}
