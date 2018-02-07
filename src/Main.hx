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
		readme3();
		init0();
		init1();
		init2();
		vue0();
		vue1();
		vue2();
		vue3();
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
					routerLink({to:'/bar',text:'Go to Bar'}),
				]),
				comment({text:'route outlet'}),
				comment({text:'component matched by the route will render here'}),
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
