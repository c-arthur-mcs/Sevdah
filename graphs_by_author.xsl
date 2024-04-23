<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:cam="sevdah-functions"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>

    <!-- GLOBAL VARIABLES -->
    <xsl:variable name="bar-width" as="xs:double" select="100"/>
    <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 4"/>
    <xsl:variable name="all-docs" as="document-node()+"
        select="collection('texts_xml/?select=*.xml')"/>
    <xsl:variable name="all-lang-instances" as="xs:string+" select="$all-docs//origin/@lang"/>
    <xsl:variable name="all-lang-names" as="xs:string+"
        select="$all-lang-instances => distinct-values() => sort()"/>
    <xsl:variable name="total-lang-instance-count" as="xs:integer"
        select="count($all-lang-instances)"/>
    <xsl:variable name="all-author" as="xs:string+"
        select="$all-docs//author/@lat => distinct-values() => sort()"/>
    <xsl:variable name="author-map" as="map(*)">
        <xsl:map>
            <xsl:map-entry key="'Silvana Armenulić'" select="'..sa...'"/>
            <xsl:map-entry key="'Musa Ćazim Ćatić'" select="'mc.....'"/>
            <xsl:map-entry key="'Osman Đikić'" select="'od.....'"/>
            <xsl:map-entry key="'Mustafa Mujezinović'" select="'mm.....'"/>
            <xsl:map-entry key="'Himzo Polovina'" select="'..hp...'"/>
            <xsl:map-entry key="'Aleksa Šantič'" select="'as.....'"/>
            <xsl:map-entry key="'Safet-beg Bašagić'" select="'sb.....'"/>
        </xsl:map>
    </xsl:variable>
    <xsl:variable name="regex-author" as="xs:string" select="$all-author ! map:get($author-map, .)"/>

    <!-- FUNCTIONS -->
    <xsl:function name="cam:initial-cap" as="xs:string">
        <xsl:param name="input" as="xs:string"/>
        <xsl:value-of select="substring($input, 1, 1) ! upper-case(.) || substring($input, 2)"/>
    </xsl:function>
    <xsl:function name="cam:cyr-to-lat">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="apply-lj" as="xs:string" select="$input => replace('љ', 'lj')"/>
        <xsl:variable name="apply-nj" as="xs:string" select="$apply-lj => replace('њ', 'nj')"/>
        <xsl:variable name="apply-dzh" as="xs:string" select="$apply-nj => replace('џ', 'dž')"/>
        <xsl:variable name="apply-cap-lj" as="xs:string" select="$apply-dzh => replace('Љ', 'Lj')"/>
        <xsl:variable name="apply-cap-nj" as="xs:string"
            select="$apply-cap-lj => replace('Њ', 'Nj')"/>
        <xsl:variable name="apply-cap-dzh" as="xs:string"
            select="$apply-cap-nj => replace('Џ', 'Dž')"/>
        <xsl:variable name="one-to-one" as="xs:string"
            select="$apply-cap-dzh => translate('абвгдђежзијклмнопрстћуфхцчшАБВГДЂЕЖЗИЈКЛМНОПРСТЋУФЦЧШ', 'abvgdđežzijklmnoprstćufhcčšABVGDĐEŽZIJKLMNOPRSTĆUFCČŠ')"/>
        <xsl:value-of select="$one-to-one"/>
    </xsl:function>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Sevdah - Textual Analysis</title>
                <link rel="stylesheet" type="text/css" href="index-style.css"/>
                <script type="text/javascript" src="show-hide_en_bs-cy_bs-la.js"/>
            </head>
            <body>
                <nav class="navigation">
                    <h1 class="website_title">SEVDAH</h1>
                    <ul class="navig">
                        <li class="nav_button">
                            <a href="index.html" class="nav_link en" style="display:block">About the
                                Project</a>
                            <a href="index.html" class="nav_link bs-cy" style="display:none">О овом
                                пројекту</a>
                            <a href="index.html" class="nav_link bs-la" style="display:none">O ovom
                                projetku</a>
                        </li>
                        <li class="nav_button">
                            <a href="methodology.xhtml" class="nav_link en" style="display:block"
                                >Methodology</a>
                            <a href="methodology.xhtml" class="nav_link bs-cy" style="display:none"
                                >Начин истраживања</a>
                            <a href="methodology.xhtml" class="nav_link bs-la" style="display:none"
                                >Način istraživanja</a>
                        </li>
                        <li class="nav_button">
                            <a href="text_directory.xhtml" class="nav_link en" style="display:block"
                                >Text Directory</a>
                            <a href="text_directory.xhtml" class="nav_link bs-cy"
                                style="display:none">Директориј текстова</a>
                            <a href="text_directory.xhtml" class="nav_link bs-la"
                                style="display:none">Direktorij tekstova</a>
                        </li>
                        <li class="nav_button">
                            <a href="textual_analysis.xhtml" class="nav_link en"
                                style="display:block">Textual Analysis</a>
                            <a href="textual_analysis.xhtml" class="nav_link bs-cy"
                                style="display:none">Анализа текстова</a>
                            <a href="textual_analysis.xhtml" class="nav_link bs-la"
                                style="display:none">Analiza tekstova</a>
                        </li>
                        <li class="nav_button">
                            <a href="contributors.xhtml" class="nav_link en" style="display:block"
                                >Contributors</a>
                            <a href="contributors.xhtml" class="nav_link bs-cy" style="display:none"
                                >Сурадници</a>
                            <a href="contributors.xhtml" class="nav_link bs-la" style="display:none"
                                >Suradnici</a>
                        </li>
                        <li class="nav_button">
                            <a href="bibliography.xhtml" class="nav_link en" style="display:block"
                                >Bibliography</a>
                            <a href="bibliography.xhtml" class="nav_link bs-cy" style="display:none"
                                >Библиографија</a>
                            <a href="bibliography.xhtml" class="nav_link bs-la" style="display:none"
                                >Bibliografija</a>
                        </li>
                    </ul>
                    <div class="languages">
                        <button class="languages">
                            <span onclick="English()">English</span>
                        </button>
                        <button class="languages">
                            <span onclick="Bosnian_Cyrillic()">Бос-Ћир</span>
                        </button>
                        <button class="languages">
                            <span onclick="Bosnian_Latin()">Bos-Lat</span>
                        </button>
                    </div>
                </nav>
                <h1 class="main_title en" style="display:block">Textual Analysis</h1>
                <h1 class="main_title bs-cy" style="display:none">Анализа текстова</h1>
                <h1 class="main_title bs-la" style="display:none">Analiza tekstova</h1>
                <hr/>
                <div class="info">
                    <xsl:for-each select="$all-author">
                        <button class="author-buttons">
                            <span class="en" style="display:block">
                                <xsl:value-of select="."/>
                            </span>
                            <span class="bs-cy" style="display:none">
                                <xsl:value-of select="."/>
                            </span>
                            <span class="bs-la" style="display:none">
                                <xsl:value-of select="."/>
                            </span>
                        </button>
                    </xsl:for-each>
                </div>
                <xsl:for-each select="$all-author">
                    <div class="{.}">
                        <xsl:apply-templates mode="graph" select="$all-docs/poem[@uid ! matches(//poem, $regex-author)]"/>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template mode="graph" match="$all-docs/poem[@uid ! matches(//poem, $regex-author)]">
        <xsl:variable name="poem-gross-word" as="xs:integer" select="count(.//origin)"/>
        <xsl:variable name="poem-gross-slav" as="xs:integer" select="count(.//origin[@lang = 'slavic'])"/>
        <xsl:variable name="poem-gross-turk" as="xs:integer" select="count(.//origin[@lang = 'turkic'])"/>
        <xsl:variable name="poem-gross-latin" as="xs:integer" select="count(.//origin[@lang = 'latin'])"/>
        <xsl:variable name="poem-gross-greek" as="xs:integer" select="count(.//origin[@lang = 'greek'])"/>
        <xsl:variable name="poem-gross-hungarian" as="xs:integer"
            select="count(.//origin[@lang = 'hungarian'])"/>
        <xsl:variable name="poem-gross-germanic" as="xs:integer"
            select="count(.//origin[@lang = 'germanic'])"/>
        <xsl:variable name="poem-gross-italian" as="xs:integer"
            select="count(.//origin[@lang = 'italian'])"/>
        <xsl:variable name="poem-gross-other" as="xs:integer"
            select="$poem-gross-latin + $poem-gross-greek + $poem-gross-hungarian + $poem-gross-germanic + $poem-gross-italian"/>
        <table>
            <tr><xsl:text>TURKIC= </xsl:text> 
                <xsl:value-of select="$poem-gross-turk div $poem-gross-word"/>
                <xsl:value-of select="//author/@lat"/>
                <xsl:apply-templates select="//title_bs"/>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
