package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1605:int;
      
      private var var_2151:int;
      
      private var var_743:int;
      
      private var var_480:Number;
      
      private var var_2150:Boolean;
      
      private var var_2152:int;
      
      private var var_1604:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_480);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2151 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2152 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2150 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_743;
         if(this.var_743 == 1)
         {
            this.var_480 = param1;
            this.var_1605 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_743);
            this.var_480 = this.var_480 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2150 && param3 - this.var_1605 >= this.var_2151)
         {
            this.var_743 = 0;
            if(this.var_1604 < this.var_2152)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1604;
               this.var_1605 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
