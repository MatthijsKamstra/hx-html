package;

// https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes

// https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes
typedef Attribute = {
	// custom att
	@:optional var name : String;
	@:optional var text : String;

	// default
	@:optional var accesskey:String;
	@:optional var clas:String; // class is a reserved word
	@:optional var _class:String; // class is a reserved word
	@:optional var contenteditable:String;
	@:optional var contextmenu:String;
	@:optional var data:String;
	@:optional var dir:String;
	@:optional var draggable:String;
	@:optional var dropzone:String;
	@:optional var hidden:String;
	@:optional var id:String;
	@:optional var itemid:String;
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

@:enum abstract Target (String) {
	var BLANK 	= '_blank';
	var SELF 	= '_self';
	var PARENT 	= '_parent';
	var TOP 	= '_top';
}

class Html {

	// start
	public static function html(?elements:Array<El>):El{
		// make sure we start with an empty file
		El.reset();
		return new El('', {}, elements);
	}

	// meteor
	public static function template(?att:Attribute, ?elements:Array<El>) : El { return new El('template', att, elements); }

	// I am not going to write down ALL elements
	// https://developer.mozilla.org/en-US/docs/Web/HTML/Element
	public static function el(el:String, ?att:Dynamic, ?elements:Array<El>) : El { return new El(el, att, elements); }

	// list
	public static function ol(?att:Attribute, ?elements:Array<El>) : El { return new El('ol', att, elements); }
	public static function ul(?att:Attribute, ?elements:Array<El>) : El { return new El('ul', att, elements); }
	public static function li(?att:Attribute, ?elements:Array<El>) : El { return new El('li', att, elements); }

	// misc
	public static function div(?att:Attribute, ?elements:Array<El>) : El { return new El('div', att, elements); }
	public static function span(?att:Attribute, ?elements:Array<El>) : El { return new El('span', att, elements); }
	public static function button(?att:Attribute, ?elements:Array<El>) : El { return new El('button', att, elements); }

	// link
	public static function a(?att:AAttribute, ?elements:Array<El>) : El { return new El('a', att, elements); }

	// comment
	public static function comment(?att:Attribute, ?elements:Array<El>) : El { return new El('comment', att, elements); }

	// paragraph
	public static function p(?att:Attribute, ?elements:Array<El>) : El { return new El('p', att, elements); }

	// heading
	public static function h1(?att:Attribute, ?elements:Array<El>) : El { return new El('h1', att, elements); }
	public static function h2(?att:Attribute, ?elements:Array<El>) : El { return new El('h2', att, elements); }
	public static function h3(?att:Attribute, ?elements:Array<El>) : El { return new El('h3', att, elements); }
	public static function h4(?att:Attribute, ?elements:Array<El>) : El { return new El('h4', att, elements); }
	public static function h5(?att:Attribute, ?elements:Array<El>) : El { return new El('h5', att, elements); }
	public static function h6(?att:Attribute, ?elements:Array<El>) : El { return new El('h6', att, elements); }

}

class El {

	private var name : String;
	private var att:Attribute;
	private var elements:Array<El> = [];

	public static var _html = '';

	public function new (name:String, att:Attribute, elements:Array<El>){
		this.name = name;
		this.att = att;
		this.elements = elements;
	}

	/**
	 * make sure when you start a document, it should be empty
	 */
	public static function reset(){
		_html = '';
	}

	private function convert(name:String, att:Attribute, elements:Array<El>, count:Int = 0):String
	{
		//trace("Html.convert: ", name, att, elements, tab);

		var tab = '';
		for ( i in 0 ... count ) tab += '\t';

		var isDone = false;

		if(name != ''){

			if(name == 'comment'){
				_html += '$tab<!--';
			} else {
				_html += '$tab<$name';
			}

			var attArr = Reflect.fields(att);
			for ( j in 0 ... attArr.length ) {
				var _att = attArr[j];
				var _attName = attArr[j];
				if(_att == 'clas') _attName = 'class'; // reserved word
				if(_att == '_class') _attName = 'class'; // reserved word
				if(_att == 'text') continue;
				_html += ' $_attName="'+Reflect.field(att,_att)+'"';
			}

			if(att != null && att.text != null){
				if(name == "comment"){
					isDone = true;
					_html += ' ${att.text} -->\n';
				} else{
					if(elements == null) {
						isDone = true;
						_html += '>${att.text}</$name>\n';
					} else {
						_html += '>${att.text}\n';
					}
				}
			} else {
				_html += '>\n';
			}

			if(elements != null){
				count++;
				for ( i in 0 ... elements.length ) {
					var el = elements[i];
					convert(el.name, el.att, el.elements, count);
				}
			}
			if(!isDone) _html += '$tab</$name>\n';
		} else {
			_html += '<!-- This template is generated with Haxe. Do not edit! -->\n';
			// html root?
			for ( i in 0 ... elements.length ) {
				var el = elements[i];
				convert(el.name, el.att, el.elements, 0);
			}
		}
		return _html;
	}

	public function toString(){
		return convert(name, att, elements);
	}

}


