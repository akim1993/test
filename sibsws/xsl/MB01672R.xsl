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
					<xsl:element name="reigstrationType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="customerNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="accountType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="searchType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="cifNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="name1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),80)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 80)" />

					<xsl:element name="name2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="birthOrIncorporationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="oldIcNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="newIcNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="birthCertificateNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="passportNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="citizenshipCertificateNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="policeIdNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="armyIdNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="gender">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="countryOfCitizenship">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="race">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="religion">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="registrationChannel">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="registrationLocation">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),3), xs:integer(5), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="registrationReceivedDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="epfRegistrationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="matrimonialAssetCase">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="handicappedRemark">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),50)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 50)" />

					<xsl:element name="cifStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="residentStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="homeTelephone">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="officeTelephone1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="mobilePhone">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="faxNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="emailAddress">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="webPage">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="electronicAddressGroupSequence">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="preferredCommunicationChannel">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="addressSequence1">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="addressLine1A">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine2A">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine3A">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine4A">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine5A">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="cityOrStateOrZip1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="postalCode1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 9)" />

					<xsl:element name="stateCode1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="countryCode1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="remarks1">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressSequence2">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="addressLine1B">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine2B">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine3B">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine4B">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine5B">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="cityOrStateOrZip2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="postalCode2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 9)" />

					<xsl:element name="stateCode2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="countryCode2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="remarks2">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="enforcementCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="employersAddressee">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="employmentStartDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="liabilityCommencementMonth">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="businessConstitutionCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="businessTypeStandardIndustrial">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),4)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 4)" />

					<xsl:element name="formASubmissionMedia">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="noOfEmployees">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),5), xs:integer(9), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 5)" />

					<xsl:element name="blacklistedIndicator">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="accountStatus">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),1), xs:integer(1), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="primaryIdType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="primaryIdNumber">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),15)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 15)" />

					<xsl:element name="contactPersonName">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="contactDepartmentName">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="jobDesignationCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),5)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 5)" />

					<xsl:element name="cifCategory">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="lastNominationDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="relatedLinkCode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="deceasedDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="ageYears">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="ageMonths">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="maritalStatus">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="doesNomineeExists">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="afisIndicator">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="leftThumbprintIndicator">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="rightThumbprintIndicator">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="thumbprintVerifiedDate">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="productType">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),2)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="dateCessationLiability">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),10)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="accountNumber">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),10), xs:integer(19), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 10)" />

					<xsl:element name="formASubmissionMode">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),1)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 1)" />

					<xsl:element name="freezeAccountStatuses">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressSequence3">
						<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER2),2), xs:integer(3), xs:integer(0))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 2)" />

					<xsl:element name="addressLine1C">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine2C">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine3C">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine4C">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="addressLine5C">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="cityOrStateOrZip3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

					<xsl:element name="postalCode3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),9)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 9)" />

					<xsl:element name="stateCode3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="countryCode3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),3)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 3)" />

					<xsl:element name="remarks3">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER2),40)))"/>
					</xsl:element>
					<xsl:variable name="COUNTER2" select="number($COUNTER2 + 40)" />

				</xsl:element>

				<!--xsl:choose>
					<xsl:when test="$LOOP &lt; number(util:decodePack(mf:substr($matches,334,2), xs:integer(3), xs:integer(0)))">
						<xsl:call-template name="BDY">
							<xsl:with-param name="LOOP" select="number($LOOP+1)"/>
							<xsl:with-param name="COUNTER2" select="number($COUNTER2+1779)"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="MBERRO"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
