<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>Book Collection</title>

<style type="text/css">
body     {font-family: Arial, Helvetica, sans-serif;
	  color: #0000CC;
}
.title   {font-size: 1.5em;
	  color: #000099;
	  letter-spacing: .5ex;
	  font-variant:small-caps;
}
.caption {font-weight: 650;
	  color: #000066;
}
</style>
</head>

<body>

<p class="title">Book Collection</p>

<table cellpadding="4" cellspacing="0">

<xsl:for-each select="books/book">
    <tr>
        <td>
            <xsl:value-of select="title"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr />
        </td>
    </tr>

</xsl:for-each>

</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>