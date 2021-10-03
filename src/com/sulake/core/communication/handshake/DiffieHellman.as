package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1011:BigInteger;
      
      private var var_2458:BigInteger;
      
      private var var_2015:BigInteger;
      
      private var var_2820:BigInteger;
      
      private var var_1552:BigInteger;
      
      private var var_2014:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1552 = param1;
         this.var_2014 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1552.toString() + ",generator: " + this.var_2014.toString() + ",secret: " + param1);
         this.var_1011 = new BigInteger();
         this.var_1011.fromRadix(param1,param2);
         this.var_2458 = this.var_2014.modPow(this.var_1011,this.var_1552);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2015 = new BigInteger();
         this.var_2015.fromRadix(param1,param2);
         this.var_2820 = this.var_2015.modPow(this.var_1011,this.var_1552);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2458.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2820.toRadix(param1);
      }
   }
}
