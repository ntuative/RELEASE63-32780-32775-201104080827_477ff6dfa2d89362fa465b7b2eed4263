package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_752;
         param1["bitmap"] = const_870;
         param1["border"] = const_917;
         param1["border_notify"] = const_1669;
         param1["button"] = const_587;
         param1["button_thick"] = const_837;
         param1["button_icon"] = const_1724;
         param1["button_group_left"] = const_823;
         param1["button_group_center"] = const_741;
         param1["button_group_right"] = const_819;
         param1["canvas"] = const_807;
         param1["checkbox"] = const_874;
         param1["closebutton"] = const_1233;
         param1["container"] = const_408;
         param1["container_button"] = const_662;
         param1["display_object_wrapper"] = const_844;
         param1["dropmenu"] = const_564;
         param1["dropmenu_item"] = const_487;
         param1["frame"] = const_413;
         param1["frame_notify"] = const_1519;
         param1["header"] = const_755;
         param1["html"] = const_1100;
         param1["icon"] = const_1228;
         param1["itemgrid"] = const_1115;
         param1["itemgrid_horizontal"] = const_562;
         param1["itemgrid_vertical"] = const_824;
         param1["itemlist"] = const_1071;
         param1["itemlist_horizontal"] = const_399;
         param1["itemlist_vertical"] = const_364;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1494;
         param1["menu"] = const_1621;
         param1["menu_item"] = const_1628;
         param1["submenu"] = const_1203;
         param1["minimizebox"] = const_1651;
         param1["notify"] = const_1489;
         param1["null"] = const_871;
         param1["password"] = const_658;
         param1["radiobutton"] = const_847;
         param1["region"] = const_593;
         param1["restorebox"] = const_1706;
         param1["scaler"] = const_501;
         param1["scaler_horizontal"] = const_1707;
         param1["scaler_vertical"] = const_1650;
         param1["scrollbar_horizontal"] = const_578;
         param1["scrollbar_vertical"] = const_789;
         param1["scrollbar_slider_button_up"] = const_1030;
         param1["scrollbar_slider_button_down"] = const_1208;
         param1["scrollbar_slider_button_left"] = const_1174;
         param1["scrollbar_slider_button_right"] = const_1219;
         param1["scrollbar_slider_bar_horizontal"] = const_1109;
         param1["scrollbar_slider_bar_vertical"] = const_1040;
         param1["scrollbar_slider_track_horizontal"] = const_1074;
         param1["scrollbar_slider_track_vertical"] = const_1140;
         param1["scrollable_itemlist"] = const_1633;
         param1["scrollable_itemlist_vertical"] = const_460;
         param1["scrollable_itemlist_horizontal"] = const_1192;
         param1["selector"] = const_933;
         param1["selector_list"] = const_921;
         param1["submenu"] = const_1203;
         param1["tab_button"] = const_788;
         param1["tab_container_button"] = const_1149;
         param1["tab_context"] = const_508;
         param1["tab_content"] = const_1066;
         param1["tab_selector"] = const_836;
         param1["text"] = const_599;
         param1["input"] = const_926;
         param1["toolbar"] = const_1593;
         param1["tooltip"] = const_390;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
