<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:cam="sevdah-functions"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" 
        html-version="5" 
        omit-xml-declaration="no" 
        include-content-type="no"
        indent="yes"/>

<!-- GLOBAL VARIABLES -->
    <xsl:variable name="bar-width" as="xs:double" select="100"/>
    <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 4"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Sevdah - Textual Analysis</title>
                <link rel="stylesheet" type="text/css" href="index-style.css" />
            </head>
            <body>
                <nav class="navigation">
                    <h1 class="website_title">SEVDAH</h1>
                    <ul class="navig">
                        <li class="nav_button"><a href="index.html" class="nav_link">About the
                            Project</a></li>
                        <li class="nav_button"><a href="methodology.xhtml" class="nav_link">Methodology</a></li>
                        <li class="nav_button"><a href="text_directory.xhtml" class="nav_link">Text
                            Directory</a></li>
                        <li class="nav_button"><a href="textual_analysis.xhtml" class="nav_link">Textual Analysis</a></li>
                        <li class="nav_button"><a href="contributors.xhtml" class="nav_link"
                            >Contributors</a></li>
                        <li class="nav_button"><a href="bibliography.xhtml" class="nav_link"
                            >Bibliography</a></li>
                    </ul>
                    <div class="languages">
                        <ul class="languages">
                            <li class="languages"><a class="languages" href="">English</a></li>
                            <li class="languages"><a class="languages" href="">Bos-Lat</a></li>
                            <li class="languages"><a class="languages" href="">Bos-Cyr</a></li>
                        </ul>
                    </div>
                </nav>
                <h1 class="main_title">Textual Analysis</h1>
                <hr />
                <section>
                    <h2>Percentages of Word Origins</h2>
                    <xsl:apply-templates mode="title"/>
                    <xsl:apply-templates/>
                </section>
            </body>
        </html>
    </xsl:template>
    
    
<!-- MODE:TITLE -->
    <xsl:template match="title" mode="title">
        <h3>
            <xsl:apply-templates select="title_bs" mode="title"/> 
            <xsl:text>-</xsl:text>
            <xsl:apply-templates select="title_en" mode="title"/> 
        </h3>
    </xsl:template>
    
    <xsl:template match="meta" mode="title"></xsl:template>
    
    <xsl:template match="body" mode="title"></xsl:template>
    
<!-- MODE:NONE-->
    <xsl:template match="meta"></xsl:template>
    
    <xsl:template match="body">
        <xsl:variable name="total-words" as="xs:integer" select='count(//origin[not(@lang="n/a")])'/>
        
        <xsl:variable name="n-turkic" as="xs:integer" select='count(//origin[@lang="turkic"])'/>
        <xsl:variable name="pc-turkic" as="xs:double" select='$n-turkic div $total-words'/>
        
        <xsl:variable name="n-slavic" as="xs:integer" select='count(//origin[@lang="slavic"])'/>
        <xsl:variable name="pc-slavic" as="xs:double" select='$n-slavic div $total-words'/>
        
        <xsl:variable name="n-latin" as="xs:integer" select='count(//origin[@lang="latin"])'/>
        <xsl:variable name="pc-latin" as="xs:double" select='$n-latin div $total-words'/>
        
        <xsl:variable name="n-greek" as="xs:integer" select='count(//origin[@lang="greek"])'/>
        <xsl:variable name="pc-greek" as="xs:double" select='$n-greek div $total-words'/>
        
        <xsl:variable name="n-hungarian" as="xs:integer" select='count(//origin[@lang="hungarian"])'/>
        <xsl:variable name="pc-hungarian" as="xs:double" select='$n-hungarian div $total-words'/>
        
        <xsl:variable name="n-germanic" as="xs:integer" select='count(//origin[@lang="germanic"])'/>
        <xsl:variable name="pc-germanic" as="xs:double" select='$n-germanic div $total-words'/>
        
        <xsl:variable name="n-italian" as="xs:integer" select='count(//origin[@lang="italian"])'/>
        <xsl:variable name="pc-italian" as="xs:double" select='$n-italian div $total-words'/>
        
        <svg xmlns="http://www.w3.org/2000/svg" height="500" width="1000">
        <!-- BACKGROUND ITEMS -->
            <rect height="500" width="1000" fill="gray" stroke="white"/>
            <line x1="50" y1="450" x2="1000" y2="450" stroke="white"/>
            <line x1="50" y1="{450}" x2="50" y2="0" stroke="white"/>
            <text x="25" y="250" fill="white">
                %
            </text>
            <text x="50" y="475" fill="white">
                Language of Origin
            </text>
        <!-- LANGUAGE SPECIFIC -->
            <!-- TURKIC -->
            <rect fill="lightblue" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)}" width="{$bar-width}" height="{4*($pc-turkic*100)}"/>
            <text fill="white" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)-10}">
                <xsl:text>Turkic </xsl:text>
                <xsl:value-of select="round($pc-turkic * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
            
            <!-- SLAVIC -->
            <rect fill="lightblue" x="{50+$bar-spacing+($bar-width+$bar-spacing)}" y="{450-(4*($pc-slavic*100))}" width="{$bar-width}" height="{4*($pc-slavic*100)}"/>
            <text fill="white" x="{50+$bar-spacing+($bar-width+$bar-spacing)}" y="{450-(4*($pc-slavic*100))-10}">
                <xsl:text>Slavic </xsl:text>
                <xsl:value-of select="round($pc-slavic * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
            
            <!-- LATIN -->
            <rect fill="lightblue" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}" y="{450-(4*($pc-latin*100))}" width="{$bar-width}" height="{4*($pc-latin*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}" y="{450-(4*($pc-latin*100))-10}">
                <xsl:text>Latin </xsl:text>
                <xsl:value-of select="round($pc-latin * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
            
            <!-- GREEK -->
            <rect fill="lightblue" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}" y="{450-(4*($pc-greek*100))}" width="{$bar-width}" height="{4*($pc-greek*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}" y="{450-(4*($pc-greek*100))-10}">
                <xsl:text>Greek </xsl:text>
                <xsl:value-of select="round($pc-greek * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
            
            <!-- HUNGARIAN -->
            <rect fill="lightblue" x="{50+$bar-spacing+(4*($bar-width+$bar-spacing))}" y="{450-(4*($pc-hungarian*100))}" width="{$bar-width}" height="{4*($pc-hungarian*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(4*($bar-width+$bar-spacing))}" y="{450-(4*($pc-hungarian*100))-10}">
                <xsl:text>Hungarian </xsl:text>
                <xsl:value-of select="round($pc-hungarian * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
            
            <!-- GERMANIC -->
            <rect fill="lightblue" x="{50+$bar-spacing+(5*($bar-width+$bar-spacing))}" y="{450-(4*($pc-germanic*100))}" width="{$bar-width}" height="{4*($pc-germanic*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(5*($bar-width+$bar-spacing))}" y="{450-(4*($pc-germanic*100))-10}">
                <xsl:text>Germanic </xsl:text>
                <xsl:value-of select="round($pc-germanic * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
            
            <!-- ITALIAN -->
            <rect fill="lightblue" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}" y="{450-(4*($pc-italian*100))}" width="{$bar-width}" height="{4*($pc-italian*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}" y="{450-(4*($pc-italian*100))-10}">
                <xsl:text>Italian </xsl:text>
                <xsl:value-of select="round($pc-italian * 100,1)"/>
                <xsl:text>%</xsl:text>
            </text>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>