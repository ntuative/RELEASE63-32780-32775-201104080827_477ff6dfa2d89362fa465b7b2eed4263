package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_996:int = 127;
      
      private static const const_1788:int = 40;
      
      private static const const_1789:int = -1;
      
      private static const const_354:int = 1;
      
      private static const const_1387:int = -4;
      
      private static const const_998:int = 80;
      
      private static const const_1389:Boolean = false;
      
      private static const const_1393:String = "bar_xml";
      
      private static const const_1391:String = "toggle_xml";
      
      private static const const_353:String = "list";
      
      private static const const_664:String = "header";
      
      private static const const_626:String = "canvas";
      
      private static const const_997:String = "button_left";
      
      private static const const_995:String = "button_right";
      
      private static const const_1388:String = "button_left_page";
      
      private static const const_1386:String = "button_right_page";
      
      private static const const_1385:String = "button_left_end";
      
      private static const const_1392:String = "button_right_end";
      
      private static const const_1258:String = "button_close";
      
      private static const const_1390:String = "button_open";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1122:IAvatarRenderManager;
      
      private var var_183:IHabboFriendBarData;
      
      private var var_45:IWindowContainer;
      
      private var var_209:IWindowContainer;
      
      private var var_208:Vector.<ITab>;
      
      private var var_1506:ITab;
      
      private var var_1246:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1507:TextCropper;
      
      private var var_1508:Boolean = false;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1507 = new TextCropper();
         this.var_208 = new Vector.<ITab>();
         if(param1 is HabboFriendBar)
         {
            this.var_1508 = HabboFriendBar(param1).findFriendsEnabled;
         }
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_354).getDesktopWindow().removeEventListener(WindowEvent.const_38,this.onDesktopResized);
            if(this.var_209)
            {
               this.var_209.dispose();
               this.var_209 = null;
            }
            if(this.var_45)
            {
               this.var_45.dispose();
               this.var_45 = null;
            }
            while(this.var_208.length > 0)
            {
               ITab(this.var_208.pop()).dispose();
            }
            if(this.var_183)
            {
               this.var_183.events.removeEventListener(FriendBarUpdateEvent.const_458,this.onRefreshView);
               this.var_183 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1122)
            {
               this.var_1122 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1507.dispose();
            this.var_1507 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_45)
         {
            this.var_45.visible = param1;
            this.var_45.activate();
         }
         if(this.var_209)
         {
            this.var_209.visible = !param1;
            if(this.var_45)
            {
               this.var_209.x = this.var_45.x;
               this.var_209.y = this.var_45.y;
               this.var_209.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_45 && this.var_45.visible;
      }
      
      public function populate() : void
      {
         var _loc4_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc1_:int = this.var_1246;
         this.deSelect();
         var _loc2_:IItemListWindow = this.var_45.findChildByName(const_353) as IItemListWindow;
         _loc2_.autoArrangeItems = false;
         var _loc3_:int = _loc2_.numListItems;
         _loc4_ = _loc3_;
         while(_loc4_ > 0)
         {
            _loc2_.removeListItemAt(_loc4_ - 1);
            _loc4_--;
         }
         while(this.var_208.length > 0)
         {
            this.var_208.pop().recycle();
         }
         var _loc5_:int = this.var_183.numFriends + (!!this.var_1508 ? 1 : 0);
         var _loc6_:int = Math.min(this.maxNumOfTabsVisible,_loc5_);
         if(this._startIndex + _loc6_ > _loc5_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc6_ - _loc5_));
         }
         _loc3_ = Math.min(this.var_183.numFriends,this._startIndex + _loc6_);
         _loc4_ = this._startIndex;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = this.var_183.getFriendAt(_loc4_);
            _loc8_ = FriendEntityTab.allocate(_loc7_);
            this.var_208.push(_loc8_);
            _loc2_.addListItem(_loc8_.window);
            _loc4_++;
         }
         if(this.var_1508)
         {
            if(this.var_208.length < this.maxNumOfTabsVisible)
            {
               _loc9_ = new AddFriendsEntityTab();
               _loc2_.addListItem(_loc9_.window);
               this.var_208.push(_loc9_);
            }
         }
         _loc2_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         this.visible = this.var_208.length > 0;
         this.toggleArrowButtons(this.var_208.length < _loc5_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_208.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_208[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function getEntityTabByWindow(param1:IWindow) : ITab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_208.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_208[_loc4_];
            if(_loc2_.window == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_183 = param2 as IHabboFriendBarData;
         this.var_183.events.addEventListener(FriendBarUpdateEvent.const_458,this.onRefreshView);
         this.var_183.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_45 && !this.var_45.disposed;
      }
      
      private function buildUserInterface() : void
      {
         Tab.var_1057 = this.var_183;
         Tab.var_1059 = this;
         Tab.var_859 = assets;
         Tab.var_1305 = this._windowManager;
         Tab.var_2072 = this.var_1507;
         var _loc1_:IAsset = assets.getAssetByName(const_1393);
         this.var_45 = this._windowManager.buildFromXML(_loc1_.content as XML,const_354) as IWindowContainer;
         this.var_45.x = this.var_45.parent.width / 2 - this.var_45.width / 2;
         this.var_45.y = this.var_45.parent.height - (this.var_45.height + const_1387);
         this.var_45.setParamFlag(WindowParam.const_280,true);
         this.var_45.procedure = this.barWindowEventProc;
         if(const_1389)
         {
            _loc1_ = assets.getAssetByName(const_1391);
            this.var_209 = this._windowManager.buildFromXML(_loc1_.content as XML,const_354) as IWindowContainer;
            this.var_209.x = this.var_45.x;
            this.var_209.y = this.var_45.y;
            this.var_209.setParamFlag(WindowParam.const_280,true);
            this.var_209.visible = false;
            this.var_209.procedure = this.toggleWindowEventProc;
         }
         this.visible = true;
         this._windowManager.getWindowContext(const_354).getDesktopWindow().addEventListener(WindowEvent.const_38,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1122 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1122)
            {
               _loc3_ = this.var_1122.createAvatarImage(param1,AvatarScaleType.const_52,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_51);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_45.findChildByName(const_353) as IItemListWindow;
         var _loc4_:int = this.var_183.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_183.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_353) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_664));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_626) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_1246 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1506)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1506 = param1;
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_1246 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_1246 = param1;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1506)
         {
            this.var_1506.deselect();
            this.var_1246 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_577);
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_45)
         {
            _loc3_ = this._startIndex;
            switch(param2.name)
            {
               case const_997:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1388:
                  _loc3_ = Math.max(0,this._startIndex - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1385:
                  _loc3_ = 0;
                  break;
               case const_995:
                  _loc3_ = Math.max(0,Math.min(this.var_183.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + 1));
                  break;
               case const_1386:
                  _loc3_ = Math.max(0,Math.min(this.var_183.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + this.numTabsVisibleAtCurrentSize));
                  break;
               case const_1392:
                  _loc3_ = Math.max(0,this.var_183.numFriends - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1258:
                  this.visible = false;
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_608)
         {
            this.deSelect();
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_209.visible)
         {
            if(param1.type == WindowMouseEvent.const_45)
            {
               switch(param2.name)
               {
                  case const_1390:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         this.var_45.findChildByName(const_995).visible = param1;
         this.var_45.findChildByName(const_997).visible = param1;
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_45)
            {
               _loc2_ = Math.min(this.maxNumOfTabsVisible,this.var_183.numFriends + (!!this.var_1508 ? 1 : 0));
               if(this.var_208.length != _loc2_ || param1)
               {
                  this.populate();
               }
               this.var_45.x = Math.max(this.var_45.parent.width / 2 - this.var_45.width / 2,const_998);
            }
         }
      }
      
      private function get numTabsVisibleAtCurrentSize() : int
      {
         var _loc1_:IItemListWindow = this.var_45.findChildByName(const_353) as IItemListWindow;
         return _loc1_.width / (const_996 + _loc1_.spacing);
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IItemListWindow = this.var_45.findChildByName(const_353) as IItemListWindow;
         var _loc2_:int = this._windowManager.getWindowContext(const_354).getDesktopWindow().width - const_998;
         var _loc3_:int = this.var_45.width - _loc1_.width;
         return (_loc2_ - _loc3_) / (const_996 + _loc1_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
