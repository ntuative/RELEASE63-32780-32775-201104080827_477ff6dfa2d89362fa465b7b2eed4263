package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1325:IHabboTracking;
      
      private var var_2031:Boolean = false;
      
      private var var_2660:int = 0;
      
      private var var_1902:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1325 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1325 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2031 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2660 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2031)
         {
            return;
         }
         ++this.var_1902;
         if(this.var_1902 <= this.var_2660)
         {
            this.var_1325.track("toolbar",param1);
         }
      }
   }
}
