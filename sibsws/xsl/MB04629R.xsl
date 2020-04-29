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
					<xsl:element name="applicationReferenceNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="payeeSequenceNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),4), xs:integer(6), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="paymentSequenceNo">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),4), xs:integer(6), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="payeeNameLine1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeNameLine2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeIDNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="payeeIDTypeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="payeeAddressLine1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeAddressLine2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeAddressLine3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeAddressLine4">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeAddressLine5">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeAddressPostCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 9)" />

					<xsl:element name="payeeAddressCity">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="payeeAddressStateCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="payeeAddressCountryCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="paymentAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="paymentCurrency">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="paymentMode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="paymentEffectiveDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="paymentStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="statusDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="bankCode">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),5), xs:integer(9), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 5)" />

					<xsl:element name="bankAccountNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),20)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 20)" />

					<xsl:element name="bankAccountType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="paymentMethod">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="financialInstrumentCollectionState">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="financialInstrumentCollectionBranch">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),3), xs:integer(5), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="serialNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),25)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 25)" />

					<xsl:element name="dateExtracted">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="datePAReceived">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="dateCollected">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="datePaid">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="remarksOrReturnDescription1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="remarksOrReturnDescription2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="principalAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="dividendAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="withdrawalSchemeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="withdrawalSchemeDescription">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="withdrawalAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="applicationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="approvedDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="applicationStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="statusDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="payeeOldICNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="payeeOldICTypeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="payeeOtherID">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="payeeOtherIDTypeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="paymentType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="deathWithdrawalCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="percentageValue">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),6), xs:integer(11), xs:integer(7))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 6)" />

					<xsl:element name="noOfFraction">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="divisorOfFraction">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="codeTotal">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="uncashedGLAcNo">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="bankReturnStatusReasonCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="bankReturnStatusReasonDescription">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),50)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 50)" />

				</xsl:element>

				<xsl:choose>
					<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
						<xsl:call-template name="BDY">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
							<xsl:with-param name="COUNTER2" select="number($COUNTER2+769)"/>
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
