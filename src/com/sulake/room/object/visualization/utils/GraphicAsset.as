package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1608:String;
      
      private var var_2368:String;
      
      private var var_450:BitmapDataAsset;
      
      private var var_1424:Boolean;
      
      private var var_1425:Boolean;
      
      private var var_2369:Boolean;
      
      private var _offsetX:int;
      
      private var var_1206:int;
      
      private var var_270:int;
      
      private var _height:int;
      
      private var var_771:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1608 = param1;
         this.var_2368 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_450 = _loc9_;
            this.var_771 = false;
         }
         else
         {
            this.var_450 = null;
            this.var_771 = true;
         }
         this.var_1424 = param4;
         this.var_1425 = param5;
         this._offsetX = param6;
         this.var_1206 = param7;
         this.var_2369 = param8;
      }
      
      public function dispose() : void
      {
         this.var_450 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_771 && this.var_450 != null)
         {
            _loc1_ = this.var_450.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_270 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_771 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1425;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1424;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_270;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1608;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2368;
      }
      
      public function get asset() : IAsset
      {
         return this.var_450;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2369;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1424)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1425)
         {
            return this.var_1206;
         }
         return -(this.height + this.var_1206);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1206;
      }
   }
}
