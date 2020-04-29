<xsl:stylesheet version="2.0" exclude-result-prefixes="exslt xs"
	xmlns:exslt="http://exslt.org/common" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:util="http://sibs.dsp.util">
	
	<!-- function: Padding Left with Zero for a string with encode -->
	<xsl:template name="pad-left">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:choose>
			<xsl:when test="string-length(string($str)) &gt; $len">
				<xsl:value-of select="util:encode(string(substring($str, 1, $len)))"/>
			</xsl:when>
			<xsl:when test="string-length(string($str)) &lt; $len">
				<xsl:call-template name="pad-left">
					<xsl:with-param name="str" select="concat('0', $str)"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string($str))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- function: Padding Right with Space for a string with encode -->
	<xsl:template name="pad-right">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:choose>
			<xsl:when test="string-length($str) &gt; $len">
				<xsl:value-of select="util:encode(string(substring($str, 1, $len)))" />
			</xsl:when>
			<xsl:when test="string-length($str) &lt; $len">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="concat($str, ' ')"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string($str))" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="pad-right-with">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:param name="pad"/>	
		<xsl:choose>
			<xsl:when test="string-length(string($str)) &gt; $len">
				<xsl:value-of select="substring($str, 1, $len)"/>
			</xsl:when>
			<xsl:when test="string-length(string($str)) &lt; $len">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="concat($str, $pad)"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string($str))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="acctyp-to-xml">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str='D'">
				<xsl:value-of select="util:encode(string('CACC'))"/>
			</xsl:when>
			<xsl:when test="$str='S'">
				<xsl:value-of select="util:encode(string('SVGS'))"/>
			</xsl:when>
			<xsl:when test="$str='L'">
				<xsl:value-of select="util:encode(string('LOAN'))"/>
			</xsl:when>
			<xsl:when test="$str='C'">
				<xsl:value-of select="util:encode(string('CCRD'))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string('DFLT'))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="acctyp-to-flat">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="normalize-space($str)='CACC'">
				<xsl:value-of select="util:encode(string('D'))"/>
			</xsl:when>
			<xsl:when test="normalize-space($str)='SVGS'">
				<xsl:value-of select="util:encode(string('S'))"/>
			</xsl:when>
			<xsl:when test="normalize-space($str)='LOAN'">
				<xsl:value-of select="util:encode(string('L'))"/>
			</xsl:when>
			<xsl:when test="normalize-space($str)='CCRD'">
				<xsl:value-of select="util:encode(string('C'))"/>
			</xsl:when>
			<xsl:when test="normalize-space($str)='DFLT'">
				<xsl:value-of select="util:encode(string(' '))"/>
			</xsl:when>
			<xsl:otherwise>
				<!--xsl:value-of select="normalize-space($str)"/-->
				<!-- 20171130: interim, as per Pei Yee's note, change 'U' to 'S'-->
				<!-- 20171207: interim, as per KAr Wei's note, other value will map *BLANK-->
				<xsl:value-of select="' '"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 20180524 tested good 
	     20180524: obtained latest specification from host team:-
		1->SVGS
		2->CACC
		3->CCRD
		4->LOAN
	-->
	<xsl:template name="acctyp-to-flat-host">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str='1'">
				<xsl:value-of select="util:encode(string('SVGS'))"/>
			</xsl:when>
			<xsl:when test="$str='2'">
				<xsl:value-of select="util:encode(string('CACC'))"/>
			</xsl:when>
			<xsl:when test="$str='3'">
				<xsl:value-of select="util:encode(string('CCRD'))"/>
			</xsl:when>
			<xsl:when test="$str='4'">
				<xsl:value-of select="util:encode(string('LOAN'))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string('DFLT'))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="acctypnum-to-string">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str='1'">
				<xsl:value-of select="util:encode(string('S'))"/>
			</xsl:when>
			<xsl:when test="$str='2'">
				<xsl:value-of select="util:encode(string('D'))"/>
			</xsl:when>
			<xsl:when test="$str='3'">
				<xsl:value-of select="util:encode(string('C'))"/>
			</xsl:when>
			<xsl:when test="$str='4'">
				<xsl:value-of select="util:encode(string('L'))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string(' '))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="accnum-to-flat">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:choose>
			<xsl:when test="string-length(string($str)) &gt; $len">
				<!--xsl:value-of select="substring($str, string-length(string($str))-$len + 1, string-length(string($str)))"/-->
				<xsl:value-of select="substring($str, string-length(string($str))-$len + 1, $len)"/>
			</xsl:when>
			<xsl:otherwise>
				<!--xsl:value-of select="normalize-space($str)"/-->				
				<xsl:call-template name="pad-left">
					<xsl:with-param name="str" select="$str"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>				
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Added on 13/02/2019 -->
	<xsl:template name="acctyp-to-custcgrypurpcode">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str='CCRD'">
				<xsl:value-of select="util:encode(string('CCRD'))"/>
			</xsl:when>
			<xsl:when test="$str='LOAN'">
				<xsl:value-of select="util:encode(string('LOAN'))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="util:encode(string('CASH'))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<!-- RESPONSE -->
	<!--xsl:template name="amount-to-xml">
		<xsl:param name="str" />
		<xsl:param name="dec"/>
		<xsl:value-of select="format-number(number(substring($str,1, string-length(string($str))-$dec )), '#')" />
		<xsl:value-of select="'.'" />
		<xsl:value-of select="substring($str, string-length(string($str))-$dec +1, $dec )" />		
	</xsl:template-->
	
	<xsl:template name="amount-to-xml">
		<xsl:param name="str" />
		<xsl:param name="dec"/>			
		
		<xsl:variable name="varN">
			<var id="0">}</var >
			<var id="1">J</var >
			<var id="2">K</var >
			<var id="3">L</var >
			<var id="4">M</var >
			<var id="5">N</var >
			<var id="6">O</var >
			<var id="7">P</var >
			<var id="8">Q</var >
			<var id="9">R</var >
		</xsl:variable>
		<xsl:for-each select="$varN/var" >
			<xsl:choose>		
				  <xsl:when test="contains($str,.)">	
						<xsl:value-of select="'-'" />
						<xsl:value-of select="substring($str,1, string-length(string($str))-$dec )" />
						<xsl:value-of select="'.'" />
						<xsl:value-of select="substring($str, string-length(string($str))-$dec +1, $dec -1 )" />	
						<xsl:value-of select="./@id" />
				  </xsl:when>
			</xsl:choose>	
		</xsl:for-each>	
		
		<xsl:variable name="varP">
			<var id="0">{</var >
			<var id="1">A</var >
			<var id="2">B</var >
			<var id="3">C</var >
			<var id="4">D</var >
			<var id="5">E</var >
			<var id="6">F</var >
			<var id="7">G</var >
			<var id="8">H</var >
			<var id="9">I</var >
		</xsl:variable>
		<xsl:for-each select="$varP/var" >
			<xsl:choose>		
				  <xsl:when test="contains($str,.)">	
						<xsl:value-of select="substring($str,1, string-length(string($str))-$dec )" />
						<xsl:value-of select="'.'" />
						<xsl:value-of select="substring($str, string-length(string($str))-$dec +1, $dec -1 )" />	
						<xsl:value-of select="./@id" />
				  </xsl:when>
			</xsl:choose>	
		</xsl:for-each>		
		
		<xsl:choose>		
			  <xsl:when test="not($varN/var = substring($str, string-length(string($str)), $dec)) and not($varP/var = substring($str, string-length(string($str)), $dec)) ">	
					<xsl:value-of select="substring($str,1, string-length(string($str))-$dec )" />
					<xsl:value-of select="'.'" />
					<xsl:value-of select="substring($str, string-length(string($str))-$dec +1, $dec )" />		
			  </xsl:when>
		</xsl:choose>	
	</xsl:template>

	<xsl:template name="string-replace-all-padleft">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:param name="len"/>
		<xsl:param name="dec"/>		
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:choose>
					<xsl:when test="string-length(string(substring-after($text,$replace))) &lt; $dec">
						<xsl:call-template name="string-replace-all-padleft">
							<xsl:with-param name="text" select="concat($text, '0')"/>
							<xsl:with-param name="replace" select="$replace"/>
							<xsl:with-param name="by" select="$by"/>
							<xsl:with-param name="len" select="$len"/>
							<xsl:with-param name="dec" select="$dec"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="pad-left">	
							<xsl:with-param name="str" select="concat(substring-before($text,$replace), $by, substring(substring-after($text,$replace),1,$dec) )" />
							<xsl:with-param name="len" select="$len" />
						</xsl:call-template>			  
					</xsl:otherwise>
				</xsl:choose>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:call-template name="pad-dec-zero">	
				<xsl:with-param name="str" select="$text" />
				<xsl:with-param name="len" select="$len" />
				<xsl:with-param name="dec" select="$dec" />
			</xsl:call-template>	
		  </xsl:otherwise>
		</xsl:choose>

	</xsl:template>
	
	<xsl:template name="pad-dec-zero">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:param name="dec"/>
		<xsl:choose>
			<xsl:when test="$dec &gt; 0">
				<xsl:call-template name="pad-dec-zero">
					<xsl:with-param name="str" select="concat($str, '0')"/>
					<xsl:with-param name="len" select="$len"/>
					<xsl:with-param name="dec" select="$dec - 1"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="pad-left">
					<xsl:with-param name="str" select="$str"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="bic-to-tzn">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:choose>
			<xsl:when test="$str = 'MBB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'MBBEMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'RHB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'RHBBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'SCB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'SCBLMYKX'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'BSN'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'BSNAMYK1'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'CIMB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'CIBBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'AFF'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'PHBMMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'ALB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'MFBBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'ABB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'ARBKMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'BIMB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'BIMBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'BMMB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'BMMBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'AGRO'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'AGOBMYKI'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'CITI'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'CITIMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'HLB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'HLBBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'HSBC'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'HBMBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'KFH'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'KFHOMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'OCBC'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'OCBCMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'PBB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'PBBEMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'UOB'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'UOVBMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$str = 'RAJH'">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'RJHIMYKL'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="$str"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- map date time from xml(PayNet) format to host iso format (yyyy-MM-dd-HH.mm.ss.SSSSSS)-->
	<xsl:template name="dateTime-to-host-iso">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="format-dateTime(xs:dateTime($str), '[Y0001]-[M01]-[D01]-[H01].[m01].[s01].[f000001]')"/>
			<xsl:with-param name="len" select="$len"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- map date time from host iso format to xml(PayNet) header(UTC) format(yyyy-MM-ddTHH:mm:ssZ)-->
	<xsl:template name="dateTime-to-xml-utc">
		<xsl:param name="str"/>
		<xsl:param name="date" select="substring($str, 1, 10)"/>
		<xsl:param name="time" select="translate(substring($str, 12, 8), '.', ':')"/>
		<xsl:param name="datetime" select="concat($date, 'T', $time, '+08:00')"/>
		<xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime($datetime), xs:dayTimeDuration('PT0H'))"/>
		<!--<xsl:value-of select="$date"/>
		<xsl:value-of select="'T'"/>
		<xsl:value-of select="$time"/>
		<xsl:value-of select="'Z'"/>-->
	</xsl:template>
	
	<!-- map date time from host iso format to xml(PayNet) body(local time) format(yyyy-MM-ddTHH:mm:ss.SSS)-->
	<xsl:template name="dateTime-to-xml-loc">
		<xsl:param name="str"/>
		<xsl:param name="date" select="substring($str, 1, 10)"/>
		<xsl:param name="time" select="concat(translate(substring($str, 12, 8), '.', ':'), substring($str, 20, 4))"/>
		<xsl:value-of select="$date"/>
		<xsl:value-of select="'T'"/>
		<xsl:value-of select="$time"/>
	</xsl:template>
	
	<!-- map PossibleDuplicate value from xml(boolean) to host(true - '1', false - ' ')-->
	<xsl:template name="pssbdplt-to-host">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:choose>
			<xsl:when test="$str = ''">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="''"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="xs:boolean($str)">
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="'1'"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="pad-right">
					<xsl:with-param name="str" select="''"/>
					<xsl:with-param name="len" select="$len"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="dateTime-to-xml-new">
		<xsl:param name="str"/>
		<xsl:param name="len"/>
		<xsl:param name="year" select="substring($str, 1, 4)"/>
		<xsl:param name="month" select="substring($str, 5, 2)"/>
		<xsl:param name="day" select="substring($str, 7, 2)"/>
		<xsl:param name="date" select="concat($year, '-', $month, '-', $day)"/>
		<xsl:call-template name="pad-right">
			<xsl:with-param name="str" select="$date"/>
			<xsl:with-param name="len" select="$len"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- map PossibleDuplicate value from host to xml)-->
	<xsl:template name="pssbdplt-to-xml">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="$str = '1'">
				<xsl:value-of select="'true'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'false'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

 </xsl:stylesheet>