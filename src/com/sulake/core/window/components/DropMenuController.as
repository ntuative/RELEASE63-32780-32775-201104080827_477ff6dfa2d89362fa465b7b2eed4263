package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowTouchEvent;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
   import flash.geom.Rectangle;
   
   public class DropMenuController extends InteractiveController implements IDropMenuWindow, ITouchAwareWindow
   {
      
      protected static const const_430:String = "_DROPMENU_TITLETEXT";
      
      protected static const ITEMLIST_NAME:String = "_DROPMENU_ITEMLIST";
       
      
      private var var_278:Array;
      
      private var var_679:int = -1;
      
      private var var_1045:Boolean = false;
      
      private var var_191:DropMenuController;
      
      public function DropMenuController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         this.var_278 = new Array();
         param4 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get selection() : int
      {
         return this.var_679;
      }
      
      public function set selection(param1:int) : void
      {
         if(param1 > this.var_278.lenght - 1)
         {
            throw new Error("Menu selection index out of range!");
         }
         var _loc2_:WindowEvent = WindowEvent.allocate(WindowEvent.const_297,this,null,true);
         this.update(this,_loc2_);
         if(!_loc2_.isWindowOperationPrevented())
         {
            _loc2_.recycle();
            this.var_679 = param1;
            this.closeMenuView();
            _loc2_ = WindowEvent.allocate(WindowEvent.const_57,this,null);
            this.update(this,_loc2_);
         }
         _loc2_.recycle();
      }
      
      override public function set caption(param1:String) : void
      {
         super.caption = param1;
         this.getTitleLabel().text = param1;
      }
      
      override public function dispose() : void
      {
         if(this.var_191 != null && !this.var_191.disposed)
         {
            this.var_191.destroy();
            this.var_191 = null;
         }
         super.dispose();
      }
      
      override public function activate() : Boolean
      {
         if(this.var_1045)
         {
            return true;
         }
         return super.activate();
      }
      
      private function getTitleLabel() : ILabelWindow
      {
         return getChildByName(DropMenuController.const_430) as ILabelWindow;
      }
      
      private function getSubMenu() : DropMenuController
      {
         var _loc1_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc1_);
         if(this.var_191 == null || this.var_191.disposed)
         {
            this.var_191 = context.create(name + "::submenu","",WindowType.const_564,var_77,0 | 0,_loc1_,this.subMenuEventProc,null,0,null,[WindowController.TAG_EXCLUDE]) as DropMenuController;
         }
         else
         {
            this.var_191.setGlobalRectangle(_loc1_);
         }
         this.var_191.activate();
         return this.var_191;
      }
      
      override public function populate(param1:Array) : void
      {
         this.var_679 = -1;
         while(this.var_278.length > 0)
         {
            this.var_278.pop();
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.var_278.push(param1[_loc2_]);
            _loc2_++;
         }
         this.var_1045 = true;
         this.closeMenuView();
      }
      
      public function getMenuItemIndex(param1:IDropMenuItemWindow) : int
      {
         var _loc2_:int = -1;
         var _loc3_:IItemListWindow = getChildByName(DropMenuController.ITEMLIST_NAME) as IItemListWindow;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.getListItemIndex(param1);
         }
         if(_loc2_ == -1)
         {
            if(this.var_191 != null)
            {
               _loc2_ = this.var_191.getMenuItemIndex(param1);
            }
         }
         return _loc2_;
      }
      
      protected function openMenuView() : void
      {
         if(!this.var_1045)
         {
            if(this.open())
            {
               if(this.var_278.length)
               {
                  this.populateMenuItemContainer(this.var_278,this.getSubMenu(),this.subMenuEventProc);
                  this.var_1045 = true;
               }
            }
         }
      }
      
      protected function closeMenuView() : void
      {
         if(this.close())
         {
            if(this.var_191 != null)
            {
               this.var_191.destroy();
               this.var_191 = null;
            }
            this.var_1045 = false;
            this.getTitleLabel().text = this.var_679 < this.var_278.length && this.var_679 > -1 ? this.var_278[this.var_679] : caption;
         }
      }
      
      protected function populateMenuItemContainer(param1:Array, param2:DropMenuController, param3:Function) : void
      {
         var _loc6_:* = null;
         var _loc4_:IItemListWindow = param2.getChildByName(DropMenuController.ITEMLIST_NAME) as IItemListWindow;
         _loc4_.autoArrangeItems = false;
         var _loc5_:uint = param1.length;
         var _loc7_:int = _loc4_.width;
         var _loc8_:int = _loc7_;
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc6_ = context.create(name + "::menu_item_" + _loc9_,param1[_loc9_],WindowType.const_487,var_77,0 | 0 | 0 | 0 | 0,null,param3,null,_loc9_,null,["_EXCLUDE"]) as DropMenuItemController;
            _loc8_ = Math.max(_loc8_,_loc6_.width);
            _loc6_.width = _loc7_;
            _loc4_.addListItem(_loc6_);
            _loc9_++;
         }
         if(_loc8_ > _loc7_)
         {
            param2.width += _loc8_ - _loc4_.width;
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc4_.getListItemAt(_loc9_).width = _loc8_;
               _loc9_++;
            }
         }
         var _loc10_:IWindow = context.create(name + "::padding","",WindowType.const_408,var_77,0 | 0 | 0 | 0,new Rectangle(0,0,1,2),null,null,0,null,["_EXCLUDE"]);
         _loc4_.addListItem(_loc10_);
         _loc4_.autoArrangeItems = true;
         this.fitToDesktop(param2);
         param2.activate();
         if(this.var_679 > -1 && _loc5_)
         {
            _loc4_.getListItemAt(this.var_679).setStateFlag(WindowState.const_53,true);
         }
      }
      
      private function fitToDesktop(param1:IWindow) : void
      {
         var _loc2_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc2_);
         if(_loc2_.bottom > desktop.rectangle.bottom)
         {
            param1.offset(0,desktop.rectangle.bottom - _loc2_.bottom);
         }
         else if(_loc2_.top < desktop.rectangle.top)
         {
            param1.offset(0,_loc2_.top - desktop.rectangle.top);
         }
         if(_loc2_.left < desktop.rectangle.left)
         {
            param1.offset(_loc2_.left - desktop.rectangle.left,0);
         }
         else if(_loc2_.right > desktop.rectangle.right)
         {
            param1.offset(desktop.rectangle.right - _loc2_.right,0);
         }
      }
      
      private function menuItemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = 0;
         if(param1.type == WindowMouseEvent.const_45 || param1.type == WindowTouchEvent.const_792)
         {
            if(param2 is IDropMenuItemWindow)
            {
               _loc3_ = uint(this.getMenuItemIndex(param2 as IDropMenuItemWindow));
               this.selection = _loc3_;
            }
         }
      }
      
      private function subMenuEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowTouchEvent.const_1175:
            case WindowMouseEvent.const_58:
               if(param2 is IDropMenuItemWindow)
               {
                  if(param2.testStateFlag(WindowState.const_102))
                  {
                     this.selection = this.getMenuItemIndex(param2 as IDropMenuItemWindow);
                  }
               }
               break;
            case WindowTouchEvent.const_822:
            case WindowMouseEvent.const_45:
               if(param2 is IDropMenuItemWindow)
               {
                  this.selection = this.getMenuItemIndex(param2 as IDropMenuItemWindow);
               }
               break;
            case WindowEvent.const_608:
               if(param2 == this.var_191)
               {
                  this.closeMenuView();
               }
         }
      }
      
      override public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         switch(param2.type)
         {
            case WindowTouchEvent.const_822:
            case WindowMouseEvent.const_45:
               if(!this.var_1045)
               {
                  this.openMenuView();
               }
         }
         return super.update(param1,param2);
      }
      
      public function open() : Boolean
      {
         if(getStateFlag(WindowState.const_97))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1610,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         visible = true;
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1560,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function close() : Boolean
      {
         if(!getStateFlag(WindowState.const_97))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1726,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         visible = false;
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1481,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function enumerateSelection() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = new Array();
         if(!_disposed)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_278.length)
            {
               _loc1_.push(this.var_278[_loc2_]);
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         if(this.var_278.length)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_771,this.var_278,PropertyStruct.const_140,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1468);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         InteractiveController.readInteractiveWindowProperties(this,param1);
         for each(_loc2_ in param1)
         {
            if(_loc2_.key == PropertyDefaults.const_771)
            {
               this.populate(_loc2_.value as Array);
               break;
            }
         }
         super.properties = param1;
      }
   }
}
