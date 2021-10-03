package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1623:String = "WE_DESTROY";
      
      public static const const_347:String = "WE_DESTROYED";
      
      public static const const_1610:String = "WE_OPEN";
      
      public static const const_1560:String = "WE_OPENED";
      
      public static const const_1726:String = "WE_CLOSE";
      
      public static const const_1481:String = "WE_CLOSED";
      
      public static const const_1475:String = "WE_FOCUS";
      
      public static const const_311:String = "WE_FOCUSED";
      
      public static const const_1670:String = "WE_UNFOCUS";
      
      public static const const_1527:String = "WE_UNFOCUSED";
      
      public static const const_1737:String = "WE_ACTIVATE";
      
      public static const const_585:String = "WE_ACTIVATED";
      
      public static const const_1561:String = "WE_DEACTIVATE";
      
      public static const const_608:String = "WE_DEACTIVATED";
      
      public static const const_297:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_559:String = "WE_UNSELECT";
      
      public static const const_504:String = "WE_UNSELECTED";
      
      public static const const_1505:String = "WE_LOCK";
      
      public static const const_1705:String = "WE_LOCKED";
      
      public static const const_1693:String = "WE_UNLOCK";
      
      public static const const_1729:String = "WE_UNLOCKED";
      
      public static const const_743:String = "WE_ENABLE";
      
      public static const const_237:String = "WE_ENABLED";
      
      public static const const_702:String = "WE_DISABLE";
      
      public static const const_203:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_253:String = "WE_RELOCATED";
      
      public static const const_1187:String = "WE_RESIZE";
      
      public static const const_38:String = "WE_RESIZED";
      
      public static const const_1466:String = "WE_MINIMIZE";
      
      public static const const_1536:String = "WE_MINIMIZED";
      
      public static const const_1722:String = "WE_MAXIMIZE";
      
      public static const const_1542:String = "WE_MAXIMIZED";
      
      public static const const_1578:String = "WE_RESTORE";
      
      public static const const_1603:String = "WE_RESTORED";
      
      public static const const_444:String = "WE_CHILD_ADDED";
      
      public static const const_359:String = "WE_CHILD_REMOVED";
      
      public static const const_208:String = "WE_CHILD_RELOCATED";
      
      public static const const_144:String = "WE_CHILD_RESIZED";
      
      public static const const_285:String = "WE_CHILD_ACTIVATED";
      
      public static const const_650:String = "WE_PARENT_ADDED";
      
      public static const const_1456:String = "WE_PARENT_REMOVED";
      
      public static const const_1573:String = "WE_PARENT_RELOCATED";
      
      public static const const_1162:String = "WE_PARENT_RESIZED";
      
      public static const const_1182:String = "WE_PARENT_ACTIVATED";
      
      public static const const_172:String = "WE_OK";
      
      public static const const_477:String = "WE_CANCEL";
      
      public static const const_107:String = "WE_CHANGE";
      
      public static const const_580:String = "WE_SCROLL";
      
      public static const const_171:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_696:IWindow;
      
      protected var var_1066:Boolean;
      
      protected var var_472:Boolean;
      
      protected var var_566:Boolean;
      
      protected var var_697:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_696 = param3;
         _loc5_.var_472 = param4;
         _loc5_.var_566 = false;
         _loc5_.var_697 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_696;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_472;
      }
      
      public function recycle() : void
      {
         if(this.var_566)
         {
            throw new Error("Event already recycled!");
         }
         this.var_696 = null;
         this._window = null;
         this.var_566 = true;
         this.var_1066 = false;
         this.var_697.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1066;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1066 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1066;
      }
      
      public function stopPropagation() : void
      {
         this.var_1066 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1066 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_472 + " window: " + this._window + " }";
      }
   }
}
