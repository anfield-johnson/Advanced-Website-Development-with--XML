<?xml version="1.0" ?>
<!-- 
Author: Nathan Stier 
Project: XML Project 3 Req 2
File References:  exchange.xml
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" version="1.0" indent="yes" encoding="iso-8859-1" />
<xsl:template match="/">
    <xsl:apply-templates select="exchanges"/>
</xsl:template>

<xsl:template match="exchanges">
    <xsl:apply-templates select="exchange" />
</xsl:template>

<xsl:template match="exchange">
    
    <xsl:value-of select="format-number(substring(@number,2,string-length(@number)-1),'00000000')" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(name/lastName, '                              '), 1, 20)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(name/firstName, '                              '), 1, 15)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(name/middleInitial, '                              '), 1, 1)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(address/street, '                              '), 1, 25)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(address/appartment, '                              '), 1, 12)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(address/city, '                              '), 1, 35)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(address/stateOrProvince, '                              '), 1, 15)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(address/zipOrPostalCode, '                              '), 1, 10)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(address/country, '                              '), 1, 30)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="translate(telephone,'()- ','')" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(emailAddress, '                              '), 1, 30)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="concat(format-number(applicationDate/month,'00'),format-number(applicationDate/day,'00'),applicationDate/year)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="concat(format-number(availableDate/month,'00'),format-number(availableDate/day,'00'),availableDate/year)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:choose>
        <xsl:when test="@type='S'">
            <xsl:value-of select="concat(format-number(dateOfBirth/month,'00'),format-number(dateOfBirth/day,'00'),dateOfBirth/year)" />
        </xsl:when>
        <xsl:when test="@type='T'">
            <xsl:value-of select="'00000000'" />
        </xsl:when>
    </xsl:choose>
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(birthCountry, '                              '), 1, 30)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:choose>
        <xsl:when test="@type='S'">
            <xsl:value-of select="age" />
        </xsl:when>
        <xsl:when test="@type='T'">
            <xsl:value-of select="'00'" />
        </xsl:when>
    </xsl:choose>
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="translate(substring(concat(gender, '                              '), 1, 1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(schoolName, '                              '), 1, 35)" />
    <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:choose>
        <xsl:when test="@type='S'">
            <xsl:value-of select="substring(concat(yearInSchool, '                              '), 1, 9)" />
        </xsl:when>
        <xsl:when test="@type='T'">
            <xsl:value-of select="'         '" />
        </xsl:when>
    </xsl:choose>
        <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="translate(emergencyTelephone,'()- ','')" />
        <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="format-number(feePaid,'00000.00')" />
        <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:value-of select="substring(concat(feePaid/@currency, '                              '), 1, 3)" />
        <xsl:text>&#x0D;&#x0A;</xsl:text>
    <xsl:choose>
        <xsl:when test="@type='S'">
            <xsl:value-of select="substring(concat(concat(motherName/lastName,', ',motherName/firstName,' ',motherName/middleInitial), '                              '), 1, 30)" />
            <xsl:text>&#x0D;&#x0A;</xsl:text>
            <xsl:value-of select="substring(concat(concat(fatherName/lastName,', ',fatherName/firstName,' ',fatherName/middleInitial), '                              '), 1, 30)" />
            <xsl:text>&#x0D;&#x0A;</xsl:text>
        </xsl:when>
        <xsl:when test="@type='T'">
            <xsl:value-of select="'                              '" />
            <xsl:text>&#x0D;&#x0A;</xsl:text>
            <xsl:value-of select="'                              '" />
            <xsl:text>&#x0D;&#x0A;</xsl:text>
        </xsl:when>
    </xsl:choose>
        
</xsl:template>

</xsl:stylesheet>