<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:util="http://sibs.dsp.util"
	xmlns:mf="http://sibs.mbase.adapter.mf"
	exclude-result-prefixes="xs">
	<xsl:output indent="yes"/>
	
	<xsl:param name="KEY1" as="xs:string" select="'file:///D:/workspace/XMLParser/test.txt'"/>
	<xsl:variable name="matches" select="mf:extract($KEY1, '([-]?\d)+')"/>
	<xsl:variable name="totalSize" select="count(tokenize($KEY1,','))"/>

	<!-- Include Standard Header template of Flat to XML Parsing by generating DSP, APP and ERR (if needed) nodes -->
	<xsl:include href="_DSPMBO.xsl"/>

	<xsl:template name="text2xml">
		<xsl:call-template name="DSPHDRO"/>
		<xsl:call-template name="APPHDRO"/>
		<xsl:call-template name="BDY">
			<xsl:with-param name="LOOP" select="number(1)"/>
			<xsl:with-param name="COUNTER2" select="number(663)"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="BDY">
		<xsl:param name="LOOP"/>
		<xsl:param name="COUNTER2"/>
		<xsl:choose>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,243,2))) = 'AA'">
				<xsl:element name="BDY" >
					<xsl:element name="accountNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),19)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 19)" />

					<xsl:element name="customerName1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="customerName2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="customerName3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="addressLine1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="addressLine2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="addressLine3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="addressLine4">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="addressLine5">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 40)" />

					<xsl:element name="journalSeq">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 9)" />

					<xsl:element name="tellerID">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />

				</xsl:element>

				<xsl:choose>
					<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
						<xsl:call-template name="BDY">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
							<xsl:with-param name="COUNTER" select="number($COUNTER+358)"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="MBERRO"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
