$alphafontfamily: "proxima-nova", helvetica, arial, serif;
$white: #fff;
$litegray: #D7D7D7;
$darkgray: #383839;
$gray: #909090;
$green: #45A73B;
$blue: #4E9FE8;
$darkblue: #2D6AA9;
$headerlinkcolor: #fff;
$alphalinkcolor: #3898cd;
$alphalinkhovercolor: #35b8f5;
$alphatextcolor: #333;
$light: 300;
$normal: 400;
$semibold: 600;
$bold: 700;

@mixin background-image-retina($file, $type, $width, $height) {
	background-image: image-url($file + '.' + $type);

	@media (-webkit-min-device-pixel-ratio: 2) {
		& {
			background-image: image-url($file + '@2x.' + $type);
			-webkit-background-size: $width $height;
		}
	}
}

@mixin placeholder($color, $fontsize, $fontweight, $case) {
	&::-webkit-input-placeholder {
		 color: $color;
		 font-size: $fontsize;
		 font-weight: $fontweight;
		 text-transform: $case;
	}
	&:-moz-placeholder {
		 color: $color;
		 font-size: $fontsize;
		 font-weight: $fontweight;
		 text-transform: $case;
	}
}

@function black($opacity){
		@return rgba(0,0,0,$opacity);
}

@function white($opacity){
		@return rgba(255,255,255,$opacity);
}

@mixin box-emboss($opacity, $opacity2){
		box-shadow:white($opacity) 0 1px 0, inset black($opacity2) 0 1px 0;
}

@mixin letterpress($opacity){
		text-shadow:white($opacity) 0 1px 0;
}

@mixin letterpress2($opacity){
		text-shadow:black($opacity) 0 -1px 0;
}

@mixin hide-text{
		overflow:hidden;
		text-indent:-9000px;
		display: inline-block;
}

body {
	background-color: #f3f3f3;
	font-family: $alphafontfamily;
}



header.global {
	background-color: $darkblue;
	
	.brand {
		@include background-image-retina("logo-small", "png", 212px, 39px);
		height: 39px;
		width: 212px;
		background-repeat: no-repeat;
		background-position: 0 0;
		@include hide-text;
		padding:0;
		margin-right: 30px;
	}
	
	.navbar {
		margin-bottom: 0;
		.navbar-inner {
			background: transparent;
			border: none;
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			box-shadow: none;
			margin-bottom: 0;
			padding: 15px 0;
			
			li > a {
				color: white(.7);
				text-shadow:none;
				&:hover {
					color: #fff;
				}
			}
			li.active > a {
				background: transparent;
				
			}
		}
	}
}

.page-header {
	background-color: $blue;
	color: white;
	margin: 0 0 20px 0;
	h1 {
		font-weight: normal;
		margin: 20px 0;
	}
}

.ungradedStudent{
  background-color: $blue;
  color: white;
}

th{
  background-color: $litegray;
}

#completion
{
}