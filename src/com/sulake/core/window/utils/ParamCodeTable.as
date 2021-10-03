package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_196;
         param1["bound_to_parent_rect"] = const_99;
         param1["child_window"] = const_1055;
         param1["embedded_controller"] = const_1148;
         param1["resize_to_accommodate_children"] = const_72;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_859;
         param1["mouse_dragging_target"] = const_257;
         param1["mouse_dragging_trigger"] = const_404;
         param1["mouse_scaling_target"] = const_295;
         param1["mouse_scaling_trigger"] = const_592;
         param1["horizontal_mouse_scaling_trigger"] = const_226;
         param1["vertical_mouse_scaling_trigger"] = const_227;
         param1["observe_parent_input_events"] = const_1200;
         param1["optimize_region_to_layout_size"] = const_462;
         param1["parent_window"] = const_1086;
         param1["relative_horizontal_scale_center"] = const_213;
         param1["relative_horizontal_scale_fixed"] = const_157;
         param1["relative_horizontal_scale_move"] = const_388;
         param1["relative_horizontal_scale_strech"] = const_412;
         param1["relative_scale_center"] = const_1191;
         param1["relative_scale_fixed"] = const_680;
         param1["relative_scale_move"] = const_1060;
         param1["relative_scale_strech"] = const_1135;
         param1["relative_vertical_scale_center"] = const_204;
         param1["relative_vertical_scale_fixed"] = const_147;
         param1["relative_vertical_scale_move"] = const_280;
         param1["relative_vertical_scale_strech"] = const_327;
         param1["on_resize_align_left"] = const_770;
         param1["on_resize_align_right"] = const_521;
         param1["on_resize_align_center"] = const_476;
         param1["on_resize_align_top"] = const_902;
         param1["on_resize_align_bottom"] = const_538;
         param1["on_resize_align_middle"] = const_607;
         param1["on_accommodate_align_left"] = const_1164;
         param1["on_accommodate_align_right"] = const_606;
         param1["on_accommodate_align_center"] = const_675;
         param1["on_accommodate_align_top"] = const_1179;
         param1["on_accommodate_align_bottom"] = const_447;
         param1["on_accommodate_align_middle"] = const_784;
         param1["route_input_events_to_parent"] = const_554;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1069;
         param1["scalable_with_mouse"] = const_1224;
         param1["reflect_horizontal_resize_to_parent"] = const_546;
         param1["reflect_vertical_resize_to_parent"] = const_493;
         param1["reflect_resize_to_parent"] = const_291;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1255;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
