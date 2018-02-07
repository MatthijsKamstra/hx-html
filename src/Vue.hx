package;

import Html.El;
import Html.Attribute;

class Vue extends Html {

	// start
	public static function vue(?elements:Array<El>):El{
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

	public static function routerView(?att:Dynamic, ?elements:Array<El>) : El { return new El('router-view', att, elements); }
	public static function routerLink(?att:Dynamic, ?elements:Array<El>) : El { return new El('router-link', att, elements); }
}