package;

import Html;
import Html.*;
import Vue;
import Vue.*;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {

	public function new () {
		readme0();
		readme1();
		readme2();
		init0();
		init1();
		init2();
		vue0();
	}


	function readme0(){
		var templateName = 'pageone';
		var html = html([
		  template({name:templateName},[
		    comment({text:'Start template: ${templateName}'}),
		    div({clas:'container'},[
		      h1({text:'${templateName.toUpperCase()}'}),
		      p({text: 'template for ${templateName}'}),
		      p({text: 'test: {{test}}'}),
		      button({clas:"testBtn", text:"click"})
		    ])
		  ])
		]);
		Out.write(html, templateName);
	}

	function readme1 (){
		var templateName = 'address';
		var html = html([
			template({name:templateName},[
				comment({text:'element: address'}),
				el("address",{id:"address-id",text:"element address"})
			])
		]);
		Out.write(html, templateName);
	}

	function readme2 (){
		var templateName = 'element_a';
		var html = html([
			template({name:templateName},[
				comment({text:'a with attribute default elements'}),
				a({
					href:"http://www.haxe.org",
					text: "haxe.org",
					target:Target.BLANK,
					title:"title"
				}),
				comment({text:'element: a with attribute foo'}),
				el('a',{
					"data-foo":"bar",
					href:"http://www.haxe.org",
					text: "haxe.org",
					target:Target.BLANK,
					title:"title"
				}),
			])
		]);
		Out.write(html, templateName);
	}

	function init0(){
		var templateName = 'page0';
		var html = html([
			template({name:templateName})
		]);
		Out.write(html, templateName);
	}

	function init1(){
		var templateName = 'page1';
		var html = html([
			template({name:templateName},[
				div({clas:'container'},[
					h1({text:templateName})
				])
			])
		]);
		Out.write(html, templateName);
	}

	function init2(){
		var templateName = 'page2';
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
		Out.write(html, templateName);
	}

	function vue0(){
		var templateName = 'vue0';
		var html = vue([
			div({id:'app'},[
				h1({text:'Hello App!'}),
				p({},[
					comment({text:'use router-link component for navigation.'}),
					comment({text:'specify the link by passing the `to` prop.'}),
					comment({text:'`<router-link>` will be rendered as an `<a>` tag by default'}),
					routerLink({to:'/foo',text:'Go to Foo'}),
					routerLink({to:'/foo',text:'Go to Bar'}),
				]),
				comment({text:'route outlet'}),
				comment({text:'component matched by the route will render here'}),
				routerView({text:''})
			])
		]);
		Out.write(html, templateName);
	}



	static public function main () {
		var app = new Main ();
	}
}
