<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:util="http://sibs.dsp.util"
	xmlns:mf="http://sibs.mbase.adapter.mf"
	xmlns:functx="http://www.functx.com"
	exclude-result-prefixes="xs">
	<xsl:output indent="yes"/>

	<xsl:include href="customfn.xsl"/>
	
	<xsl:variable name="COUNTER" select="number(1)"/>

	<!-- Standard XML Root node to be output-->	
	<xsl:template match="/">
		<xsl:element name="ETP">
			<xsl:call-template name="text2xml"/>    
		</xsl:element>
	</xsl:template> 

	<!-- Standard called templates Flat to XML Parsing by generating both DSP and APP(MBASE) nodes -->
	<xsl:template name="DSPHDRO">
		<!-- Step1: Flat to XML Parsing by generating both DSP node -->
		<xsl:element name="DSP">
			<xsl:element name="SKTHEAD">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),5)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 5)" />
			
			<xsl:element name="SKTDEV">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),15)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 15)" />
			
			<xsl:element name="SKTSKNB">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),5), xs:integer(9), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 5)" />
			
			<xsl:element name="SKTPORT">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),3), xs:integer(5), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 3)" />
			
			<xsl:element name="SKTFILL">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="I13HLEN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13MLEN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),6)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 6)" />
			
			<xsl:element name="I13VERS">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13HFMID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13FMID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="I13SID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="I13DID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="I13RTGN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),6)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 6)" />
			
			<xsl:element name="I13MSTA">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),8)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 8)" />
			
			<xsl:element name="I13BIN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),11)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 11)" />
			
			<xsl:element name="I13NODE">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),2)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 2)" />
			
			<xsl:element name="I13XID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),20)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 20)" />
			
			<xsl:element name="I13SSNO">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),16)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 16)" />
			
			<xsl:element name="I13TRCD">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13RRNO">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),22)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 22)" />
			
			<xsl:element name="I13ACQN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),12)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 12)" />
			
			<xsl:element name="I13TMNO">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13NREC">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13NERR">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="I13USER">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="I13TMID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="I13SUPV">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="I13MORE">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="I13CUTO">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="I13UDTA">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),20)))"/>
			</xsl:element>
			
			<!--xsl:element name="I13SDTA">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,249,36)))"/>
			</xsl:element>
			<xsl:element name="I13TTYP">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,285,2)))"/>
			</xsl:element>
			<xsl:element name="I13RCNF">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,287,1)))"/>
			</xsl:element>
			<xsl:element name="I13RCNM">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,288,16)))"/>
			</xsl:element-->
		</xsl:element>
	</xsl:template>

	<xsl:template name="APPHDRO">
		<!-- Step2: Flat to XML Parsing by generating both APP MBASE node (TOTAL MB HEADER 420) -->
		<xsl:element name="APP">
			<xsl:variable name="COUNTER" select="number($COUNTER+242)" />
			
			<xsl:element name="HDRIND">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),2)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 2)" />
			
			<xsl:element name="HDUSID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="HDRNUM">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),4), xs:integer(7), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="HDRBID">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),3), xs:integer(5), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 3)" />
			
			<xsl:element name="HDEGPI">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),4)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="HDBMSG">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),2), xs:integer(3), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 2)" />
			
			<xsl:element name="HDSRID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),3)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 3)" />
			
			<xsl:element name="HDDSID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),3)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 3)" />
			
			<xsl:element name="HDRTDQ">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="HDTMID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="HDBKNO">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),2), xs:integer(3), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 2)" />
			
			<xsl:element name="HDBRNO">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),3), xs:integer(5), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 3)" />
			
			<xsl:element name="HDRSID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<!--xsl:element name="HDTSID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element-->
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<!--xsl:element name="HDHSID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element-->
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="HDTXCD">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),3), xs:integer(5), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 3)" />
			
			<xsl:element name="HDACCD">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="HDTMOD">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="HDNREC">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),2), xs:integer(3), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 2)" />
			
			<xsl:element name="HDMREC">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="HDSMTD">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="HDRCD1">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),7)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 7)" />
			
			<xsl:element name="HDRRE1">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),50)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 50)" />
			
			<xsl:element name="HDRCD2">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),7)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 7)" />
			
			<xsl:element name="HDRRE2">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),50)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 50)" />
			
			<xsl:element name="HDRCD3">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),7)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 7)" />
			
			<xsl:element name="HDRRE3">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),50)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 50)" />
			
			<xsl:element name="HDRCD4">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),7)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 7)" />
			
			<xsl:element name="HDVFMT">
				<xsl:value-of select="functx:trim(util:decode(mf:substr($matches,xs:integer($COUNTER),50)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 50)" />
			
			<xsl:element name="HDRCD5">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),7)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 7)" />
			
			<xsl:element name="HDRRE5">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),50)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 50)" />
			
			<xsl:element name="HDDTIN">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),5), xs:integer(9), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 5)" />
			
			<xsl:element name="HDTMIN">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),4), xs:integer(7), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 4)" />
			
			<xsl:element name="HDACTN">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),10), xs:integer(19), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="HDACTY">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),1)))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 1)" />
			
			<xsl:element name="HDCIFN">
				<xsl:value-of select="util:decodePack(mf:substr($matches,xs:integer($COUNTER),10), xs:integer(19), xs:integer(0))"/>
			</xsl:element>
			<xsl:variable name="COUNTER" select="number($COUNTER + 10)" />
			
			<xsl:element name="HDFILR">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,xs:integer($COUNTER),10)))"/>
			</xsl:element>
			
		</xsl:element>
	</xsl:template>

	<xsl:template name="APPTXHDRO">
		<!-- Step2: Flat to XML Parsing by generating both APP ABCS node -->
		<xsl:element name="APP">
			<xsl:element name="ICLEN">
				<!--xsl:value-of select="format-number(number(normalize-space(util:decodePack(mf:substr($matches,304,4), xs:integer(9), xs:integer(0)))),'##################0')"/-->
			</xsl:element>
			<xsl:element name="ICHEAD">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,308,5)))"/>
			</xsl:element>
			<xsl:element name="ICRTRQ">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,313,10)))"/>
			</xsl:element>
			<xsl:element name="ICDEVN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,323,15)))"/>
			</xsl:element>
			<xsl:element name="ICID">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,338,5)))"/>
			</xsl:element>
			<xsl:element name="ICCOMQ">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,343,10)))"/>
			</xsl:element>
			<xsl:element name="ICIPSF">
				<xsl:value-of select="format-number(number(normalize-space(util:decodePack(mf:substr($matches,353,5), xs:integer(9), xs:integer(0)))),'##################0')"/>
			</xsl:element>
			<xsl:element name="TMTIMIN">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,358,6)))"/>
			</xsl:element>
			<xsl:element name="TMTXTYP">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,364,5)))"/>
			</xsl:element>
			<xsl:element name="ICRSV1">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,369,5)))"/>
			</xsl:element>
			<xsl:element name="ICEOM">
				<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,374,4)))"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<!-- Standard called templates: Flat to XML Parsing by generating ERR node -->
	<xsl:template name="MBERRO">
		<xsl:choose>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,90,8))) = '.DSP0001'">
				<xsl:element name="ERR" >
					<xsl:element name="ERRCDE">DSP0001</xsl:element>
					<xsl:element name="ERRIND">E</xsl:element>
					<xsl:element name="ERRDES">System Error</xsl:element>
					<xsl:element name="ERRFLD"/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,90,8))) = '.DSP0002'">
				<xsl:element name="ERR" >
					<xsl:element name="ERRCDE">DSP0002</xsl:element>
					<xsl:element name="ERRIND">E</xsl:element>
					<xsl:element name="ERRDES">Route name not found</xsl:element>
					<xsl:element name="ERRFLD"/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,90,8))) = '.DSP0003'">
				<xsl:element name="ERR" >
					<xsl:element name="ERRCDE">DSP0003</xsl:element>
					<xsl:element name="ERRIND">E</xsl:element>
					<xsl:element name="ERRDES">Transaction Timeout</xsl:element>
					<xsl:element name="ERRFLD"/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="normalize-space(util:decode(mf:substr($matches,90,8))) = '.MBM0002'">
				<xsl:element name="ERR" >
					<xsl:element name="ERRCDE">MBM0002</xsl:element>
					<xsl:element name="ERRIND">E</xsl:element>
					<xsl:element name="ERRDES">Invalid User ID</xsl:element>
					<xsl:element name="ERRFLD"/>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="ERR" >
					<!--xsl:element name="ERRCDE">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,724,7)))"/>
					</xsl:element>
					<xsl:element name="ERRIND">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,731,1)))"/>
					</xsl:element>
					<xsl:element name="ERRDES">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,732,150)))"/>
					</xsl:element>
					<xsl:element name="ERRFLD">
						<xsl:value-of select="normalize-space(util:decode(mf:substr($matches,882,10)))"/>
					</xsl:element--> 
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	

	<xsl:function name="mf:substr" as="xs:string*">
		<xsl:param name="value"/>
		<xsl:param name="startPos"/>
		<xsl:param name="length"/>
		<xsl:variable name="from" select="$startPos" />
		<xsl:variable name="to" select="($startPos + $length)-1" />
		<xsl:value-of select="for $i in $from to $to return concat($value[$i], '')" separator="," /> 
	</xsl:function>
	<xsl:function name="mf:extract" as="xs:string*">
		<xsl:param name="input" as="xs:string"/>
		<xsl:param name="pattern" as="xs:string"/>
		<xsl:analyze-string select="$input" regex="{$pattern}">
			<xsl:matching-substring>
				<xsl:sequence select="."/>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:function>

	<!-- Remove whitespace at the beginning and end of string -->
	<xsl:function name="functx:trim" as="xs:string">
		<xsl:param name="arg" as="xs:string?"/>
		<xsl:sequence select="replace(replace($arg,'\s+$',''),'^\s+','')"/>
	</xsl:function>

</xsl:stylesheet>