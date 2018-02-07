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
- `<ol>`
- `<ul>`
- `<li>`
- `<template>` // meteor (not a standard element)
- comment (`<!-- ... -->`)

And Vue templates

- `routerView`
- `routerLink`
- `routerLink`

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

# Templates HTML

basic example html create in Haxe

```haxe
var templateName = 'html-component';
var html = html([
  div({name:templateName, id:templateName, _class:"container-flued"},[
    comment({text:'div.container: ${templateName}'}),
    div({clas:'container'},[
      h1({text:'${templateName.toUpperCase()}'}),
      p({text: 'subtitle', _class:"lead"}),
      p({text: 'content for ${templateName}'}),
      button({clas:"testBtn", text:"click"})
    ])
  ])
]);
```

creates as output


```html
<!-- This template is generated with Haxe. Do not edit! -->
<div class="container-flued" name="html-component" id="html-component">
  <!-- div.container: html-component -->
  <div class="container">
    <h1>HTML-COMPONENT</h1>
    <p class="lead">subtitle</p>
    <p>content for html-component</p>
    <button class="testBtn">click</button>
  </div>
</div>
```




# Templates Meteor

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


# Templates Vue.js

create templates useable with vue.js

see for example below: <https://router.vuejs.org/en/essentials/getting-started.html>


```haxe
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
```


```html

<!-- This template is generated with Haxe. Do not edit! -->
<div id="app">
  <h1>Hello App!</h1>
  <p>
    <!-- use router-link component for navigation. -->
    <!-- specify the link by passing the `to` prop. -->
    <!-- `<router-link>` will be rendered as an `<a>` tag by default -->
    <router-link to="/foo">Go to Foo</router-link>
    <router-link to="/foo">Go to Bar</router-link>
  </p>
  <!-- route outlet -->
  <!-- component matched by the route will render here -->
  <router-view></router-view>
</div>

```



# TIPS

This is WIP, so not complete AND may change in the future.

### comment

```html
var html = html([
  comment('test0'),         // prefered methode
  comment({text:'test1'}),  // all elements have this
]);
```

```html
<!-- This template is generated with Haxe. Do not edit! -->
<!-- test0 -->
<!-- test1 -->
```

### any element

I have not written all typedef yet and some goes for elements.
But you can generate **any** element with `el(...)`

So lets look at `address` (I have never used this element before, so a good one to show how it works)

```haxe
var templateName = 'address';
var html = html([
  template({name:templateName},[
    comment({text:'element: address'}),
    el("address",{id:"address-id",text:"element address"})
  ])
]);
```

output

```html

<!-- This template is generated with Haxe. Do not edit! -->
<template name="address">
  <!-- element: address -->
  <address id="address-id">element address</address>
</template>

```

### unknown attributes

Attributes are defined by typedef, but I can't guess what `data-` your would like to create. Or you just want an unknown one (lets take unknown attribute `data-foo`).

Just use quotes:

```haxe
var templateName = 'element_a';
var html = html([
  template({name:templateName},[
    comment({text:'a with attribute default elements'}),
    a({
      "data-foo":"bar",
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
```

output

```html
<!-- This template is generated with Haxe. Do not edit! -->
<template name="element_a">
  <!-- a with attribute default elements -->
  <a href="http://www.haxe.org" data-foo="bar" target="_blank" title="title">haxe.org</a>
  <!-- element: a with attribute foo -->
  <a href="http://www.haxe.org" data-foo="bar" target="_blank" title="title">haxe.org</a>
</template>
```

### class

`class` is a reserved word in Haxe. So use `clas`, `_class` or `"class"` instead.
Auto completion should help you with this.

```haxe
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
  ]
```

output will be the same

```html
<!-- This template is generated with Haxe. Do not edit! -->
<template name="footwo">
  <div class="container">
    <p>use: clas</p>
  </div>
  <div class="container">
    <p>use: _class</p>
  </div>
  <div class="container">
    <p>use: "class"</p>
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



