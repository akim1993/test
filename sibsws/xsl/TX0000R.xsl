<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:util="http://sibs.dsp.util"
	xmlns:mf="http://sibs.mbase.adapter.mf"
	exclude-result-prefixes="xs">
	<xsl:output indent="yes"/>

	<xsl:param name="KEY1" as="xs:string" select="'file:///D:/workspace/XMLParser/test.txt'"/>
	<xsl:variable name="matches" select="mf:extract($KEY1, '([-]?\d)+')"/>
	<xsl:variable name="dspSts" select="normalize-space(util:decode(mf:substr($matches,83,8)))"/>
	<xsl:variable name="totalSize" select="count(tokenize($KEY1,','))"/>

	<!-- Include Standard Header template of Flat to XML Parsing by generating DSP, APP and ERR (if needed) nodes -->
	<xsl:include href="_DSPMBO.xsl"/>  

	<!-- Flat to XML parsing starteds here -->
	<xsl:template name="text2xml">
		<!-- Step1: Standard Header XML node generation -->
		<xsl:call-template name="DSPHDRO"/>
		<xsl:call-template name="APPTXHDRO"/>
		<!-- Step2: Service Response Context node generetion -->
		<xsl:choose>
			<xsl:when test="$dspSts = '.DSP0003'">
				<xsl:call-template name="MBERRO"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="BDYRSP">
					<xsl:with-param name="LOOP" select="number(2)"/>
					<xsl:with-param name="COUNTER" select="number(317)"/>			
					<xsl:with-param name="RSPTAG" select="'RSP'"/>
					<xsl:with-param name="BDYTAG" select="'BDY'"/>
					<xsl:with-param name="appLen" select="format-number(number(normalize-space(util:decodePack(mf:substr($matches,317,2), xs:integer(3), xs:integer(0)))),'##################0')"/>
					<xsl:with-param name="appSts" select="normalize-space(util:decode(mf:substr($matches,319,2)))"/>
				</xsl:call-template>		
			</xsl:otherwise>
		</xsl:choose> 
	</xsl:template>	
	<xsl:template name="BDYRSP">
		<xsl:param name="LOOP"/>
		<xsl:param name="COUNTER"/>		
		<xsl:param name="RSPTAG"/>
		<xsl:param name="BDYTAG"/>		
		<xsl:param name="appLen"/>
		<xsl:param name="appSts"/>
		<xsl:choose>			
			<xsl:when test="$appLen != '0'">
				<xsl:element name="{$RSPTAG}">	
					<xsl:element name="RSPLEN">
						<xsl:value-of select="$appLen"/>
					</xsl:element>
					<xsl:element name="RSPCOD">
						<xsl:value-of select="$appSts"/>
					</xsl:element>
				</xsl:element>		
				<xsl:choose>
					<xsl:when test="$appSts = '41' ">
						<xsl:element name="{$BDYTAG}">
							<!--xsl:element name="TLTXCD">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+4,3)))"/>
							</xsl:element-->
							<xsl:element name="TLBSEQ">
								<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER)+7,5), xs:integer(9), xs:integer(0))"/>
							</xsl:element>
							<xsl:element name="TLBID">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+12,10)))"/>
							</xsl:element>
							<xsl:element name="TLBCUD">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+22,2)))"/>
							</xsl:element>
							<xsl:element name="TLBWS">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+24,15)))"/>
							</xsl:element>
							<xsl:element name="HOVREQ">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+39,1)))"/>
							</xsl:element>
							<xsl:element name="ER">
								<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER)+40,2), xs:integer(2), xs:integer(0))"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>			
					<xsl:when test="$appSts = '42' ">
						<xsl:element name="{$BDYTAG}">
							<xsl:element name="ERN1">
								<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER)+4,2), xs:integer(3), xs:integer(0))"/>
							</xsl:element>
							<xsl:element name="ERO1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+6,1)))"/>
							</xsl:element>
							<xsl:element name="APL1">
								<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER)+7,2), xs:integer(2), xs:integer(0))"/>
							</xsl:element>
							<xsl:element name="APT1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+9,1)))"/>
							</xsl:element>
							<xsl:element name="ADT1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+10,1)))"/>
							</xsl:element>
							<xsl:element name="ADF1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+11,19)))"/>
							</xsl:element>
							<xsl:element name="AEC1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+30,3)))"/>
							</xsl:element>
							<xsl:element name="ADT2">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+33,1)))"/>
							</xsl:element>
							<xsl:element name="ADF2">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+34,19)))"/>
							</xsl:element>
							<xsl:element name="ADT3">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+53,1)))"/>
							</xsl:element>
							<xsl:element name="ADF3">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+54,19)))"/>
							</xsl:element>
							<xsl:element name="SWAC1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+73,19)))"/>
							</xsl:element>
							<xsl:element name="SWACTYPE1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+92,1)))"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:when test="$appSts = 'F1' ">
						<xsl:element name="{$BDYTAG}">
							<!--ACCTNO-->
							<xsl:element name="accountNumber">
								<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER)+4,10), xs:integer(19), xs:integer(0))"/>
							</xsl:element>
							<!--CFNA1-->
							<xsl:element name="customerName1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+14,40)))"/>
							</xsl:element>
							<!--CFNA2-->
							<xsl:element name="addressLine1">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+54,40)))"/>
							</xsl:element>
							<!--CFNA3-->
							<xsl:element name="addressLine2">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+94,40)))"/>
							</xsl:element>
							<!--CFNA4-->
							<xsl:element name="addressLine3">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+134,40)))"/>
							</xsl:element>
							<!--CFNA5-->
							<xsl:element name="addressLine4">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+174,40)))"/>
							</xsl:element>
							<!--CFNA6-->
							<xsl:element name="addressLine5">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+214,40)))"/>
							</xsl:element>
							<!--CFNA7-->
							<xsl:element name="customerName2">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+254,40)))"/>
							</xsl:element>
							<!--CFNA8-->
							<xsl:element name="customerName3">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+294,40)))"/>
							</xsl:element>
							<!--JRNSQ-->
							<xsl:element name="journalSeq">
								<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER)+334,5), xs:integer(9), xs:integer(0))"/>
							</xsl:element>
							<!--USRID-->
							<xsl:element name="tellerID">
								<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+339,10)))"/>
							</xsl:element>
						</xsl:element>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="{$BDYTAG}" />
					</xsl:otherwise>
				</xsl:choose>				
				<xsl:choose>
					<xsl:when test="number($COUNTER+number($appLen)+2) &lt; $totalSize">
						<xsl:call-template name="BDYRSP">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>				
							<xsl:with-param name="COUNTER" select="$COUNTER+number($appLen)+2"/>			
							<xsl:with-param name="RSPTAG" select="concat('RSP',$LOOP)"/>								
							<xsl:with-param name="BDYTAG" select="concat('BDY',$LOOP)"/>
							<xsl:with-param name="appLen" select="format-number(number(normalize-space(util:decodePack(mf:substr($matches,xs:integer($COUNTER)+xs:integer($appLen)+2,2), xs:integer(3), xs:integer(0)))),'##################0')"/>
							<xsl:with-param name="appSts" select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER)+xs:integer($appLen)+4,2)))"/>
						</xsl:call-template>
					</xsl:when>		
				</xsl:choose>
			</xsl:when>
		</xsl:choose> 
	</xsl:template>
</xsl:stylesheet>