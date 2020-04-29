<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" xmlns:util="http://sibs.dsp.util" >
	<xsl:output method="text" />
	<xsl:strip-space elements="*"/>
	
	<xsl:include href="customfn.xsl"/>

	<!-- Global Variable Maps for DSP Request Header -->
	<xsl:param name="STKHEAD" as="xs:string" select="'*HOST'"/>
	<xsl:param name="I13HLEN" as="xs:string" select="'0000'"/>
	<xsl:param name="I13VERS" as="xs:string" select="'0000'"/>
	<xsl:param name="I13HFMID" as="xs:string" select="if (ETP/MSG/TLBTCD != '') then '*ABCS' else '*MBASE'"/>
	<xsl:param name="I13FMID" as="xs:string" select="if (ETP/MSG/TLBTCD != '') then 'ABCS' else 'MBASE'"/>
	<xsl:param name="I13SID" as="xs:string" select="'*AXIS'"/>
	<xsl:param name="I13USER" as="xs:string" select="ETP/@USER"/>
	<xsl:param name="HDTXCD" as="xs:string" select="ETP/@NAME"/>
	<xsl:param name="I13CHID" as="xs:string" select="if (ETP/APP/HDSRID != '') then ETP/APP/HDSRID else ''"/>

	<!-- Global Variable Maps for APP MBASE Request Header -->
	<xsl:param name="HDEGPI" as="xs:string" select="'*END'"/>
	
	<!-- Global Variable Maps for APP ABCS Request Header -->
	<xsl:param name="ICHEAD" as="xs:string" select="'*COMM'"/>

	<xsl:template match="/">
		<xsl:apply-templates select="ETP" />
	</xsl:template>

	<!-- Step 1: XML to Flat Parsing by concatenating output string on DSP Node -->
	<xsl:template name="DSP">
		<xsl:param name="I13SSNO" />

		<xsl:call-template name="pad-right">
			<!-- SKTHEAD (*CIB/*RIB) -->
			<xsl:with-param name="str" select="$STKHEAD"/>
			<xsl:with-param name="len" select="5"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="SKTDEV"/>
			<xsl:with-param name="len" select="15"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(SKTSKNB)) then SKTSKNB else 0), '000000000')), xs:integer(number(9)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(SKTPORT)) then SKTPORT else 0), '00000')), xs:integer(number(5)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="SKTFILL"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:value-of select="util:encode(string(format-number(number(if (count($I13HLEN)) then $I13HLEN else 0), '0000'))) " />
		<xsl:value-of select="util:encode(string(format-number(number(if (count(I13MLEN)) then I13MLEN else 0), '000000'))) " />
		<xsl:value-of select="util:encode(string(format-number(number(if (count($I13VERS)) then $I13VERS else 0), '0000'))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13HFMID"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="$I13FMID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right"><!-- I13SID -->
			<xsl:with-param name="str" select="$I13SID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="if (I13DID != '') then I13DID[1] else I13DID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13RTGN"/>
			<xsl:with-param name="len" select="6"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13MSTA"/>
			<xsl:with-param name="len" select="8"/>
		</xsl:call-template>
		<xsl:value-of select="util:encode(string(format-number(number(if (count(I13BIN)) then I13BIN else 0), '00000000000'))) " />
		<xsl:value-of select="util:encode(string(format-number(number(if (count(I13NODE)) then I13NODE else 0), '00'))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13XID"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="$I13SSNO"/>
			<xsl:with-param name="len" select="16"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right"><!--I13TRCD-->
			<xsl:with-param name="str" select="'MB01'"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13RRNO"/>
			<xsl:with-param name="len" select="22"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right"><!-- I13ACQN -->
			<xsl:with-param name="str" select="I13ACQN"/>
			<xsl:with-param name="len" select="12"/>
		</xsl:call-template>
		<xsl:value-of select="util:encode(string(format-number(number(if (count(I13TMNO)) then I13TMNO else 0), '0000'))) " />
		<xsl:value-of select="util:encode(string(format-number(number(if (count(I13NREC)) then I13NREC else 0), '0000'))) " />
		<xsl:value-of select="util:encode(string(format-number(number(if (count(I13NERR)) then I13NERR else 0), '0000'))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="$I13USER"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13TMID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right"><!-- I13SUPV -->
			<xsl:with-param name="str" select="I13SUPV"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13MORE"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13CUTO"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13UDTA"/>
			<xsl:with-param name="len" select="20"/>
		</xsl:call-template>
		<!--xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13SDTA"/>
			<xsl:with-param name="len" select="36"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13TTYP"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13RCNF"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="I13RCNM"/>
			<xsl:with-param name="len" select="16"/>
		</xsl:call-template-->
	</xsl:template>

	<!-- Step1: XML to Flat Parsing by concatenating output string on APP MBASE Node -->
	<xsl:template name="APP">
		<xsl:param name="HDSRID2"/>

		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRIND"/>
			<xsl:with-param name="len" select="2"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDUSID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDRNUM)) then HDRNUM else 0), '0000000')), xs:integer(number(7)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDRBID)) then HDRBID else 0), '00000')), xs:integer(number(5)),xs:integer(number(0))) " />
		
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="$HDEGPI"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDBMSG)) then HDBMSG else 0), '000')), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<!--HDSRID-->
			<!--SourceId sent to host (IBK)-->
			<xsl:with-param name="str" select="HDSRID"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<!--HDDSID-->
			<!--Destination Id is getting from channel value (CIB/RIB)-->
			<xsl:with-param name="str" select="$HDSRID2"/>
			<xsl:with-param name="len" select="3"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRTDQ"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDTMID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDBKNO)) then HDBKNO else 0), '000')), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDBRNO)) then HDBRNO else 0), '00000')), xs:integer(number(5)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRSID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDTSID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDHSID"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count($HDTXCD)) then string(substring($HDTXCD, 3, 7)) else 0), '00000')), xs:integer(number(5)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="'I'"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="'R'"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDNREC)) then HDNREC else 0), '000')), xs:integer(number(3)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDMREC"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right"><!-- HDSMTD -->
			<xsl:with-param name="str" select="'F'"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRCD1"/>
			<xsl:with-param name="len" select="7"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRRE1"/>
			<xsl:with-param name="len" select="50"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRCD2"/>
			<xsl:with-param name="len" select="7"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRRE2"/>
			<xsl:with-param name="len" select="50"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRCD3"/>
			<xsl:with-param name="len" select="7"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRRE3"/>
			<xsl:with-param name="len" select="50"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRCD4"/>
			<xsl:with-param name="len" select="7"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="if (HDVFMT != '00000') then HDVFMT else ''"/><!-- HDRRE4 -->
			<xsl:with-param name="len" select="50"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRCD5"/>
			<xsl:with-param name="len" select="7"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDRRE5"/>
			<xsl:with-param name="len" select="50"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDDTIN)) then HDDTIN else 0), '000000000')), xs:integer(number(9)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDTMIN)) then HDTMIN else 0), '0000000')), xs:integer(number(7)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDACTN)) then HDACTN else 0), '0000000000000000000')), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDACTY"/>
			<xsl:with-param name="len" select="1"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(HDCIFN)) then HDCIFN else 0), '0000000000000000000')), xs:integer(number(19)),xs:integer(number(0))) " />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="HDFILR"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- Step1: XML to Flat Parsing by concatenating output string on APP ABCS Node -->
	<xsl:template name="APPTX">
		<xsl:param name="PTMTXTYP"/>
		<!--xsl:value-of select="util:encodePack(string('0004096'), xs:integer(7), xs:integer(0))" /-->
		<!--ICLEN-->
		<xsl:value-of select="util:encodeBin(xs:integer(4096), xs:integer(4))" />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="$ICHEAD"/>
			<xsl:with-param name="len" select="5"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="ICRTRQ"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="ICDEVN"/>
			<xsl:with-param name="len" select="15"/>
		</xsl:call-template>
		<xsl:value-of select="util:encode(string(format-number(number(if (count(ICID)) then ICID else 0), '00000')))" />
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="ICCOMQ"/>
			<xsl:with-param name="len" select="10"/>
		</xsl:call-template>
		<xsl:value-of select="util:encodePack(string(format-number(number(if (count(ICIPSF)) then ICIPSF else 0), '000000000')), xs:integer(number(9)),xs:integer(number(0))) " />
		<xsl:value-of select="util:encode(string(format-number(number(if (count(TMTIMIN)) then TMTIMIN else 0), '000000')))" />
		<xsl:call-template name="pad-right"><!-- TMTXTYP -->
			<xsl:with-param name="str" select="if ($PTMTXTYP != '') then $PTMTXTYP else 'T9999'"/>
			<xsl:with-param name="len" select="5"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="ICRSV1"/>
			<xsl:with-param name="len" select="5"/>
		</xsl:call-template>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="ICEOM"/>
			<xsl:with-param name="len" select="4"/>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>