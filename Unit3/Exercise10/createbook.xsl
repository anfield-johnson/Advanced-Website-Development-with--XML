<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes" encoding="iso-8859-1" />

<xsl:template match="/">
    <xsl:apply-templates select="books/book/author">
        <!-- Document represent all authors and their books -->
        <xsl:apply-templates select="books/book/author">
            <xsl:sort select="last" order="ascending" />
            <xsl:sort select="first" order="ascending" />
            <xsl:sort select="middle" order="ascending" />
        </xsl:apply-templates>
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="books/book/author">
    <xsl:element name="authorBook">
        <xsl:attribute name="bookIsbn">
            <xsl:value-of select="translate(../isbn,'-','')" />
        </xsl:attribute>
        <xsl:element name="authorName">
            <xsl:element name="lastName">
                <xsl:value-of select="last" />
            </xsl:element>
            <xsl:element name="middleInitial">
                <xsl:value-of select="middle" />
            </xsl:element>
            <xsl:element name="lastName">
                <xsl:value-of select="first" />
            </xsl:element>
        </xsl:element>
        <xsl:element name="bookTitle">
            <xsl:value-of select="../title" />
        </xsl:element>
        <xsl:element name="edition">
            <xsl:value-of select="../edition" />
        </xsl:element>
        <xsl:element name="publishedDate">
            <xsl:value-of select="concat(substring('0',string-length(../publishedDate/month)),../publishedDate/month,'-',substring('0',string-length(../publishedDate/day)),../publishedDate/day,'-',../publishedDate/year)" />
        </xsl:element>
        <xsl:element name="bookCategory">
            <xsl:value-of select="concat(translate(substring(../type,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),substring(../type,2,string-length(../type)))" />
        </xsl:element>
        <xsl:element name="bookFormat">
            <xsl:value-of select="../title/@type" />
        </xsl:element>
        <xsl:element name="price">
            <xsl:value-of select="../price" />
        </xsl:element>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>