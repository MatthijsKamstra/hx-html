package template;

import template.Html.El;
import template.Html.Attribute;

import haxe.extern.EitherType;

// https://router.vuejs.org/en/api/router-link.html
typedef RouterLinkAttribute = {
	> Attribute,
	@:optional var to:String; // find solution for `v-bind:to` or short `:to`
	@:optional @:native('v-bind:to') var vbindto:String;
	@:optional var replace:Bool;
	@:optional var append:Bool;
	@:optional var tag:String; // defaul `a`
	@:native('active-class') @:optional var activeClass:String; // defaul `a`
	@:optional var exact:Bool;

	// 2.1.0 +
	@:optional var event:EitherType<String, Array<String>>;

	// 2.5.0 +
	@:native('exact-active-class') @:optional var exactActiveClass:String; // defaul `a`

}

class TVue extends template.Html {

	// start
	public static function vue(?elements:Array<El>):El{
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

	public static function routerView(?att:Dynamic, ?elements:Array<El>) : El { return new El('router-view', att, elements); }
	public static function routerLink(?att:RouterLinkAttribute, ?elements:Array<El>) : El { return new El('router-link', att, elements); }
	public static function transition(?att:Dynamic, ?elements:Array<El>) : El { return new El('transition', att, elements); }
}