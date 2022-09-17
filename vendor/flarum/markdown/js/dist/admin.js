(()=>{var t={n:o=>{var e=o&&o.__esModule?()=>o.default:()=>o;return t.d(e,{a:e}),e},d:(o,e)=>{for(var r in e)t.o(e,r)&&!t.o(o,r)&&Object.defineProperty(o,r,{enumerable:!0,get:e[r]})},o:(t,o)=>Object.prototype.hasOwnProperty.call(t,o),r:t=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})}},o={};(()=>{"use strict";t.r(o);const e=flarum.core.compat["admin/app"];var r=t.n(e);const i=flarum.core.compat["common/app"];var n=t.n(i);const a=flarum.core.compat["common/extend"],c=flarum.core.compat["common/components/TextEditor"];var l=t.n(c);const s=flarum.core.compat["common/utils/BasicEditorDriver"];var d=t.n(s);const u=flarum.core.compat["common/utils/styleSelectedText"];var f=t.n(u);function p(t,o){return p=Object.setPrototypeOf||function(t,o){return t.__proto__=o,t},p(t,o)}function h(t,o){t.prototype=Object.create(o.prototype),t.prototype.constructor=t,p(t,o)}const k=flarum.core.compat["common/Component"];var y=t.n(k),b=function(t){function o(){return t.apply(this,arguments)||this}return h(o,t),o.prototype.view=function(t){return m("div",{class:"MarkdownToolbar"},t.children)},o}(y());const x=flarum.core.compat["common/helpers/icon"];var v=t.n(x);const g=flarum.core.compat["common/components/Tooltip"];var _=t.n(g),w=function(t){function o(){return t.apply(this,arguments)||this}h(o,t);var e=o.prototype;return e.oncreate=function(o){t.prototype.oncreate.call(this,o)},e.view=function(){var t=m("button",{className:"Button Button--icon Button--link",type:"button","data-hotkey":this.attrs.hotkey,onkeydown:this.keydown.bind(this),onclick:this.attrs.onclick},v()(this.attrs.icon));return this.attrs.title?m(_(),{text:this.attrs.title},t):t},e.keydown=function(t){" "!==t.key&&"Enter"!==t.key||(t.preventDefault(),this.element.click())},o}(y());const T=flarum.core.compat["common/utils/ItemList"];var O=t.n(T),S=navigator.userAgent.match(/Macintosh/)?"⌘":"ctrl",I={header:{prefix:"### "},bold:{prefix:"**",suffix:"**",trimFirst:!0},italic:{prefix:"_",suffix:"_",trimFirst:!0},strikethrough:{prefix:"~~",suffix:"~~",trimFirst:!0},quote:{prefix:"> ",multiline:!0,surroundWithNewlines:!0},code:{prefix:"`",suffix:"`",blockPrefix:"```",blockSuffix:"```"},link:{prefix:"[",suffix:"](https://)",replaceNext:"https://",scanFor:"https?://"},image:{prefix:"![",suffix:"](https://)",replaceNext:"https://",scanFor:"https?://"},unordered_list:{prefix:"- ",multiline:!0,surroundWithNewlines:!0},ordered_list:{prefix:"1. ",multiline:!0,orderedList:!0},spoiler:{prefix:">!",suffix:"!<",blockPrefix:">! ",multiline:!0,trimFirst:!0}},P=function(t,o){f()(o.el,I[t])};function j(t,o,e){return function(r){r.key===o&&(r.metaKey&&"⌘"===S||r.ctrlKey&&"ctrl"===S)&&(r.preventDefault(),P(t,e))}}function F(t){var o=this,e="function"==typeof t?t():new(O());function r(t,o){return n().translator.trans("flarum-markdown.lib.composer."+t+"_tooltip")+(o?" <"+S+"-"+o+">":"")}var i=function(t){return function(){return P(t,o.attrs.composer.editor)}};return e.add("header",m(w,{title:r("header"),icon:"fas fa-heading",onclick:i("header")}),1e3),e.add("bold",m(w,{title:r("bold","b"),icon:"fas fa-bold",onclick:i("bold")}),900),e.add("italic",m(w,{title:r("italic","i"),icon:"fas fa-italic",onclick:i("italic")}),800),e.add("strikethrough",m(w,{title:r("strikethrough"),icon:"fas fa-strikethrough",onclick:i("strikethrough")}),700),e.add("quote",m(w,{title:r("quote"),icon:"fas fa-quote-left",onclick:i("quote")}),600),e.add("spoiler",m(w,{title:r("spoiler"),icon:"fas fa-exclamation-triangle",onclick:i("spoiler")}),500),e.add("code",m(w,{title:r("code"),icon:"fas fa-code",onclick:i("code")}),400),e.add("link",m(w,{title:r("link"),icon:"fas fa-link",onclick:i("link")}),300),e.add("image",m(w,{title:r("image"),icon:"fas fa-image",onclick:i("image")}),200),e.add("unordered_list",m(w,{title:r("unordered_list"),icon:"fas fa-list-ul",onclick:i("unordered_list")}),100),e.add("ordered_list",m(w,{title:r("ordered_list"),icon:"fas fa-list-ol",onclick:i("ordered_list")}),0),e}r().initializers.add("flarum-markdown",(function(t){(0,a.extend)(d().prototype,"keyHandlers",(function(t){t.add("bold",j("bold","b",this)),t.add("italic",j("italic","i",this))})),l().prototype.markdownToolbarItems?(0,a.override)(l().prototype,"markdownToolbarItems",F):l().prototype.markdownToolbarItems=F,(0,a.extend)(l().prototype,"toolbarItems",(function(t){t.add("markdown",m(b,{for:this.textareaId,setShortcutHandler:function(t){return shortcutHandler=t}},this.markdownToolbarItems().toArray()),100)}))}))})(),module.exports=o})();
//# sourceMappingURL=admin.js.map