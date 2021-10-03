package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1537:IID;
      
      private var var_1983:String;
      
      private var var_101:IUnknown;
      
      private var var_824:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1537 = param1;
         this.var_1983 = getQualifiedClassName(this.var_1537);
         this.var_101 = param2;
         this.var_824 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1537;
      }
      
      public function get iis() : String
      {
         return this.var_1983;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_101;
      }
      
      public function get references() : uint
      {
         return this.var_824;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_101 == null;
      }
      
      public function dispose() : void
      {
         this.var_1537 = null;
         this.var_1983 = null;
         this.var_101 = null;
         this.var_824 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_824;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_824) : uint(0);
      }
   }
}
