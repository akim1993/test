<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" xmlns:util="http://sibs.dsp.util">

	<!-- Include Standard Header template of XML to Flat Parsing by concatenating output string on both DSP and APP nodes -->
	<xsl:include href="_DSPMBI.xsl"/> 

	<xsl:template match="DSP">
		<xsl:call-template name="DSP">
			<xsl:with-param name="I13SSNO" select="'AXIS.MBS.CIF.INQ'"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="APP">
		<xsl:call-template name="APP">
			<xsl:with-param name="HDSRID2" select="'RBK'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- Service Context XML to Flat Parsing by concatenating output string on MSG node -->
	<xsl:template match="MSG">
