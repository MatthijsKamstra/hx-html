package template;

import template.Html.El;
import template.Html.Attribute;

class TVue extends template.Html {

	// start
	public static function vue(?elements:Array<El>):El{
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

	public static function routerView(?att:Dynamic, ?elements:Array<El>) : El { return new El('router-view', att, elements); }
	public static function routerLink(?att:Dynamic, ?elements:Array<El>) : El { return new El('router-link', att, elements); }
	public static function transition(?att:Dynamic, ?elements:Array<El>) : El { return new El('transition', att, elements); }
}