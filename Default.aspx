<%@ Page Language="C#" AutoEventWireup="false" %>
<%
	var imageWidth = "500"; //Default width
	if (!string.IsNullOrEmpty(Request["imageWidth"]))
		imageWidth = Request["imageWidth"];
 %>

<!DOCTYPE html>
<html>
	<head>
		<title>Obviuse | Responsive Imagery</title>
		<link rel="stylesheet" href="/styles/responsive.css" />
	</head>
	<body>
		<p>A simple demo of Responsive Imagery using ImageGen (<a href="http://www.percipientstudios.com/">Percipient Studios</a>)<br/>
			The code and further documentation is available on <a href="https://github.com/andersbrohall/ResponsiveImagery">github</a>
		
		<p>Calling the page will retrive a session-cookie with the width of images. <br/>
			If there isn't any cookie, a default width will be used to render images. </p>
		<p>After document.ready a script will replace all images with the selector '.full'. <br/>
			The image width will depend on window.innerWidth and the max-width of the image container. <br/>
			The visitor will still have a fully functional site and user experience since the original images<br/>
			are streched to the new width while waiting for the new images. <br/><br/>
			If the width is changed, the cookie will be updated.</p>
		<p>Also window.onresize is handeled, calling the resize function again. And again.<br/>
			However, all current downloads are stopped and a timeout is set so that we don't spam the<br/>
			server more than necessary</p>
		<p>Meaning:
			<ol><li>On the first request a 'lowsource' image will be loaded before the actual size.</li>
  				<li>On recurring requests the correct image will be loaded while rendering. </li>
			</ol></p>
		<p>Perk: The solution takes window.devicePixelRatio in cosideration. <br/>
			Thus we have support for Retina and other displays with high resolution.</p>
		<p>In the future we will make best guesses about the visitors window size, given their User Agent. <br/>
			With that we can have a even nicer experience while browsing with javascript disabled.</p>

		<p>This example is built with ASP.NET since we need to read the cookie server-side. <br/>
			Also we use ImageGen which is a .NET Web Handler. </p>

		<p>We have used it with images delivered via a remote PHP site.<br/>
			You can of course use the platform of your choise considered that the same two prerequisites<br/>
			are filled. The only important thing is to be able to change a numeric width in the src of the images. </p>

		<p>imageWidth in cookie: <%= imageWidth %> (default = 500)<br/>
			imageWidth in script: <span class="imageWidth"></span><br/>
			contentWidth in markup: <span class="contentWidth"></span></p>

		<div>
			<img class="full" src="/ImageGen.ashx?image=/images/waterfall.jpg&width=<%= imageWidth %>" alt="" />
		</div>
		
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="/scripts/view.responsive.js"></script>
	</body>
</html>
