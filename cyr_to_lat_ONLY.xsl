<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:cam="sevdah-functions"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" 
        html-version="5" 
        omit-xml-declaration="no" 
        include-content-type="no"
        indent="yes"/>
    
    <xsl:function name="cam:cyr-to-lat">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="apply-lj" as="xs:string" select="$input => replace('љ','lj')"/>
        <xsl:variable name="apply-nj" as="xs:string" select="$apply-lj => replace('њ','nj')"/>
        <xsl:variable name="apply-dzh" as="xs:string" select="$apply-nj => replace('џ','dž')"/>
        <xsl:variable name="apply-cap-lj" as="xs:string" select="$apply-dzh => replace('Љ','Lj')"/>
        <xsl:variable name="apply-cap-nj" as="xs:string" select="$apply-cap-lj => replace('Њ','Nj')"/>
        <xsl:variable name="apply-cap-dzh" as="xs:string" select="$apply-cap-nj => replace('Џ','Dž')"/>
        <xsl:variable name="one-to-one" as="xs:string" select="$apply-cap-dzh => translate('абвгдђежзијклмнопрстћуфхцчшАБВГДЂЕЖЗИЈКЛМНОПРСТЋУФЦЧШ','abvgdđežzijklmnoprstćufhcčšABVGDĐEŽZIJKLMNOPRSTĆUFCČŠ')"/>
        <xsl:value-of select="$one-to-one"/>
    </xsl:function>
    
    <xsl:template match="/">
        <text>
            <xsl:apply-templates/>
        </text>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates select="cam:cyr-to-lat(.)"/>
        </p>
    </xsl:template>
</xsl:stylesheet>