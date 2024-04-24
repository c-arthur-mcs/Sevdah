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
    <xsl:function name="cam:initial-cap" as="xs:string">
        <xsl:param name="input" as="xs:string"/>
        <xsl:value-of select="substring($input, 1, 1) ! upper-case(.) || substring($input, 2)"/>
    </xsl:function>
    <xsl:function name="cam:rounded-percentage" as="xs:string">
        <xsl:param name="item-count" as="xs:integer"/>
        <xsl:param name="total-count" as="xs:integer"/>
        <xsl:sequence select="format-number(100 * $item-count div $total-count, '0.00')"/>
    </xsl:function>
    <xsl:function name="cam:surname-first" as="xs:string">
        <xsl:param name="full-name" as="xs:string"/>
        <xsl:variable name="name-parts" as="xs:string+" select="tokenize($full-name)"/>
        <xsl:sequence
            select="concat($name-parts[last()], ', ', string-join($name-parts[position() ne last()], ' '))"
        />
    </xsl:function>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Sevdah - Textual Analysis</title>
                <link rel="stylesheet" type="text/css" href="index-style.css"/>
                <script type="text/javascript" src="show-hide_en_bs-cy_bs-la.js"/>
                <script type="text/javascript" src="graphs_by_author_buttons.js"/>
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
                        <button class="author-buttons" onclick="{. ! translate(.,' ', '_')}()">
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
                <xsl:for-each-group select="$all-docs/*"
                    group-by="descendant::author ! cam:surname-first(.)">
                    <xsl:variable name="total-words" as="xs:integer"
                        select='count(//origin[not(@lang = "n/a")])'/>

                    <xsl:variable name="n-turkic" as="xs:integer"
                        select='count(//origin[@lang = "turkic"])'/>
                    <xsl:variable name="pc-turkic" as="xs:double"
                        select="$n-turkic div $total-words"/>

                    <xsl:variable name="n-slavic" as="xs:integer"
                        select='count(//origin[@lang = "slavic"])'/>
                    <xsl:variable name="pc-slavic" as="xs:double"
                        select="$n-slavic div $total-words"/>

                    <xsl:variable name="n-latin" as="xs:integer"
                        select='count(//origin[@lang = "latin"])'/>
                    <xsl:variable name="pc-latin" as="xs:double" select="$n-latin div $total-words"/>

                    <xsl:variable name="n-greek" as="xs:integer"
                        select='count(//origin[@lang = "greek"])'/>
                    <xsl:variable name="pc-greek" as="xs:double" select="$n-greek div $total-words"/>

                    <xsl:variable name="n-hungarian" as="xs:integer"
                        select='count(//origin[@lang = "hungarian"])'/>
                    <xsl:variable name="pc-hungarian" as="xs:double"
                        select="$n-hungarian div $total-words"/>

                    <xsl:variable name="n-germanic" as="xs:integer"
                        select='count(//origin[@lang = "germanic"])'/>
                    <xsl:variable name="pc-germanic" as="xs:double"
                        select="$n-germanic div $total-words"/>

                    <xsl:variable name="n-italian" as="xs:integer"
                        select='count(//origin[@lang = "italian"])'/>
                    <xsl:variable name="pc-italian" as="xs:double"
                        select="$n-italian div $total-words"/>

                    <div class="info">
                        <h2>
                            <xsl:value-of select="descendant::author"/>
                        </h2>
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
                                <xsl:text>Language of Origin</xsl:text>
                                <xsl:value-of select="descendant::author"/>
                                <xsl:text>  - Total words: </xsl:text>
                                <xsl:value-of select="$total-words"/>
                            </text>
                            <!-- LANGUAGE SPECIFIC -->
                            <!-- TURKIC -->
                            <rect fill="#FFC436" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)}"
                                width="{$bar-width}" height="{4*($pc-turkic*100)}"/>
                            <text fill="white" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)-10}"
                                transform="rotate(270 {50+$bar-spacing - 1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Turkic / Turski / Турски </xsl:text>
                                <xsl:value-of select="round($pc-turkic * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>

                            <!-- SLAVIC -->
                            <rect fill="#FFC436" x="{50+$bar-spacing+($bar-width+$bar-spacing)}"
                                y="{450-(4*($pc-slavic*100))}" width="{$bar-width}"
                                height="{4*($pc-slavic*100)}"/>
                            <text fill="white" x="{50+$bar-spacing+($bar-width+$bar-spacing)}"
                                y="{450-(4*$pc-turkic*100)-10}"
                                transform="rotate(270 {50+$bar-spacing+($bar-width+$bar-spacing)-1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Slavic / Slavenski / Славенски </xsl:text>
                                <xsl:value-of select="round($pc-slavic * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>

                            <!-- LATIN -->
                            <rect fill="#FFC436" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-latin*100))}" width="{$bar-width}"
                                height="{4*($pc-latin*100)}"/>
                            <text fill="white" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-latin*100))-10}"
                                transform="rotate(270 {50+$bar-spacing+(2*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Latin / Latinski / Латински </xsl:text>
                                <xsl:value-of select="round($pc-latin * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>

                            <!-- GREEK -->
                            <rect fill="#FFC436" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-greek*100))}" width="{$bar-width}"
                                height="{4*($pc-greek*100)}"/>
                            <text fill="white" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-greek*100))-10}"
                                transform="rotate(270 {50+$bar-spacing+(3*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Greek / Grčki / Грчки </xsl:text>
                                <xsl:value-of select="round($pc-greek * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>

                            <!-- HUNGARIAN -->
                            <rect fill="#FFC436" x="{50+$bar-spacing+(4*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-hungarian*100))}" width="{$bar-width}"
                                height="{4*($pc-hungarian*100)}"/>
                            <text fill="white" x="{50+$bar-spacing+(4*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-hungarian*100))-10}"
                                transform="rotate(270 {50+$bar-spacing+(4*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Hungarian / Mađarski / Мађарски </xsl:text>
                                <xsl:value-of select="round($pc-hungarian * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>

                            <!-- GERMANIC -->
                            <rect fill="#FFC436" x="{50+$bar-spacing+(5*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-germanic*100))}" width="{$bar-width}"
                                height="{4*($pc-germanic*100)}"/>
                            <text fill="white" x="{50+$bar-spacing+(5*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-germanic*100))-10}"
                                transform="rotate(270 {50+$bar-spacing+(5*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Germanic / Njemački / Њемачки </xsl:text>
                                <xsl:value-of select="round($pc-germanic * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>

                            <!-- ITALIAN -->
                            <rect fill="#FFC436" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-italian*100))}" width="{$bar-width}"
                                height="{4*($pc-italian*100)}"/>
                            <text fill="white" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}"
                                y="{450-(4*($pc-italian*100))-10}"
                                transform="rotate(270 {50+$bar-spacing+(6*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                                <xsl:text>Italian / Talijanski / Талијански </xsl:text>
                                <xsl:value-of select="round($pc-italian * 100, 1)"/>
                                <xsl:text>%</xsl:text>
                            </text>
                        </svg>
                    </div>
                </xsl:for-each-group>
                <!--<xsl:for-each select="$all-author">
                    <div class="{.}">
                        <xsl:apply-templates mode="graph" select="$all-docs/poem[@uid ! matches(//poem, $regex-author)]"/>
                    </div>
                </xsl:for-each>-->
            </body>
        </html>
    </xsl:template>

    <!--<xsl:template mode="graph" match="$all-docs/poem[@uid ! matches(//poem, $regex-author)]">
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
    </xsl:template>-->

</xsl:stylesheet>
