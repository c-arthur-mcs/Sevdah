<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:cam="sevdah-functions"
  xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="#all" version="3.0">
  <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
    indent="yes"/>
  <!-- ================================================================== -->
  <!-- Stylesheet variables                                               -->
  <!-- ================================================================== -->
  <xsl:variable name="bar-width" as="xs:double" select="100"/>
  <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 4"/>
  <xsl:variable name="all-docs" as="document-node()+"
    select="collection('../texts_xml/?select=*.xml')"/>
  <xsl:variable name="all-lang-instances" as="xs:string+" select="$all-docs//origin/@lang"/>
  <xsl:variable name="all-lang-names" as="xs:string+"
    select="$all-lang-instances => distinct-values() => sort()"/>
  <xsl:variable name="total-lang-instance-count" as="xs:integer" select="count($all-lang-instances)"/>
  <!-- ================================================================== -->
  <!-- Functions                                                          -->
  <!-- ================================================================== -->
  <xsl:function name="cam:initial-cap" as="xs:string">
    <xsl:param name="input" as="xs:string"/>
    <xsl:value-of select="substring($input, 1, 1) ! upper-case(.) || substring($input, 2)"/>
  </xsl:function>
  <!-- ================================================================== -->
  <!-- Templates                                                          -->
  <!-- ================================================================== -->
  <xsl:template name="xsl:initial-template" match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Sevdah - Textual Analysis</title>
        <link rel="stylesheet" type="text/css" href="index-style.css"/>
      </head>
      <body>
        <nav class="navigation">
          <h1 class="website_title">SEVDAH</h1>
          <ul class="navig">
            <li class="nav_button">
              <a href="index.html" class="nav_link">About the Project</a>
            </li>
            <li class="nav_button">
              <a href="methodology.xhtml" class="nav_link">Methodology</a>
            </li>
            <li class="nav_button">
              <a href="text_directory.xhtml" class="nav_link">Text Directory</a>
            </li>
            <li class="nav_button">
              <a href="textual_analysis.xhtml" class="nav_link">Textual Analysis</a>
            </li>
            <li class="nav_button">
              <a href="contributors.xhtml" class="nav_link">Contributors</a>
            </li>
            <li class="nav_button">
              <a href="bibliography.xhtml" class="nav_link">Bibliography</a>
            </li>
          </ul>
          <div class="languages">
            <ul class="languages">
              <li class="languages">
                <a class="languages" href="">English</a>
              </li>
              <li class="languages">
                <a class="languages" href="">Bos-Lat</a>
              </li>
              <li class="languages">
                <a class="languages" href="">Bos-Cyr</a>
              </li>
            </ul>
          </div>
        </nav>
        <h1 class="main_title">Textual Analysis</h1>
        <hr/>
        <h1>Aggregated Counts</h1>
        <table>
          <tr>
            <th>Language</th>
            <th>Count</th>
            <th>Percentage</th>
          </tr>
          <xsl:for-each select="$all-lang-names">
            <xsl:variable name="lang-instance-count" as="xs:integer"
              select="count($all-lang-instances[. eq current()])"/>
            <tr>
              <th>
                <xsl:value-of select="cam:initial-cap(.)"/>
              </th>
              <td>
                <xsl:value-of select="$lang-instance-count"/>
              </td>
              <td>
                <xsl:value-of
                  select="(100 * $lang-instance-count div $total-lang-instance-count) => round(2)"/> <xsl:text>%</xsl:text>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <h1>Aggregated Charts</h1>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="$all-docs">
    <xsl:variable name="total-words" as="xs:integer"
      select='count(//origin[not(@lang = "n/a")])'/>
    
    <xsl:variable name="n-turkic" as="xs:integer" select='count(//origin[@lang = "turkic"])'/>
    <xsl:variable name="pc-turkic" as="xs:double" select="$n-turkic div $total-words"/>
    
    <xsl:variable name="n-slavic" as="xs:integer" select='count(//origin[@lang = "slavic"])'/>
    <xsl:variable name="pc-slavic" as="xs:double" select="$n-slavic div $total-words"/>
    
    <xsl:variable name="n-latin" as="xs:integer" select='count(//origin[@lang = "latin"])'/>
    <xsl:variable name="pc-latin" as="xs:double" select="$n-latin div $total-words"/>
    
    <xsl:variable name="n-greek" as="xs:integer" select='count(//origin[@lang = "greek"])'/>
    <xsl:variable name="pc-greek" as="xs:double" select="$n-greek div $total-words"/>
    
    <xsl:variable name="n-hungarian" as="xs:integer"
      select='count(//origin[@lang = "hungarian"])'/>
    <xsl:variable name="pc-hungarian" as="xs:double" select="$n-hungarian div $total-words"/>
    
    <xsl:variable name="n-germanic" as="xs:integer" select='count(//origin[@lang = "germanic"])'/>
    <xsl:variable name="pc-germanic" as="xs:double" select="$n-germanic div $total-words"/>
    
    <xsl:variable name="n-italian" as="xs:integer" select='count(//origin[@lang = "italian"])'/>
    <xsl:variable name="pc-italian" as="xs:double" select="$n-italian div $total-words"/>
    
    <svg xmlns="http://www.w3.org/2000/svg" height="500" width="1000">
      
      <!-- BACKGROUND ITEMS -->
      <rect height="500" width="1000" fill="#0174BE" stroke="white"/>
      <line x1="50" y1="450" x2="1000" y2="450" stroke="white"/>
      <line x1="50" y1="350" x2="1000" y2="350" stroke="#0C356A"/>
      <line x1="50" y1="250" x2="1000" y2="250" stroke="#0C356A"/>
      <line x1="50" y1="150" x2="1000" y2="150" stroke="#0C356A"/>
      <line x1="50" y1="50" x2="1000" y2="50" stroke="#0C356A"/>
      <line x1="50" y1="450" x2="50" y2="0" stroke="white"/>
      <text x="25" y="250" fill="white">
        <xsl:text>%</xsl:text>
      </text>
      <text x="50" y="475" fill="white">
        <xsl:text>Language of Origin  - Total words: </xsl:text>
        <xsl:value-of select="$total-words"/>
      </text>
      <!-- LANGUAGE SPECIFIC -->
      <!-- TURKIC -->
      <rect fill="#FFC436" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)}"
        width="{$bar-width}" height="{4*($pc-turkic*100)}"/>
      <text fill="white" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)-10}">
        <xsl:text>Turkic </xsl:text>
        <xsl:value-of select="round($pc-turkic * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
      
      <!-- SLAVIC -->
      <rect fill="#FFC436" x="{50+$bar-spacing+($bar-width+$bar-spacing)}"
        y="{450-(4*($pc-slavic*100))}" width="{$bar-width}" height="{4*($pc-slavic*100)}"/>
      <text fill="white" x="{50+$bar-spacing+($bar-width+$bar-spacing)}"
        y="{450-(4*($pc-slavic*100))-10}">
        <xsl:text>Slavic </xsl:text>
        <xsl:value-of select="round($pc-slavic * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
      
      <!-- LATIN -->
      <rect fill="#FFC436" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-latin*100))}" width="{$bar-width}" height="{4*($pc-latin*100)}"/>
      <text fill="white" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-latin*100))-10}">
        <xsl:text>Latin </xsl:text>
        <xsl:value-of select="round($pc-latin * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
      
      <!-- GREEK -->
      <rect fill="#FFC436" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-greek*100))}" width="{$bar-width}" height="{4*($pc-greek*100)}"/>
      <text fill="white" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-greek*100))-10}">
        <xsl:text>Greek </xsl:text>
        <xsl:value-of select="round($pc-greek * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
      
      <!-- HUNGARIAN -->
      <rect fill="#FFC436" x="{50+$bar-spacing+(4*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-hungarian*100))}" width="{$bar-width}"
        height="{4*($pc-hungarian*100)}"/>
      <text fill="white" x="{50+$bar-spacing+(4*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-hungarian*100))-10}">
        <xsl:text>Hungarian </xsl:text>
        <xsl:value-of select="round($pc-hungarian * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
      
      <!-- GERMANIC -->
      <rect fill="#FFC436" x="{50+$bar-spacing+(5*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-germanic*100))}" width="{$bar-width}"
        height="{4*($pc-germanic*100)}"/>
      <text fill="white" x="{50+$bar-spacing+(5*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-germanic*100))-10}">
        <xsl:text>Germanic </xsl:text>
        <xsl:value-of select="round($pc-germanic * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
      
      <!-- ITALIAN -->
      <rect fill="#FFC436" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-italian*100))}" width="{$bar-width}" height="{4*($pc-italian*100)}"/>
      <text fill="white" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}"
        y="{450-(4*($pc-italian*100))-10}">
        <xsl:text>Italian </xsl:text>
        <xsl:value-of select="round($pc-italian * 100, 1)"/>
        <xsl:text>%</xsl:text>
      </text>
    </svg>
  </xsl:template>

</xsl:stylesheet>
