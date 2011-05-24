<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="proj2req2.css"/>
		<title>Exchange Information</title>
	</head>
	<body>
		<h1>Exchange Information</h1>
		<xsl:for-each select="exchanges/exchange">
			<xsl:sort select="name/lastName" order="ascending"/>
			<xsl:sort select="name/firstName" order="ascending"/>
			<div class="exchange">
				<div class="header">
					<div class="label newline">Exchange Type:</div>
					<div><xsl:value-of select="@type"/></div>
					<div class="label">Reference Number:</div>
					<div><xsl:value-of select="@number"/></div>
				</div>
				<div class="name">
					<div class="label">Name(First, Middle, Last):</div>
					<xsl:apply-templates select="name"/>
				</div>
				<div class="address">
					<xsl:apply-templates select="address"/>
					<div class="label newline">Telephone:</div>
					<div><xsl:value-of select="telephone"/></div>
					<div class="label newline">Email Address:</div>
					<div><xsl:value-of select="emailAddress"/></div>
				</div>
				<hr/>
				<div class="personal">
					<div class="label newline">Application Date (mm dd yy):</div>
					<div><xsl:apply-templates select="applicationDate"/></div>
					<div class="label">Available Date (mm dd yy):</div>
					<div><xsl:apply-templates select="availableDate"/></div>
					<div class="label newline">Birth Country:</div>
					<div><xsl:value-of select="birthCountry"/></div>
					<div class="label">Date of Birth (mm dd yy):</div>
					<div><xsl:apply-templates select="dateOfBirth"/></div>
					<div class="label newline">Age:</div>
					<div><xsl:apply-templates select="age"/></div>
					<div class="label">gender:</div>
					<div><xsl:apply-templates select="gender"/></div>
				</div>
				<hr/>
				<div class="school">
					<div class="label newline">School Name:</div>
					<div><xsl:value-of select="schoolName"/></div>
					<xsl:apply-templates select="schoolAddress"/>
				</div>
				<hr/>
				<div class="family">
					<div class="label newline">Mother's Name(last, first, middle):</div>
					<xsl:apply-templates select="motherName"/>
					<div class="label newline">Father's Name(last, first, middle):</div>
					<xsl:apply-templates select="fatherName"/>
					<div class="label newline">Emergency Telephone:</div>
					<div><xsl:value-of select="emergencyTelephone"/></div>
					<div class="label newline">Fee Paid:</div>
					<div><xsl:value-of select="feePaid"/></div>
					<div class="label">Currency:</div>
					<div><xsl:value-of select="feePaid/@currency"/></div>
					<div class="label newline">Essay:</div>
					<div class="essay"><xsl:value-of select="essay"/></div>
				</div>
				<hr/>
				<div class="languages">
					<xsl:apply-templates select="languagesSpoken">
						<xsl:sort select="@fluency" order="descending"/>
					</xsl:apply-templates>
				</div>
				<hr/>
				<div class="countries">
					<xsl:apply-templates select="countryChoices">
						<xsl:sort select="@preference" order="ascending"/>
					</xsl:apply-templates>
				</div>
			</div>
		</xsl:for-each>
	</body>
</html>
</xsl:template>

<xsl:template match="name">
	<div><xsl:value-of select="firstName"/></div>
	<div><xsl:value-of select="middleInitial"/></div>
	<div><xsl:value-of select="lastName"/></div>
</xsl:template>

<xsl:template match="address|schoolAddress">
		<div class="label newline">Street<xsl:if test="apartment">, Apartment</xsl:if>:</div>
		<div><xsl:value-of select="street"/></div>
		<div></div>
		<div><xsl:value-of select="apartment"/></div>
		<div class="label newline">City, State, Zip:</div>
		<div><xsl:value-of select="city"/></div>
		<div><xsl:value-of select="stateOrProvince"/></div>
		<div><xsl:value-of select="zipOrPostalCode"/></div>
		<xsl:if test="country">
			<div class="label newline">Country:</div>
			<div><xsl:value-of select="country"/></div>
		</xsl:if>
</xsl:template>

<xsl:template match="applicationDate|availableDate|dateOfBirth">
	<xsl:value-of select="concat(format-number(month, '00'), ' ', format-number(day, '00'),' ', format-number(year, '00'))"/>
</xsl:template>

<xsl:template match="motherName|fatherName">
	<div><xsl:value-of select="lastName"/></div>
	<div><xsl:value-of select="firstName"/></div>
	<div><xsl:value-of select="middleInitial"/></div>
</xsl:template>

<xsl:template match="languagesSpoken">
	<div class="label newline">Fluency(1=none, 4=fluent):</div>
	<div><xsl:value-of select="./@fluency"/></div>
	<div class="label">Language:</div>
	<div><xsl:value-of select="."/></div>
</xsl:template>

<xsl:template match="countryChoices">
	<div class="label newline">Priority(1=high, 5=low):</div>
	<div><xsl:value-of select="./@preference"/></div>
	<div class="label">Country Choice:</div>
	<div><xsl:value-of select="."/></div>
</xsl:template>

</xsl:stylesheet>