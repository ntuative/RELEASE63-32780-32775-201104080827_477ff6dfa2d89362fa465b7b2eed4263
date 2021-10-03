package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_880:IAssetLoader;
      
      private var var_1608:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1608 = param1;
         this.var_880 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1608;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_880;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_880 != null)
            {
               if(!this.var_880.disposed)
               {
                  this.var_880.dispose();
                  this.var_880 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
