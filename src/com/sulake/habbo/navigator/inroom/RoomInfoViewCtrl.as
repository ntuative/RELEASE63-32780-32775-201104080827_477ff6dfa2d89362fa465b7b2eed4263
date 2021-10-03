package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_2895:int;
      
      private var var_340:RoomEventViewCtrl;
      
      private var var_246:Timer;
      
      private var var_175:RoomSettingsCtrl;
      
      private var var_245:RoomThumbnailCtrl;
      
      private var var_1300:TagRenderer;
      
      private var var_296:IWindowContainer;
      
      private var var_413:IWindowContainer;
      
      private var var_726:IWindowContainer;
      
      private var var_2291:IWindowContainer;
      
      private var var_2292:IWindowContainer;
      
      private var var_1375:IWindowContainer;
      
      private var var_1013:ITextWindow;
      
      private var var_1111:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_906:ITextWindow;
      
      private var var_1376:ITextWindow;
      
      private var var_1109:ITextWindow;
      
      private var var_904:ITextWindow;
      
      private var var_1677:ITextWindow;
      
      private var var_247:IWindowContainer;
      
      private var var_907:IWindowContainer;
      
      private var var_1679:IWindowContainer;
      
      private var var_2170:ITextWindow;
      
      private var var_725:ITextWindow;
      
      private var var_2293:IWindow;
      
      private var var_1371:IContainerButtonWindow;
      
      private var var_1378:IContainerButtonWindow;
      
      private var var_1370:IContainerButtonWindow;
      
      private var var_1377:IContainerButtonWindow;
      
      private var var_1373:IContainerButtonWindow;
      
      private var var_1372:IContainerButtonWindow;
      
      private var var_1676:IButtonWindow;
      
      private var var_1678:IButtonWindow;
      
      private var var_1675:IButtonWindow;
      
      private var var_908:IWindowContainer;
      
      private var var_1374:ITextWindow;
      
      private var var_1112:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_1110:IButtonWindow;
      
      private var var_905:IButtonWindow;
      
      private var var_2290:String;
      
      private var var_2294:String;
      
      private var var_909:Boolean = true;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_340 = new RoomEventViewCtrl(this._navigator);
         this.var_175 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_245 = new RoomThumbnailCtrl(this._navigator);
         this.var_1300 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_175);
         this.var_246 = new Timer(6000,1);
         this.var_246.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_100,this.onToolbarIconState);
         }
         if(this.var_246)
         {
            this.var_246.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_246.reset();
            this.var_246 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_246.reset();
         this.var_340.active = true;
         this.var_175.active = false;
         this.var_245.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_246.reset();
         this.var_175.load(param1);
         this.var_175.active = true;
         this.var_340.active = false;
         this.var_245.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_175.active = true;
         this.var_340.active = false;
         this.var_245.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_246.reset();
         this.var_175.active = false;
         this.var_340.active = false;
         this.var_245.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this.var_909)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1222,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_246.reset();
         this.var_340.active = false;
         this.var_175.active = false;
         this.var_245.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         if(this.var_909)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_246.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_246.reset();
         this.var_340.active = false;
         this.var_175.active = false;
         this.var_245.active = false;
         this.refresh();
         if(this.var_909)
         {
            if(!this._window.visible)
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
               this._window.parent.activate();
            }
            else
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_594,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            }
         }
         else
         {
            this._window.visible = !this._window.visible;
            this._window.center();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_296.rectangle + ", " + this.var_247.rectangle + ", " + this._window.rectangle);
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_296);
         this.var_296.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_175.refresh(this.var_296);
         this.var_245.refresh(this.var_296);
         Util.moveChildrenToColumn(this.var_296,["room_details","room_buttons"],0,2);
         this.var_296.height = Util.getLowestPoint(this.var_296);
         this.var_296.visible = true;
         Logger.log("XORP: " + this.var_413.visible + ", " + this.var_1375.visible + ", " + this.var_726.visible + ", " + this.var_726.rectangle + ", " + this.var_296.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_247);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_340.refresh(this.var_247);
         if(Util.hasVisibleChildren(this.var_247) && !(this.var_175.active || this.var_245.active))
         {
            Util.moveChildrenToColumn(this.var_247,["event_details","event_buttons"],0,2);
            this.var_247.height = Util.getLowestPoint(this.var_247);
            this.var_247.visible = true;
         }
         else
         {
            this.var_247.visible = false;
         }
         Logger.log("EVENT: " + this.var_247.visible + ", " + this.var_247.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_175.active && !this.var_245.active && !this.var_340.active)
         {
            this.var_908.visible = true;
            this.var_1112.text = this.getEmbedData();
         }
         else
         {
            this.var_908.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_175.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_1110)
         {
            if(this.var_2290 == "exit_homeroom")
            {
               this.var_1110.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1110.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_905)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_905.visible = _loc1_;
            if(this.var_2294 == "0")
            {
               this.var_905.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_905.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_175.active || this.var_245.active)
         {
            return;
         }
         this.var_1013.text = param1.roomName;
         this.var_1013.height = this.var_1013.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_906.text = param1.description;
         this.var_1300.refreshTags(this.var_413,param1.tags);
         this.var_906.visible = false;
         if(param1.description != "")
         {
            this.var_906.height = this.var_906.textHeight + 5;
            this.var_906.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1378,"facebook_logo_small",_loc3_,null,0);
         this.var_1378.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1371,"thumb_up",_loc4_,null,0);
         this.var_1371.visible = _loc4_;
         this.var_904.visible = !_loc4_;
         this.var_1677.visible = !_loc4_;
         this.var_1677.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_413,"home",param2,null,0);
         this._navigator.refreshButton(this.var_413,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_413,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_1013.y,0);
         this.var_413.visible = true;
         this.var_413.height = Util.getLowestPoint(this.var_413);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_413.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_175.active || this.var_245.active)
         {
            return;
         }
         this.var_1111.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1111.height = this.var_1111.textHeight + 5;
         this.var_1376.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1376.height = this.var_1376.textHeight + 5;
         Util.moveChildrenToColumn(this.var_726,["public_space_name","public_space_desc"],this.var_1111.y,0);
         this.var_726.visible = true;
         this.var_726.height = Math.max(86,Util.getLowestPoint(this.var_726));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_340.active)
         {
            return;
         }
         this.var_2170.text = param1.eventName;
         this.var_725.text = param1.eventDescription;
         this.var_1300.refreshTags(this.var_907,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_725.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_725.height = this.var_725.textHeight + 5;
            this.var_725.y = Util.getLowestPoint(this.var_907) + 2;
            this.var_725.visible = true;
         }
         this.var_907.visible = true;
         this.var_907.height = Util.getLowestPoint(this.var_907);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_175.active || this.var_245.active)
         {
            return;
         }
         this.var_1676.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1370.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1377.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1373.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1372.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1375.visible = Util.hasVisibleChildren(this.var_1375);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_340.active)
         {
            return;
         }
         this.var_1678.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1675.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1679.visible = Util.hasVisibleChildren(this.var_1679);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_62,false);
         this._window.setParamFlag(HabboWindowParam.const_1745,true);
         this._window.visible = false;
         this.var_296 = IWindowContainer(this.find("room_info"));
         this.var_413 = IWindowContainer(this.find("room_details"));
         this.var_726 = IWindowContainer(this.find("public_space_details"));
         this.var_2291 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2292 = IWindowContainer(this.find("rating_cont"));
         this.var_1375 = IWindowContainer(this.find("room_buttons"));
         this.var_1013 = ITextWindow(this.find("room_name"));
         this.var_1111 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_906 = ITextWindow(this.find("room_desc"));
         this.var_1376 = ITextWindow(this.find("public_space_desc"));
         this.var_1109 = ITextWindow(this.find("owner_caption"));
         this.var_904 = ITextWindow(this.find("rating_caption"));
         this.var_1677 = ITextWindow(this.find("rating_txt"));
         this.var_247 = IWindowContainer(this.find("event_info"));
         this.var_907 = IWindowContainer(this.find("event_details"));
         this.var_1679 = IWindowContainer(this.find("event_buttons"));
         this.var_2170 = ITextWindow(this.find("event_name"));
         this.var_725 = ITextWindow(this.find("event_desc"));
         this.var_1378 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1371 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2293 = this.find("staff_pick_button");
         this.var_1370 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1377 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1373 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1372 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1676 = IButtonWindow(this.find("room_settings_button"));
         this.var_1678 = IButtonWindow(this.find("create_event_button"));
         this.var_1675 = IButtonWindow(this.find("edit_event_button"));
         this.var_908 = IWindowContainer(this.find("embed_info"));
         this.var_1374 = ITextWindow(this.find("embed_info_txt"));
         this.var_1112 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_1110 = IButtonWindow(this.find("exit_room_button"));
         this.var_905 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1370,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1377,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1676,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1373,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1372,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1678,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1675,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1112,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1371,this.onThumbUp);
         Util.setProcDirectly(this.var_2293,this.onStaffPick);
         Util.setProcDirectly(this.var_1378,this.onFacebookLike);
         Util.setProcDirectly(this.var_905,this.onZoomClick);
         Util.setProcDirectly(this.var_1110,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1370,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1377,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1373,"home",true,null,0);
         this._navigator.refreshButton(this.var_1372,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_296,this.onHover);
         Util.setProcDirectly(this.var_247,this.onHover);
         this.var_1109.width = this.var_1109.textWidth;
         Util.moveChildrenToRow(this.var_2291,["owner_caption","owner_name"],this.var_1109.x,this.var_1109.y,3);
         this.var_904.width = this.var_904.textWidth;
         Util.moveChildrenToRow(this.var_2292,["rating_caption","rating_txt"],this.var_904.x,this.var_904.y,3);
         this.var_1374.height = this.var_1374.textHeight + 5;
         Util.moveChildrenToColumn(this.var_908,["embed_info_txt","embed_src_txt"],this.var_1374.y,2);
         this.var_908.height = Util.getLowestPoint(this.var_908) + 5;
         this.var_2895 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1112.setSelection(0,this.var_1112.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_100)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2294 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2290 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_246.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         if(this.var_909)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_594,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         else
         {
            this._window.visible = false;
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_100,this.onToolbarIconState);
         }
      }
      
      public function handleToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(!this.var_909 || param1.type != HabboToolbarEvent.const_36)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.MEMENU:
               this.close();
               break;
            case HabboToolbarIconEnum.ROOMINFO:
               this.toggle();
         }
      }
      
      public function configure() : void
      {
         if(this._navigator.configuration)
         {
            this.var_909 = this._navigator.configuration.getKey("roominfo.widget.enabled") != "1";
         }
      }
   }
}
