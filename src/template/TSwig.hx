package template;

import template.Html.El;
import template.Html.Attribute;
import haxe.extern.EitherType;

class TSwig extends template.Html {
	// start
	public static function swig(?elements:Array<El>):El {
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

	public static function swig_if(?att:EitherType<Attribute, String>, ?elements:Array<El>):El {
		return new El('{%', convertAtt(att), elements);
	}

	public static function swig_endif(?att:Dynamic, ?elements:Array<El>):El {
		return new El('endif', att, elements);
	}

	public static function vars(?att:EitherType<Attribute, String>, ?elements:Array<El>):El {
		return new El('{{', convertAtt(att), elements);
	}

	public static function swig_comment(?att:EitherType<Attribute, String>, ?elements:Array<El>):El {
		return new El('{#', convertAtt(att), elements);
	}

	public static function convertAtt(att:EitherType<Attribute, String>):Attribute {
		var temp:Attribute = {};
		if (Std.is(att, String)) {
			temp.text = att;
		} else {
			temp = att;
		}
		return temp;
	}
}
