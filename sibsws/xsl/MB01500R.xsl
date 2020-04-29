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
			<xsl:with-param name="COUNTER2" select="number(663)"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="BDY">
		<xsl:param name="COUNTER2"/>
		<xsl:choose>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,243,2))) = 'AA'">
				<xsl:element name="BDY" >
					<xsl:element name="idNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>

					<xsl:call-template name="ITEM">
						<xsl:with-param name="LOOP" select="number(1)"/>
						<xsl:with-param name="COUNTER2" select="number(663+15)"/>
					</xsl:call-template>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="MBERRO"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="ITEM">
		<xsl:param name="LOOP"/>
		<xsl:param name="COUNTER2"/>

		<xsl:element name="ITEM" >
			<xsl:element name="customerNo">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
				<!--xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/-->
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

			<xsl:element name="customerName">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),80)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 80)" />

			<xsl:element name="idNumber">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

			<xsl:element name="idTYpeCode">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

			<xsl:element name="accountType">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

			<xsl:element name="accountNo">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

			<xsl:element name="cifCategory">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

			<xsl:element name="relatedLinkCode">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

			<xsl:element name="nominatedCategory">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

			<xsl:element name="lastNominationDate">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

			<xsl:element name="birthDate">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

			<xsl:element name="status">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),1), xs:integer(1), xs:integer(0))"/>
			</xsl:element>
		</xsl:element>

		<xsl:choose>
			<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
				<xsl:call-template name="ITEM">
					<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
					<xsl:with-param name="COUNTER2" select="number($COUNTER2+143)"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
