package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var var_190:IHabboConfigurationManager = null;
      
      private var var_571:int = 0;
      
      private var var_480:Number = 0;
      
      private var var_2890:Array;
      
      private var var_1336:String = "";
      
      private var var_1627:String = "";
      
      private var var_2182:String = "";
      
      private var var_2452:String = "";
      
      private var var_1758:Boolean = false;
      
      private var var_1629:GarbageMonitor = null;
      
      private var var_1338:int = 0;
      
      private var var_2183:Boolean;
      
      private var var_1626:int = 1000;
      
      private var var_1337:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1605:int = 0;
      
      private var var_1628:int = 10;
      
      private var var_1339:int = 0;
      
      private var var_2185:Number = 0.15;
      
      private var var_2184:Boolean = true;
      
      private var var_2186:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_2890 = [];
         super();
         this.var_1627 = Capabilities.version;
         this.var_2182 = Capabilities.os;
         this.var_1758 = Capabilities.isDebugger;
         this.var_1336 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1336 == null)
         {
            this.var_1336 = "unknown";
         }
         this.var_1629 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1605 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1627;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_480;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1626 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1628 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this.var_190 = param1;
         this._reportInterval = int(this.var_190.getKey("performancetest.interval","60"));
         this.var_1626 = int(this.var_190.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1628 = int(this.var_190.getKey("performancetest.reportlimit","10"));
         this.var_2185 = Number(this.var_190.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2184 = Boolean(int(this.var_190.getKey("performancetest.distribution.enabled","1")));
         this.var_2183 = Boolean(this.var_190.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1629.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1629.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         if(this.var_2183)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1338;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1626)
         {
            ++this.var_1337;
            _loc3_ = true;
         }
         else
         {
            ++this.var_571;
            if(this.var_571 <= 1)
            {
               this.var_480 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_571);
               this.var_480 = this.var_480 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1605 > this._reportInterval * 1000 && this.var_1339 < this.var_1628)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_480);
            _loc6_ = true;
            if(this.var_2184 && this.var_1339 > 0)
            {
               _loc7_ = this.differenceInPercents(this.var_2186,this.var_480);
               if(_loc7_ < this.var_2185)
               {
                  _loc6_ = false;
               }
            }
            this.var_1605 = param2;
            if(_loc6_ || _loc3_)
            {
               this.var_2186 = this.var_480;
               if(this.sendReport(param2))
               {
                  ++this.var_1339;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1336,this.var_1627,this.var_2182,this.var_2452,this.var_1758,_loc5_,_loc4_,this.var_1338,this.var_480,this.var_1337);
            this._connection.send(_loc2_);
            this.var_1338 = 0;
            this.var_480 = 0;
            this.var_571 = 0;
            this.var_1337 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
