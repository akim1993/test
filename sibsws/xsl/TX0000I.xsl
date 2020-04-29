<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" xmlns:util="http://sibs.dsp.util">

	<!-- Include Standard Header template of XML to Flat Parsing by concatenating output string on both DSP and APP nodes -->
	<xsl:include href="_DSPMBI.xsl"/>
	
	<xsl:param name="CHANNEL" as="xs:string" select="'AXISSYSTEMSDNBHD'"/>
	<xsl:param name="TMTXTYP" as="xs:string" select="'T9999'" />

	<xsl:template match="DSP">
		<xsl:call-template name="DSP">
			<xsl:with-param name="I13SSNO" select="$CHANNEL"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="APP">
		<xsl:call-template name="APPTX">
			<xsl:with-param name="PTMTXTYP" select="$TMTXTYP"/>
		</xsl:call-template>
	</xsl:template>

	<!-- Service Context XML to Flat Parsing by concatenating output string on MSG node -->
	<xsl:template match="MSG">
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBSEQ != '') then TLBSEQ else 0), xs:integer(number(9)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCOR"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBOSQ != '') then TLBOSQ else 0), xs:integer(number(9)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-left">
			<xsl:with-param name="str" select="TLBTCD"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="dateTime-to-xml-new"><!--TLBTDT-->
			<xsl:with-param name="str" select="TLBTDT"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="dateTime-to-xml-new"><!--TLBEDT-->
			<xsl:with-param name="str" select="TLBEDT"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCUD"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBWS"/>
			<xsl:with-param name="len" select="15"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBSOV"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-left">
			<xsl:with-param name="str" select="TLBBRC"/>
			<xsl:with-param name="len" select="5"/>
		</xsl:call-template>
		<xsl:call-template name="pad-left">
			<xsl:with-param name="str" select="TLBPST"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right"><!--TLBAPM-->
			<xsl:with-param name="str" select="TLBAPM"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBFRD"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBTRN"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRBD"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBTLO"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBSVO"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBFEO"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBREL"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<!--TLBF01-->
		<xsl:value-of select="util:encodePack(string(if (accountNumber != '') then accountNumber else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<!--TLBF02-->
		<xsl:value-of select="util:encodePack(string(if (transactionAmount != '') then transactionAmount else 0), xs:integer(number(19)),xs:integer(number(2))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF03 != '') then TLBF03 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF04 != '') then TLBF04 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF05 != '') then TLBF05 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF06 != '') then TLBF06 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF07 != '') then TLBF07 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF08 != '') then TLBF08 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF09 != '') then TLBF09 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF10 != '') then TLBF10 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<!--TLBF11-->
		<xsl:value-of select="util:encodePack(string(if (contributionDueMonth != '') then contributionDueMonth else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<!--TLBF12-->
		<xsl:value-of select="util:encodePack(string(if (paymentReceiveDat != '') then paymentReceiveDat else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF13 != '') then TLBF13 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF14 != '') then TLBF14 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF15 != '') then TLBF15 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF16 != '') then TLBF16 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF17 != '') then TLBF17 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF18 != '') then TLBF18 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF19 != '') then TLBF19 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF20 != '') then TLBF20 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<!--TLBF21-->
		<xsl:value-of select="util:encodePack(string(if (bankingClearanceGLAcctNo != '') then bankingClearanceGLAcctNo else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF22 != '') then TLBF22 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF23 != '') then TLBF23 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF24 != '') then TLBF24 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF25 != '') then TLBF25 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF26 != '') then TLBF26 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF27 != '') then TLBF27 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF28 != '') then TLBF28 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBF29 != '') then TLBF29 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<!--TLBF30-->
		<xsl:value-of select="util:encodePack(string(if (receiptNo != '') then receiptNo else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCUR"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBCIF != '') then TLBCIF else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBPRD"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBSRC"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBTPN"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBPNM"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBREN"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBIDC"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBMDC"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBXAT"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBXMT"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRFN"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLCUR1"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLCUR2"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLCUR3"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLCUR4"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLCUR5"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC01"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC02"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC03"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC04"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC05"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC06"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC07"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC08"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC09"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC10"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC11"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC12"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC13"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC14"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC15"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC16"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC17"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC18"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC19"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC20"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC21"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC22"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC23"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC24"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC25"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC26"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC27"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC28"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC29"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBC30"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL01"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL02"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL03"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL04"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL05"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL06"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL07"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL08"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL09"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL10"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL11"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL12"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL13"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL14"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL15"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL16"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL17"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL18"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL19"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL20"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL21"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL22"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL23"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL24"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL25"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL26"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL27"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL28"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL29"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBL30"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLXUFD"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLXSNM"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLXFNM"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLXANM"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLXWHC != '') then TLXWHC else 0), xs:integer(number(1)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBACF != '') then TLBACF else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV01 != '') then TXOV01 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV02 != '') then TXOV02 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV03 != '') then TXOV03 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV04 != '') then TXOV04 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV05 != '') then TXOV05 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV06 != '') then TXOV06 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV07 != '') then TXOV07 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV08 != '') then TXOV08 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV09 != '') then TXOV09 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV10 != '') then TXOV10 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV11 != '') then TXOV11 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV12 != '') then TXOV12 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV13 != '') then TXOV13 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV14 != '') then TXOV14 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV15 != '') then TXOV15 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV16 != '') then TXOV16 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV17 != '') then TXOV17 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV18 != '') then TXOV18 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV19 != '') then TXOV19 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV20 != '') then TXOV20 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV21 != '') then TXOV21 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV22 != '') then TXOV22 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV23 != '') then TXOV23 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV24 != '') then TXOV24 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV25 != '') then TXOV25 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV26 != '') then TXOV26 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV27 != '') then TXOV27 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV28 != '') then TXOV28 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV29 != '') then TXOV29 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TXOV30 != '') then TXOV30 else 0), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLCPCD"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS1"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS2"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS3"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS4"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS5"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRSA"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS6"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS7"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS8"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRS9"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBR10"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBR11"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBR12"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBR13"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBR14"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBR15"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRSC"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBSPF"/>
			<xsl:with-param name="len" select="30"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBTXREF"/>
			<xsl:with-param name="len" select="22"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBSRCSYS"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBKEY"/>
			<xsl:with-param name="len" select="100"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCLRG"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBGLFNO"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBRVREF != '') then TLBRVREF else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBLCSUP"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="FILL03"/>
			<xsl:with-param name="len" select="13"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBREM1"/>
			<xsl:with-param name="len" select="256"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBINTF"/>
			<xsl:with-param name="len" select="256"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBCVT01 != '') then TLBCVT01 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT02 != '') then TLBCVT02 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT03 != '') then TLBCVT03 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT04 != '') then TLBCVT04 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT05 != '') then TLBCVT05 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT06 != '') then TLBCVT06 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT07 != '') then TLBCVT07 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT08 != '') then TLBCVT08 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT09 != '') then TLBCVT09 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT10 != '') then TLBCVT10 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT11 != '') then TLBCVT11 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT12 != '') then TLBCVT12 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT13 != '') then TLBCVT13 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT14 != '') then TLBCVT14 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBCVT15 != '') then TLBCVT15 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR01"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR02"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR03"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR04"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR05"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR06"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR07"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR08"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR09"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR10"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR11"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR12"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR13"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR14"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCCR15"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<!--TLBRCF-->
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="formReceivedIndicator"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<!--TLBPYCH-->
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="paymentChannel"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<!--TLBFSCH-->
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="formSubmitChannel"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBORF"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBYRF"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBGLREF != '') then TLBGLREF else 0), xs:integer(number(13)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRMK"/>
			<xsl:with-param name="len" select="35"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBINFO"/>
			<xsl:with-param name="len" select="700"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBABC != '') then TLBABC else 0), xs:integer(number(9)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBABRC != '') then TLBABRC else 0), xs:integer(number(5)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBBCNO != '') then TLBBCNO else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBISBN"/>
			<xsl:with-param name="len" select="6"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBICNO"/>
			<xsl:with-param name="len" select="15"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBICTY"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBJVNO != '') then TLBJVNO else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="FILL04"/>
			<xsl:with-param name="len" select="951"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBRTETY"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBCNTN"/>
			<xsl:with-param name="len" select="40"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBAM1 != '') then TLBAM1 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM2 != '') then TLBAM2 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM3 != '') then TLBAM3 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM4 != '') then TLBAM4 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM5 != '') then TLBAM5 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM6 != '') then TLBAM6 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM7 != '') then TLBAM7 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM8 != '') then TLBAM8 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM9 != '') then TLBAM9 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM10 != '') then TLBAM10 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM11 != '') then TLBAM11 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM12 != '') then TLBAM12 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM13 != '') then TLBAM13 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM14 != '') then TLBAM14 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM15 != '') then TLBAM15 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM16 != '') then TLBAM16 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM17 != '') then TLBAM17 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM18 != '') then TLBAM18 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM19 != '') then TLBAM19 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBAM20 != '') then TLBAM20 else 0), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBERM != '') then TLBERM else 0), xs:integer(number(11)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="TLBWTY"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(if (TLBPYQ != '') then TLBPYQ else 0), xs:integer(number(7)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(if (TLBPMQ != '') then TLBPMQ else 0), xs:integer(number(7)),xs:integer(number(0))) " />
	</xsl:template>
</xsl:stylesheet>
