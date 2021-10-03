package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2892:uint;
      
      private var var_142:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_256:IWindowContext;
      
      private var var_1098:IMouseDraggingService;
      
      private var var_1095:IMouseScalingService;
      
      private var var_1094:IMouseListenerService;
      
      private var var_1097:IFocusManagerService;
      
      private var var_1099:IToolTipAgentService;
      
      private var var_1096:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2892 = 0;
         this.var_142 = param2;
         this.var_256 = param1;
         this.var_1098 = new WindowMouseDragger(param2);
         this.var_1095 = new WindowMouseScaler(param2);
         this.var_1094 = new WindowMouseListener(param2);
         this.var_1097 = new FocusManager(param2);
         this.var_1099 = new WindowToolTipAgent(param2);
         this.var_1096 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1098 != null)
         {
            this.var_1098.dispose();
            this.var_1098 = null;
         }
         if(this.var_1095 != null)
         {
            this.var_1095.dispose();
            this.var_1095 = null;
         }
         if(this.var_1094 != null)
         {
            this.var_1094.dispose();
            this.var_1094 = null;
         }
         if(this.var_1097 != null)
         {
            this.var_1097.dispose();
            this.var_1097 = null;
         }
         if(this.var_1099 != null)
         {
            this.var_1099.dispose();
            this.var_1099 = null;
         }
         if(this.var_1096 != null)
         {
            this.var_1096.dispose();
            this.var_1096 = null;
         }
         this.var_142 = null;
         this.var_256 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1098;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1095;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1094;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1097;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1099;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1096;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
