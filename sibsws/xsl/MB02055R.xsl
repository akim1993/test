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
					<xsl:element name="memberAccountNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),19)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 19)" />

					<xsl:element name="memberAccountType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="statementYear">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="memberName1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="memberName2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="idNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="idType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="address1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="address2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="address3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="address4">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="address5">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="postalCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 9)" />

					<xsl:element name="countryCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="stateCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="latestRelatedAccountNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),19)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 19)" />

					<xsl:element name="latestRelatedAccountType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="lastStatementOpeningBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="lastStatementOpeningBalanceAc1">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="lastStatementOpeningBalanceAc2">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="lastStatementOpeningBalanceAc3">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalDividendPaidAc1">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalDividendPaidAc2">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalDividendPaidAc3">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalDividendPaid">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="dividendRateForTheYear">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),6), xs:integer(11), xs:integer(9))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 6)" />

					<xsl:element name="dividendToAc1">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="dividendToAc2">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="dividendToAc3">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalDividendToAc">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="accountBalance1">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="accountBalance2">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="accountBalance3">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalAccountBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="lastNominationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />
					
					<xsl:call-template name="ITEM">
						<xsl:with-param name="LOOP" select="number(1)"/>
						<xsl:with-param name="COUNTER2" select="number(1163)"/>
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
		<xsl:choose>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,243,2))) = 'AA'">
				<xsl:element name="ITEM" >
					<xsl:element name="transactionDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="transactionCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="transactionDescription">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="contributionMonth">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="wages">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="memberShared">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="employerShared">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalContribution">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="transactionAmountForAc1">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="transactionAmountForAc2">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="transactionAmountForAc3">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="runningBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />
					
					<xsl:element name="runningBalance">
						<xsl:value-of select="number($COUNTER2)"/>
					</xsl:element>

				</xsl:element>

				<xsl:choose>
					<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
						<xsl:call-template name="ITEM">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
							<xsl:with-param name="COUNTER2" select="number($COUNTER2+128)"/>
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
