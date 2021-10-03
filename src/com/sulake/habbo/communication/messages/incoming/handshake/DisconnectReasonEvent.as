package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1983:int = 0;
      
      public static const const_1458:int = 1;
      
      public static const const_1613:int = 2;
      
      public static const const_1859:int = 3;
      
      public static const const_1858:int = 4;
      
      public static const const_1948:int = 5;
      
      public static const const_1586:int = 10;
      
      public static const const_1812:int = 11;
      
      public static const const_1894:int = 12;
      
      public static const const_1848:int = 13;
      
      public static const const_1826:int = 16;
      
      public static const const_1997:int = 17;
      
      public static const const_1919:int = 18;
      
      public static const const_2000:int = 19;
      
      public static const const_1846:int = 20;
      
      public static const const_1917:int = 22;
      
      public static const const_1933:int = 23;
      
      public static const const_1875:int = 24;
      
      public static const const_1991:int = 25;
      
      public static const const_1865:int = 26;
      
      public static const const_1992:int = 27;
      
      public static const const_1825:int = 28;
      
      public static const const_1934:int = 29;
      
      public static const const_1981:int = 100;
      
      public static const const_1947:int = 101;
      
      public static const const_1904:int = 102;
      
      public static const const_1896:int = 103;
      
      public static const const_1994:int = 104;
      
      public static const const_1809:int = 105;
      
      public static const const_1916:int = 106;
      
      public static const const_1880:int = 107;
      
      public static const const_1835:int = 108;
      
      public static const const_1837:int = 109;
      
      public static const const_1811:int = 110;
      
      public static const const_1832:int = 111;
      
      public static const const_1841:int = 112;
      
      public static const const_1907:int = 113;
      
      public static const const_1914:int = 114;
      
      public static const const_1806:int = 115;
      
      public static const const_1869:int = 116;
      
      public static const const_1843:int = 117;
      
      public static const const_1957:int = 118;
      
      public static const const_1961:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1458:
            case const_1586:
               return "banned";
            case const_1613:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
