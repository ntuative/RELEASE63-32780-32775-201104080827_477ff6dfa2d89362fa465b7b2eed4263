package com.sulake.core.window.components
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class InteractiveController extends WindowController implements IInteractiveWindow
   {
       
      
      protected var var_1585:uint = 500;
      
      protected var var_1318:String = "";
      
      protected var var_870:Map;
      
      public function InteractiveController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function processInteractiveWindowEvents(param1:IInteractiveWindow, param2:WindowEvent) : void
      {
         if(param1.toolTipCaption != PropertyDefaults.const_473)
         {
            if(param2.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type != WindowMouseEvent.const_188)
            {
               if(param2.type == WindowMouseEvent.const_28)
               {
                  param1.context.getWindowServices().getToolTipAgentService().end(param1);
               }
            }
         }
      }
      
      public static function readInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in param2)
         {
            switch(_loc3_.key)
            {
               case PropertyDefaults.const_832:
                  if(_loc3_.value != param1.toolTipCaption)
                  {
                     param1.toolTipCaption = _loc3_.value as String;
                  }
                  break;
               case PropertyDefaults.const_705:
                  if(_loc3_.value != param1.toolTipDelay)
                  {
                     param1.toolTipDelay = _loc3_.value as uint;
                  }
                  break;
            }
         }
      }
      
      public static function writeInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : Array
      {
         if(param1.toolTipCaption != PropertyDefaults.const_473)
         {
            param2.push(new PropertyStruct(PropertyDefaults.const_832,param1.toolTipCaption,PropertyStruct.const_55,true));
         }
         else
         {
            param2.push(PropertyDefaults.const_1589);
         }
         if(param1.toolTipDelay != PropertyDefaults.const_1218)
         {
            param2.push(new PropertyStruct(PropertyDefaults.const_705,param1.toolTipDelay,PropertyStruct.const_264,true));
         }
         else
         {
            param2.push(PropertyDefaults.TOOL_TIP_DELAY);
         }
         return param2;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         this.var_1318 = param1 == null ? "null" : param1;
      }
      
      public function get toolTipCaption() : String
      {
         return this.var_1318;
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         this.var_1585 = param1;
      }
      
      public function get toolTipDelay() : uint
      {
         return this.var_1585;
      }
      
      public function setMouseCursorForState(param1:uint, param2:uint) : uint
      {
         if(!this.var_870)
         {
            this.var_870 = new Map();
         }
         var _loc3_:uint = this.var_870[param1];
         if(param2 == MouseCursorType.const_30 || param2 == -1)
         {
            this.var_870.remove(param1);
         }
         else
         {
            this.var_870[param1] = param2;
         }
         return _loc3_;
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         if(!this.var_870)
         {
            return MouseCursorType.const_30;
         }
         return this.var_870.getValue(param1);
      }
      
      override public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         if(param1 == this)
         {
            processInteractiveWindowEvents(this,param2);
         }
         return super.update(param1,param2);
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function hideToolTip() : void
      {
      }
      
      override public function get properties() : Array
      {
         return writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function set properties(param1:Array) : void
      {
         readInteractiveWindowProperties(this,param1);
         super.properties = param1;
      }
   }
}