package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_955:int = 3;
       
      
      private var var_2200:int = -1;
      
      private var var_2198:int = -2;
      
      private var var_216:Vector3d = null;
      
      private var var_196:Vector3d = null;
      
      private var var_1630:Vector3d;
      
      private var var_2193:Boolean = false;
      
      private var var_2192:Boolean = false;
      
      private var var_2195:Boolean = false;
      
      private var var_2197:Boolean = false;
      
      private var var_2199:int = 0;
      
      private var var_2201:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2194:int = 0;
      
      private var var_2196:int = 0;
      
      private var var_1783:int = -1;
      
      private var var_1340:int = 0;
      
      private var var_1631:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1630 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_196;
      }
      
      public function get targetId() : int
      {
         return this.var_2200;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2198;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1630;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2193;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2192;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2195;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2197;
      }
      
      public function get screenWd() : int
      {
         return this.var_2199;
      }
      
      public function get screenHt() : int
      {
         return this.var_2201;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2194;
      }
      
      public function get roomHt() : int
      {
         return this.var_2196;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1783;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_216 != null && this.var_196 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2200 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1630.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2198 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2193 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2192 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2195 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2197 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2199 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2201 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1631 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2194 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2196 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1783 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_216 == null)
         {
            this.var_216 = new Vector3d();
         }
         if(this.var_216.x != param1.x || this.var_216.y != param1.y || this.var_216.z != param1.z)
         {
            this.var_216.assign(param1);
            this.var_1340 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_216 = null;
         this.var_196 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_196 != null)
         {
            return;
         }
         this.var_196 = new Vector3d();
         this.var_196.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_196 == null)
         {
            this.var_196 = new Vector3d();
         }
         this.var_196.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_216 != null && this.var_196 != null)
         {
            ++this.var_1340;
            if(this.var_1631)
            {
               this.var_1631 = false;
               this.var_196 = this.var_216;
               this.var_216 = null;
               return;
            }
            _loc4_ = Vector3d.dif(this.var_216,this.var_196);
            if(_loc4_.length <= param2)
            {
               this.var_196 = this.var_216;
               this.var_216 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_955 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1340 <= const_955)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_196 = Vector3d.sum(this.var_196,_loc4_);
            }
         }
      }
   }
}
