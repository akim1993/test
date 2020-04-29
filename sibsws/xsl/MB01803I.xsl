<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" xmlns:util="http://sibs.dsp.util">

	<!-- Include Standard Header template of XML to Flat Parsing by concatenating output string on both DSP and APP nodes -->
	<xsl:include href="_DSPMBI.xsl"/> 

	<xsl:template match="DSP">
		<xsl:call-template name="DSP">
			<xsl:with-param name="I13SSNO" select="'AXIS.MBS.CIF.MTN'"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="APP">
		<xsl:call-template name="APP">
			<xsl:with-param name="HDSRID2" select="'RBK'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- Service Context XML to Flat Parsing by concatenating output string on MSG node -->
	<xsl:template match="MSG">
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(customerNumber)) then customerNumber else 0), '0000000000000000000')), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(addressSequenceNumber)) then addressSequenceNumber else 0), '000')), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="addressType"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="addressLine1"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="addressLine2"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="addressLine3"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="addressLine4"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="addressLine5"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="city"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="postalCode"/>
			<xsl:with-param name="len" select="9"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="stateCode"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="countryCode"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="remark"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="enforcementCode"/>
			<xsl:with-param name="len" select="15"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="employersAddressee"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
	</xsl:template> 

</xsl:stylesheet>
