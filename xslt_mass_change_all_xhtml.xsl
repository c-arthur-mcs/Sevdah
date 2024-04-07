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
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="li[@class='language']">
        <button>
            <xsl:apply-templates/>
        </button>
    </xsl:template>
    <xsl:template match="a[@class='language']">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="title">
        <title>
            <xsl:apply-templates/>
        </title>
        <script type="text/javascript" src="show-hide_en_bs-cy_bs-la.js"/>
    </xsl:template>
</xsl:stylesheet>