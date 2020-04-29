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

					<xsl:element name="memberNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="applicantNameLine1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantNameLine2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantNameLine3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantIDNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="applicantIDTypeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="applicantAddressLine1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantAddressLine2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantAddressLine3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantAddressLine4">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantAddressLine5">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantAddressPostcode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 9)" />

					<xsl:element name="applicantAddressCity">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantAddressStateCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="applicantAddressCountryCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="applicantResidencePhoneNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantOfficePhoneNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantMobilePhoneNo">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantFaxNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="applicantEmailAddress">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="appliedRegistrationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="withdrawalSchemeCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="sourceChannelID">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="registrationOriginationBranch">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),3), xs:integer(5), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="approvalBranch">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),3), xs:integer(5), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="registrationUserID">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="processingUserID">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="approvalUserID">
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

					<xsl:element name="statusReasonCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),5)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 5)" />

					<xsl:element name="appliedAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="applicationType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="previousApplicationNo">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="totalReinstatementAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="dateReinstated">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="dateApproved">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="remarkOrReason1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="remarkOrReason2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="remarkOrReason3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="remarkOrReason4">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="affectedBalanceDuringApp">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalPaymentAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalPrincipalAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalDividendAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalSupplementaryDividendAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalWithdrawalBenefitAmt">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalLumpsumAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalRecurringAmount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="totalServiceCharge">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="amountTransferToSubAc">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),8), xs:integer(15), xs:integer(2))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 8)" />

					<xsl:element name="transferToSubAccount">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),6), xs:integer(11), xs:integer(7))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 6)" />

					<xsl:element name="paymentProcessDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="originalMemberNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

				</xsl:element>

				<xsl:choose>
					<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
						<xsl:call-template name="BDY">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
							<xsl:with-param name="COUNTER2" select="number($COUNTER2+898)"/>
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
