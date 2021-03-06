package template;

import haxe.extern.EitherType;
import haxe.Constraints.Function;

// https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
// https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script
typedef ScriptAttribute = {
	> Attribute,
	@:optional var async:Bool;
	@:optional var crossorigin:String;
	@:optional var defer:Bool;

	@:optional var integrity:String;
	@:optional var nonce:String;
	@:optional var src:String;
	@:optional var text:String;
	@:optional var type:String;
}

// https://developer.mozilla.org/en-US/docs/Web/HTML/Element/style
typedef StyleAttribute = {
	> Attribute,
	@:optional var type:String;
	@:optional var media:String;
	@:optional var nonce:String;
	@:optional var title:String;
}

// https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta
typedef MetaAttribute = {
	> Attribute,
	@:optional var charset:String;
	@:optional var content:String;
	// @:optional var http-equiv:String; // doesn't work
	@:optional var name:String;
}

// https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link
typedef LinkAttribute = {
	> Attribute,
	@:optional var as:String;
	@:optional var crossorigin:String;
	@:optional var href:String;
	@:optional var hreflang:String;
	@:optional var integrity:String;
	@:optional var media:String;
	@:optional var rel:String;
	@:optional var target:String;
	@:optional var title:String;
	@:optional var type:String;
}

// https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes
typedef Attribute = {
	// custom att
	@:optional var name:String;
	@:optional var text:String;
	@:optional var print:String;
	@:optional var print_start:String;
	@:optional var print_end:String;

	// default
	@:optional var accesskey:String;
	@:optional var clas:String; // class is a reserved word
	@:optional var _class:String; // class is a reserved word
	@:optional var contenteditable:String;
	@:optional var contextmenu:String;
	// @:optional var data:String; data-*
	@:optional var dir:String;
	@:optional var draggable:String;
	@:optional var dropzone:String;
	@:optional var hidden:String;
	@:optional var id:String;
	@:optional var itemid:String;
	@:optional var itemprop:String;
	@:optional var itemref:String;
	@:optional var itemscope:String;
	@:optional var itemtype:String;
	@:optional var lang:String;
	@:optional var spellcheck:String;
	@:optional var style:String;
	@:optional var tabindex:String;
	@:optional var title:String;
};

// https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a
typedef AAttribute = {
	> Attribute,
	@:optional var download:String;
	@:optional var href:String;
	@:optional var hreflang:String;
	@:optional var referrerpolicy:String;
	@:optional var rel:String;
	@:optional var target:Target;
	@:optional var type:String;
}

// https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img
typedef ImgAttribute = {
	> Attribute,
	@:optional var title:String;
	@:optional var alt:String;
	@:optional var crossorigin:String;
	@:optional var decoding:String;
	@:optional var height:String;
	@:optional var ismap:String;
	@:optional var longdesc:String;
	@:optional var name:String;
	@:optional var referrerpolicy:String;
	@:optional var sizes:String;
	@:optional var src:String;
	@:optional var srcset:String;
	@:optional var width:String;
	@:optional var usemap:String;
}

@:enum abstract Target(String) {
	var BLANK = '_blank';
	var SELF = '_self';
	var PARENT = '_parent';
	var TOP = '_top';
}

class Html {
	// start
	public static function html(?elements:Array<El>):El {
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

	// meteor
	public static function template(?att:Attribute, ?elements:Array<El>):El {
		return new El('template', att, elements);
	}

	// I am not going to write down ALL elements
	// https://developer.mozilla.org/en-US/docs/Web/HTML/Element
	public static function el(el:String, ?att:Dynamic, ?elements:Array<El>):El {
		return new El(el, att, elements);
	}

	public static function root(?att:Attribute, ?elements:Array<El>):El {
		return new El('html', att, elements);
	}

	public static function head(?att:Attribute, ?elements:Array<El>):El {
		return new El('head', att, elements);
	}

	public static function body(?att:Attribute, ?elements:Array<El>):El {
		return new El('body', att, elements);
	}

	public static function meta(?att:MetaAttribute, ?elements:Array<El>):El {
		return new El('meta', att, elements);
	}

	public static function link(?att:LinkAttribute, ?elements:Array<El>):El {
		return new El('link', att, elements);
	}

	public static function style(?att:StyleAttribute, ?elements:Array<El>):El {
		return new El('style', att, elements);
	}

	public static function script(?att:ScriptAttribute, ?elements:Array<El>):El {
		return new El('style', att, elements);
	}

	// comment
	public static function comment(?att:EitherType<Attribute, String>, ?elements:Array<El>):El {
		var temp:Attribute = {};
		if (Std.is(att, String)) {
			temp.text = att;
		} else {
			temp = att;
		}
		return new El('comment', temp, elements);
	}

	public static function title(?att:EitherType<Attribute, String>, ?elements:Array<El>):El {
		var temp:Attribute = {};
		if (Std.is(att, String)) {
			temp.text = att;
		} else {
			temp = att;
		}
		return new El('title', temp, elements);
	}

	public static function print(?att:EitherType<Attribute, String>, ?elements:Array<El>):El {
		var temp:Attribute = {};
		if (Std.is(att, String)) {
			temp.text = att;
		} else {
			temp = att;
		}
		return new El('print', temp, elements);
	}

	// list
	public static function ol(?att:Attribute, ?elements:Array<El>):El {
		return new El('ol', att, elements);
	}

	public static function ul(?att:Attribute, ?elements:Array<El>):El {
		return new El('ul', att, elements);
	}

	public static function li(?att:Attribute, ?elements:Array<El>):El {
		return new El('li', att, elements);
	}

	// misc
	public static function div(?att:Attribute, ?elements:Array<El>):El {
		return new El('div', att, elements);
	}

	public static function span(?att:Attribute, ?elements:Array<El>):El {
		return new El('span', att, elements);
	}

	public static function button(?att:Attribute, ?elements:Array<El>):El {
		return new El('button', att, elements);
	}

	public static function img(?att:ImgAttribute, ?elements:Array<El>):El {
		return new El('img', att, elements);
	}

	// link
	public static function a(?att:AAttribute, ?elements:Array<El>):El {
		return new El('a', att, elements);
	}

	// paragraph
	public static function p(?att:Attribute, ?elements:Array<El>):El {
		return new El('p', att, elements);
	}

	// heading
	public static function h1(?att:Attribute, ?elements:Array<El>):El {
		return new El('h1', att, elements);
	}

	public static function h2(?att:Attribute, ?elements:Array<El>):El {
		return new El('h2', att, elements);
	}

	public static function h3(?att:Attribute, ?elements:Array<El>):El {
		return new El('h3', att, elements);
	}

	public static function h4(?att:Attribute, ?elements:Array<El>):El {
		return new El('h4', att, elements);
	}

	public static function h5(?att:Attribute, ?elements:Array<El>):El {
		return new El('h5', att, elements);
	}

	public static function h6(?att:Attribute, ?elements:Array<El>):El {
		return new El('h6', att, elements);
	}
}

class El {
	// https://developer.mozilla.org/en-US/docs/Glossary/empty_element
	private var emptyElementArray = [
		'area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'param', 'source', 'track', 'wbr'
	];

