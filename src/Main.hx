package;

import Html;
import Html.*;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {

	public function new () {
		// var html = html([
		// 	template({name:"pageone"})
		// ]);


		// var html = html([
		// 	template({name:"pageone"},[
		// 		div({clas:'container'},[
		// 			h1({text:'PAGEONE'})
		// 		])
		// 	])
		// ]);

		var templateName = 'pageone';
		var html = html([
			template({name:templateName},[
				comment({text:'Start template: ${templateName}'}),
				div({clas:'container'},[
					h1({text:'${templateName.toUpperCase()}'}),
					p({text: 'template for ${templateName}'}),
					p({text: "{{test}}"}),
					p({title:"p-title",text:"hello"}),
					el("address",{id:"address-id",text:"not one I code for"}),
					a({href:"http://www.haxe.org",text: "haxe.org",target:Target.BLANK,title:"title"},[
						span({clas:"red", text:"span me"})
					]),
					button({clas:"testBtn", text:"click"})
				])
			])
		]);

		#if neko
			Sys.println('---------');
			var out = html.toString();
			Sys.println(out);
			sys.io.File.saveContent('bin/_data/test.html', out);
			Sys.println('---------');
		#else
			trace(html.toString());
		#end

	}

	static public function main () {
		var app = new Main ();
	}
}
