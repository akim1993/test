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
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="accountType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="cifNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="withdrawalSchemeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="primaryIDNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="primaryIDType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="customerName1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="customerName2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="customerName3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="birthDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="yearOfAge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="monthOfAge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="cifStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="deceasedOrdissolvedDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="countryOfCitizenshipOrIncorporation">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="accountStatus">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),1), xs:integer(1), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="accountClosedStatus">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),1), xs:integer(1), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="totalAccountAvailableBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalAccountLedgerBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalEmployerShare">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalLastDividendPaid">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="affectedBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="eligibleAmountToWithdraw">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="schemeStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="schemeDescription">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="citizenshipRestriction">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="schemeGroupingCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="withdrawalFrequency">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="withdrawalFrequencyCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="yearOfMinimumAge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="monthOfMinimumAge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="yearOfMaximumAge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="monthOfMaximumAge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="balanceType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="affectBalance">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="withdrawFromSubAccounts">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="minimumAccountBalance">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="retainableAmountCheck">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="accountAgainstRetainableAmountCheck">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="roundedRetainableAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="lastWithdrawalApplicationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

				</xsl:element>

				<xsl:choose>
					<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
						<xsl:call-template name="BDY">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
							<xsl:with-param name="COUNTER2" select="number($COUNTER2+348)"/>
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
