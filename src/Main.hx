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
		test0();
		readmeHTML0();
		readmeHTML1();
		readme0();
		readme1();
		readme2();
		readme3();
		init0();
		init1();
		init2();
		vue0();
		vue1();
		vue2();
		vue3();
	}

	function test0(){
		var templateName = 'test';
		var html = html([
			root({'lang':'en'},[
				head({},[
					comment('Required meta tags'),
    				meta({'charset':'utf-8'}),
					meta({'name':'viewport', 'content':'width=device-width, initial-scale=1, shrink-to-fit=no'}),
					comment('Bootstrap CSS'),
					title('Bootstrap2'),
					link({'rel':'stylesheet', 'href':'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css', 'integrity':'sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm', 'crossorigin':'anonymous'}),
					link({'rel':'stylesheet', 'href':'/styles/main.css'}),
					style({'type':'text/css', text:'\n\t.test{border: 1px solid pink;}\n'}),
					style({'type':'text/css', text:'.test{border: 1px solid pink;}'}),
				]),
			]),
		]);
		Out.write(html, templateName);

	}

	function readmeHTML0(){
		var templateName = 'html-component';
		var html = html([
			div({name:templateName, id:templateName, _class:"container-flued"},[
				comment('div.container: ${templateName}'),
				div({clas:'container'},[
					h1({text:'${templateName.toUpperCase()}'}),
					p({text: 'subtitle', _class:"lead"}),
					p({text: 'content for ${templateName}'}),
					button({clas:"testBtn", text:"click"})
				])
			])
		]);
		Out.write(html, templateName);
	}

	function readmeHTML1(){
		var templateName = 'html-root';
		var html = html([
			root({'lang':'en'},[
				head({},[
					comment('Required meta tags'),
    				meta({'charset':'utf-8'}),
   					meta({'name':'viewport', 'content':'width=device-width, initial-scale=1, shrink-to-fit=no'}),
					comment('Bootstrap CSS'),
					title('Bootstrap2'),
					link({'rel':'stylesheet', 'href':'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css', 'integrity':'sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm', 'crossorigin':'anonymous'}),
					link({'rel':'stylesheet', 'href':'/styles/main.css'}),
					style({'type':'text/css', text:'.test{border: 1px solid pink;}'})
				]),
				body({_class:'homepage'},[
					div({name:templateName, id:templateName, _class:'container-flued'},[
						comment('div.container: ${templateName}'),
						div({clas:'container'},[
							h1({text:'${templateName.toUpperCase()}'}),
							p({text: 'subtitle', _class:'lead'}),
							p({text: 'content for ${templateName}'}),
							button({clas:"testBtn", text:"click"})
						])
					])
				]),
			]),
		]);
		Out.write(html, templateName);
	}


	function readme0(){
		var templateName = 'pageone';
		var html = html([
		  template({name:templateName},[
		    comment('Start template: ${templateName}'),
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
				comment('element: address'),
				el("address",{id:"address-id",text:"element address"})
			])
		]);
		Out.write(html, templateName);
	}

	function readme2 (){
		var templateName = 'element_a';
		var html = html([
			template({name:templateName},[
				comment('a with attribute default elements'),
				a({
					"data-foo":"bar",
					href:"http://www.haxe.org",
					text: "haxe.org",
					target:Target.BLANK,
					title:"title"
				}),
				comment('element: a with attribute foo'),
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

	function readme3 (){
		var templateName = 'class';
		var html = html([
			template({name:'footwo'},[
				div({clas:'container'},[
					p({text: 'use: clas'}),
				]),
				div({_class:'container'},[
					p({text: 'use: _class'}),
				]),
				div({'class':'container'},[
					p({text: 'use: "class"'}),
				]),
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
				comment('Start template: ${templateName}'),
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
					comment('use router-link component for navigation.'),
					comment('specify the link by passing the `to` prop.'),
					comment('`<router-link>` will be rendered as an `<a>` tag by default'),
					routerLink({to:'/foo',text:'Go to Foo'}),
					routerLink({to:'/bar',text:'Go to Bar'}),
				]),
				comment('route outlet'),
				comment('component matched by the route will render here'),
				routerView({text:''})
			])
		]);
		Out.write(html, templateName);
	}

	function vue1(){
		var templateName = 'vue1';
		var html = vue([
			div({id:'app'},[
				p({text:'{{ message }}'})
			])
		]);
		Out.write(html, templateName);
	}

	function vue2(){
		// <span v-bind:title="message">
		var templateName = 'vue2';
		var html = vue([
			div({id:'app-2'},[
				span({
					'v-bind:title':"message",
					text:'Hover your mouse over me for a few seconds to see my dynamically bound title!'
				}),
				span({
					'v-if':"seen",
					text:'Now you see m'
				}),
				ol({}, [
					li({text:'list item 1'}),
					li({text:'list item 2'}),
					li({text:'list item 3'}),
				]),
				ol({}, [
					el('li',{
						"v-for":"todo in todos",
						text:"{{ todo.text }}",
					}),
				]),
				p({text:'{{message}}'}),
				button({
					'v-on:click':'reverseMessage',
					text : 'Reverse Message'
				}),
				el('input', {
					"v-model":"message"
				}),
				ol({},[
					el('todo-item',{
						'v-for':"item in groceryList",
				      	'v-bind:todo':"item",
				      	'v-bind:key':"item.id",
					}),
				]),
				el('app-nav', {}, [
					el('app-view', {}, [
						el('app-sidebar', {text:''}),
						el('app-content', {text:''}),
					]),
				]),

			])
		]);
		Out.write(html, templateName);
	}

	function vue3 (){
		var templateName = 'vue3';
		var html = vue([
			div({id:'app'},[
				span({'v-if':'seen'})
			])
		]);
		Out.write(html, templateName);
	}



	static public function main () {
		var app = new Main ();
	}
}
