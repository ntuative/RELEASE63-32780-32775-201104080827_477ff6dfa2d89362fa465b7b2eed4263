package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_786:int = 500;
      
      private static var var_995:Vector3d = new Vector3d();
       
      
      private var var_532:Vector3d;
      
      private var var_92:Vector3d;
      
      private var var_1900:int = 0;
      
      private var var_2645:int;
      
      private var var_1151:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_532 = new Vector3d();
         this.var_92 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1900;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_92 = null;
         this.var_532 = null;
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1151 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               this.var_92.assign(param1.loc);
               _loc3_ = _loc2_.targetLoc;
               this.var_2645 = this.var_1900;
               this.var_532.assign(_loc3_);
               this.var_532.sub(this.var_92);
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.var_532.length > 0)
         {
            _loc2_ = param1 - this.var_2645;
            if(_loc2_ > this.var_1151)
            {
               _loc2_ = this.var_1151;
            }
            var_995.assign(this.var_532);
            var_995.mul(_loc2_ / Number(this.var_1151));
            var_995.add(this.var_92);
            if(object != null)
            {
               object.setLocation(var_995);
            }
            if(_loc2_ == this.var_1151)
            {
               this.var_532.x = 0;
               this.var_532.y = 0;
               this.var_532.z = 0;
            }
         }
         this.var_1900 = param1;
      }
   }
}
