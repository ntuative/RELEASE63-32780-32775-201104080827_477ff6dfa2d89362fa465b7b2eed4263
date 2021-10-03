package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_373:int = 1;
      
      public static const const_275:int = 2;
      
      public static const const_293:int = 3;
      
      public static const const_363:int = 4;
      
      public static const const_252:int = 5;
      
      public static const const_381:int = 1;
      
      public static const const_766:int = 2;
      
      public static const const_891:int = 3;
      
      public static const const_848:int = 4;
      
      public static const const_254:int = 5;
      
      public static const const_713:int = 6;
      
      public static const const_772:int = 7;
      
      public static const const_267:int = 8;
      
      public static const const_416:int = 9;
      
      public static const const_1850:int = 10;
      
      public static const const_716:int = 11;
      
      public static const const_482:int = 12;
       
      
      private var var_436:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_436 = new Array();
         this.var_436.push(new Tab(this._navigator,const_373,const_482,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_471));
         this.var_436.push(new Tab(this._navigator,const_275,const_381,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_471));
         this.var_436.push(new Tab(this._navigator,const_363,const_716,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1194));
         this.var_436.push(new Tab(this._navigator,const_293,const_254,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_471));
         this.var_436.push(new Tab(this._navigator,const_252,const_267,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_725));
         this.setSelectedTab(const_373);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_363;
      }
      
      public function get tabs() : Array
      {
         return this.var_436;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_436)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_436)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_436)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