	private var name:String;
	private var att:Attribute;
	private var elements:Array<El> = [];

	public static var _html = '';

	public function new(name:String, att:Attribute, elements:Array<El>) {
		this.name = name;
		this.att = att;
		this.elements = elements;
	}

	/**
	 * make sure when you start a document, it should be empty
	 */
	public static function reset() {
		_html = '';
	}

	private function convert(name:String, att:Attribute, elements:Array<El>, count:Int = 0):String {
		// trace("Html.convert: ", name, att, elements, tab);

		var tab = '';
		for (i in 0...count)
			tab += '\t';

		var isDone = false;
		var isEmpty = false;
		var className = '';

		// so now we have an element name: `<name `
		if (name != '') {
			if (emptyElementArray.indexOf(name) != -1)
				isEmpty = true;

			switch (name) {
				case 'comment':
					_html += '$tab<!--';
				case '{#', 'swig_comment':
					_html += '$tab{#';
				case '{%', 'iff', 'swig_if', 'if':
					_html += '$tab{% if ${att.text} %}';
				case '{{', 'swig_var':
					_html += '$tab{{';
				case 'print', 'print_end', 'print_start':
					_html += '$tab';
				default:
					// trace ("case '"+name+"': trace ('"+name+"');");
					_html += '$tab<$name';
			}

			// set all atributes of the element
			var attArr = Reflect.fields(att);
			for (j in 0...attArr.length) {
				var _att = attArr[j];
				var _attName = attArr[j];

				// make sure reserved words are mapped back
				switch (_att.toString()) {
					case 'clas', '_class', 'class':
						className = Reflect.field(att, _att);
						_attName = 'class'; // reserved word
					default:
				}

				if (_att == 'text')
					continue;
				if (_att.indexOf('print') != -1) {
					_html += Reflect.field(att, _att);
					continue;
				}
				_html += ' $_attName="' + Reflect.field(att, _att) + '"';
			}

			// close tag
			if (att != null && att.text != null) {
				// there are attributes
				switch (name) {
					case 'comment':
						isDone = true;
						_html += ' ${att.text} -->\n';
					case '{#', 'swig_comment':
						isDone = true;
						_html += ' ${att.text} #}\n';
					case '{{', 'swig_var':
						isDone = true;
						_html += ' ${att.text} }}\n';
					case '{%', 'iff', 'swig_if', 'if':
						isDone = true;
						_html += '{% endif %}\n';
					case 'print', 'print_end', 'print_start':
						isDone = true;
						_html += '${att.text}\n';
					default:
						// trace ("case '"+name+"': trace ('"+name+"');");
						if (elements == null) {
							isDone = true;
							_html += '>${att.text.split('\n').join('\n' + tab)}</$name>\n';
						} else {
							_html += '>${att.text.split('\n').join('\n' + tab)}\n';
						}
				}
			} else {
				if (isEmpty)
					isDone = true;
				_html += '>\n';
			}

			// if there are more elements that needs generating
			if (elements != null) {
				count++;
				for (i in 0...elements.length) {
					var el = elements[i];
					convert(el.name, el.att, el.elements, count);
				}
			}
			if (!isDone) {
				// [mck] add `id` AND `class` to the end comment?
				if (name == 'div' && className != '') {
					_html += '$tab</$name><!-- /.$className -->\n';
				} else {
					_html += '$tab</$name>\n';
				}
			}
		} else {
			// no 'name' element, so this is the root : we start with the comment
			_html += '<!-- This template is generated with Haxe. Do not edit! -->\n';
			// and run through the elements
			for (i in 0...elements.length) {
				var el = elements[i];
				convert(el.name, el.att, el.elements, 0);
			}
		}
		return _html;
	}

	public function toString() {
		return convert(name, att, elements);
	}
}
