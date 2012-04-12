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
		<p>A simple demo of Responsive Imagery using ImageGen (<a href="http://www.percipientstudios.com/">Percipient Studios</a>)</p>
		<p>The code and further documentation is available on <a href="https://github.com/andersbrohall/ResponsiveImagery">github</a>
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
