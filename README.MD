# hx-html

![](icon.png)

Create html template with Haxe, with some form of checking.

This is a **WIP** use with caution!


# why

This will fix a very specific problem I had.
I want to use generated template for [hxmeteor](https://github.com/MatthijsKamstra/hxmeteor).

I guess you can use it for anything!


# Template engine

This is the desired output

(this a simple "blaze" template example, the default template engine in meteor)

```html
<template name="pageone">
	<!-- Start template: pageone -->
	<div class="container">
		<h1>PAGEONE</h1>
		<p>template for pageone</p>
		<p>test: {{test}}</p>
		<button class="testBtn">click</button>
	</div>
</template>
```

How to make this in Haxe with hx-html

```haxe
var templateName = 'pageone';
var html = html([
	template({name:templateName},[
		comment({text:'Start template: ${templateName}'}),
		div({clas:'container'},[
			h1({text:'${templateName.toUpperCase()}'}),
			p({text: 'template for ${templateName}'}),
			button({clas:"testBtn", text:"click"})
		])
	])
]);

```

Output

```html
<!-- This template is generated with Haxe. Do not edit! -->
<template name="pageone">
	<!-- Start template: pageone -->
	<div class="container">
		<h1>PAGEONE</h1>
		<p>template for pageone</p>
		<p>{{test}}</p>
		<p title="p-title">hello</p>
		<a href="http://www.haxe.org" target="_blank" title="title">haxe.org</a>
		<button class="testBtn">click</button>
	</div>
</template>
```

# TIPS

this is WIP, so diffintly not complete.

```haxe
var html = html([
	template({name:templateName},[
		comment({text:'Start template: ${templateName}'}),
		el("address",{id:"address-id",text:"not one I code for"})
	])
]);

```


# Others

These are the html template generators I found.

- <https://github.com/skial/fe> (Create Html from a small subset of Haxe that resembles CSS selectors.)
- <https://github.com/MarcWeber/haxe-macro-html-templates> (haml style macro)
- <https://github.com/benmerckx/ithril> (strange syntax)
- <https://github.com/ciscoheat/mithril-hx> (closer to what I want)
- <https://github.com/fponticelli/doom>
- <https://github.com/MarcWeber/haxe-html> (parser?)



# Haxe

This is a [Haxe](http://www.haxe.org) project, read more about it in the [README_HAXE.MD](README_HAXE.MD)!



