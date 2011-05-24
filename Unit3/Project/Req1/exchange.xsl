<?xml version="1.0" ?>
<!-- 
Author: Nathan Stier 
Project: XML Project 3 Req 2
File References:  exchange.xml 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <head>
            <style type="text/css">
                table {
                    border : 1px solid black;
                }

                th {
                    background : black;
                    color : yellow;
                    border : 1px solid black;
                }

                td {
                    color : blue;
                    padding-left : 1em;
                }

                td[colspan="2"], td[colspan="2"] + td {
                    color : red;
                }
            </style>
            <title>Exchange Information</title>
        </head>
        <body>
            <xsl:apply-templates select="exchanges"/>
        </body>
    </html>
</xsl:template>

<xsl:template match="exchanges">
    <table cellspacing="0">
        <tr>
            <th  colspan="3">Exchange Information</th>
        </tr>
        <tr>
            <th>Exchange Type</th>
            <th>Name</th>
            <th>Country Choice</th>
        </tr>
        <xsl:apply-templates select="exchange" />
        <tr><td colspan="3" /></tr>
        <tr><td colspan="3" /></tr>
        <tr>
            <td colspan="2">The number people applying for an exchange is:</td>
            <td><xsl:value-of select="count(exchange)" /></td>
        </tr>
        <tr>
            <td colspan="2">The number people applying for an exchange is:</td>
            <td><xsl:value-of select="count(exchange[@type='S'])" /></td>
        </tr>
        <tr>
            <td colspan="2">The number people applying for an exchange is:</td>
            <td><xsl:value-of select="count(exchange[@type='T'])" /></td>
        </tr>
    </table>
</xsl:template>

<xsl:template match="exchange">
    <tr>
        <xsl:apply-templates select="@type" />
        <xsl:apply-templates select="name"/>
        <xsl:apply-templates select="countryChoices" />
    </tr>
</xsl:template>

<xsl:template match="@type">
    <td>
        <xsl:choose>
            <xsl:when test=".='S'">
                Student
            </xsl:when>
            <xsl:when test=".='T'">
                Teacher
            </xsl:when>
        </xsl:choose>
    </td>
</xsl:template>

<xsl:template match="name">
    <td>
        <xsl:value-of select="concat(lastName,', ',firstName)" />
        <xsl:if test="string-length(middleInitial) &gt; 0">
            <xsl:value-of select="concat(', ', middleInitial)" />
        </xsl:if>
    </td>
</xsl:template>

<xsl:template match="countryChoices">
    <xsl:if test="@preference='1'">
        <td><xsl:value-of select="." /></td>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>