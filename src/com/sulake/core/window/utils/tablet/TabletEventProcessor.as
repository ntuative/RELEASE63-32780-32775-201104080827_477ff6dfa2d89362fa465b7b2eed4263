package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2938:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_81 = param1.desktop;
         var_63 = param1.var_1303 as WindowController;
         var_170 = param1.var_1301 as WindowController;
         var_167 = param1.renderer;
         var_864 = param1.var_1306;
         param2.begin();
         param2.end();
         param1.desktop = var_81;
         param1.var_1303 = var_63;
         param1.var_1301 = var_170;
         param1.renderer = var_167;
         param1.var_1306 = var_864;
      }
   }
}
