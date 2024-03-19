import "./feature-input.imba"

global css 
	@root
		$tok-default: #d4d4d4;
		$tok-keyword: #ea9b80;
		$tok-punctuation: #d4d4d4;
		$tok-number: #598da6;
		$tok-string: #b7de95;
		$tok-regex: #fd9231;
		$tok-bool: #002951  ;
		$tok-null: #84bad4;
		$tok-undefined: #84bad4;
		$tok-symbol: #b7de95;
		$tok-function: #bd9ac2;
		$tok-const: #75aaff;
		$tok-tag: #d9bb72;
		$tok-tag-self: #d9bb72;
		$tok-tag-ref: #d98772;
		$tok-tag-brackets: #d9bb72;
		$tok-tag-class: #d9bb72;
		$tok-tag-id: #d9bb72;
		$tok-tag-attr-key: #d9bb72;
		$tok-tag-attr-name: #d9bb72;
		$tok-tag-attr-value: var($tok-string);
		$tok-tag-name: #d9bb72;
		$tok-tag-string-quotes: var($tok-string);
		$tok-error: #ff9393;
		$tok-key: #a7c9de;
		$tok-comment: #5d6e7a;
		$topic-react-color: #73cbda;
		$topic-js-color: #cec178;
		$topic-css-color: #f1d05b;
		$topic-html-color: #9abf7a;
		$topic-js-color: #d67575;
		$topic-vue-color: #4fc08d;
		$topic-imba-color: #63a6ee;
		$topic-mithril-color: #58a958;
		$topic-color: #f1d05b;
		$coral4: hsla(25, 55.71%, 78.82%, 1);
		$coral1: hsla(28, 52%, 95%, 100%);
		$coral2: hsla(26.5, 53%, 91.5%, 1);
		$coral3: hsla(25, 54%, 88%, 100%);
		$tiger1: hsla(34, 94.59%, 92.75%, 1);
		$tiger2: hsla(34, 95%, 85%, 100%);
		$tiger3: hsla(34, 95.25%, 79.5%, 1);
		$tiger4: hsla(34, 95.5%, 74%, 1);
		$tiger5: hsla(34, 95.75%, 68.5%, 1);
		$tiger6: hsla(34, 96%, 63%, 100%);
		$indigo-color: #4B0082 
	body c:$tok-number bg:warm ff:Arial 
	.container d:flex jac:center ai:center
	
tag app
	prop features=[]
	css .container bgc:$tiger2 p:20px 30px m:10px rd:15px lh:1.6 ta:center fs:1.2rem
	<self>
		<div.container>
			<h1> "Feature Request"
		<feature-input>








imba.mount <app>
