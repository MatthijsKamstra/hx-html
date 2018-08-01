package template;

import template.Html.El;
import template.Html.Attribute;

import haxe.extern.EitherType;



class TSwig extends template.Html {

	// start
	public static function swig(?elements:Array<El>):El{
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

}