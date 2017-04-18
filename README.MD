# hx-html

![](icon.png)

Create html template with Haxe, with some form of checking.

This is **WIP** use with caution!

Current elements are:

- `<h1>` til `<h6>`
- `<p>`
- `<a>`
- `<div>`
- `<span>`
- `<button>`
- `<template>` (not a standard element)
- comment (`<!-- ... -->`)

# why

This will fix a specific problem I had.
I want to use generated template for [hxmeteor](https://github.com/MatthijsKamstra/hxmeteor).

I guess you can use it for anything!

# Usage Haxelib


You might want to update and/or correct the externs: install this repo locally

```
haxelib dev hx-html path/to/folder/src
```

Or use the developers version / cutting edge: this git repo

```
haxelib git hx-html https://github.com/MatthijsKamstra/hx-html
```

And don't forget to add it to your build file

```
-lib hx-html
```

# Template engine

This is the desired output

(this a simple "[blaze](https://guide.meteor.com/blaze.html)" template example, the default template engine in [meteor](https://www.meteor.com/))

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
      p({text: 'test: {{test}}'}),
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
    <button class="testBtn">click</button>
  </div>
</template>
```

# TIPS

This is WIP, so not complete AND may change in the future.

### any element

I have not written all typedef yet and some goes for elements.
But you can generate **any** element with `el(...)`

So lets look at `address` (I have never used this element before, so a good one to show how it works)

```haxe
var html = html([
  template({name:'test'},[
    comment({text:'element: address'}),
    el("address",{id:"address-id",text:"element address"})
  ])
]);
```

output

```html
<template name="test">
  <!-- element: address -->
  <address id="address-id">element address</address>
</template>

```

### unknown attributes

Attributes are defined by typedef, but I can't guess what `data-` your would like to create. Or you just want an unknown one (lets take unknown attribute `foo`).

Just use quotes:

```haxe
var html = html([
  template({name:'foobar'},[
    comment({text:'element: a with attribute foo'}),
    a({"foo":"bar",href:"http://www.haxe.org",text: "haxe.org",target:Target.BLANK,title:"title",}),
  ])
]);

```

output

```html

<!-- This template is generated with Haxe. Do not edit! -->
<template name="foobar">
  <!-- element: a with attribute foo -->
  <a foo="bar" href="http://www.haxe.org" target="_blank" title="title">haxe.org</a>
</template>

```

### clas vs class

`class` is a reserved word in Haxe. So use `clas` instead.
Auto completion should help you with this.

```haxe
var html = html([
  template({name:'footwo'},[
    div({clas:'container'},[
      p({text: 'text'}),
    ])
  ])
]);
```

Or quote "class"

```haxe
var html = html([
  template({name:'footwo'},[
    div({'class':'container'},[
      p({text: 'text'}),
    ])
  ])
]);
```

output will be the same

```html
<!-- This template is generated with Haxe. Do not edit! -->
<template name="footwo">
  <div class="container">
    <p>text</p>
  </div>
</template>

```



# Others

These are the Haxe/html template generators I found.

- <https://github.com/skial/fe> (Create Html from a small subset of Haxe that resembles CSS selectors.)
- <https://github.com/MarcWeber/haxe-macro-html-templates> (haml style macro)
- <https://github.com/benmerckx/ithril> (experimantal syntax)
- <https://github.com/ciscoheat/mithril-hx> (very simular to this version)
- <https://github.com/fponticelli/doom> (simular)
- <https://github.com/MarcWeber/haxe-html> (parser?)



# Haxe

This is a [Haxe](http://www.haxe.org) project, read more about it in the [README_HAXE.MD](README_HAXE.MD)!



