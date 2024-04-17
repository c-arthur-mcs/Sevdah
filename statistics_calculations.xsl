<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:cam="sevdah-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>

    <!-- GLOBAL VARIABLES -->
    <xsl:variable name="bar-width" as="xs:double" select="100"/>
    <xsl:variable name="bar-spacing" as="xs:double" select="$bar-width div 4"/>

    <!-- FUNCTION -->
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

    <!-- TEMPLATES -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Sevdah - Textual Analysis</title>
                <link rel="stylesheet" type="text/css" href="../index-style.css"/>
                <script type="text/javascript" src="../show-hide_en_bs-cy_bs-la.js"/>
            </head>
            <body>
                <nav class="navigation">
                    <h1 class="website_title">SEVDAH</h1>
                    <ul class="navig">
                        <li class="nav_button">
                            <a href="../index.html" class="nav_link en" style="display:block">About the Project</a>
                            <a href="../index.html" class="nav_link bs-cy" style="display:none">О овом пројекту</a>
                            <a href="../index.html" class="nav_link bs-la" style="display:none">O ovom projetku</a>
                        </li>
                        <li class="nav_button">
                            <a href="../methodology.xhtml" class="nav_link en" style="display:block">Methodology</a>
                            <a href="../methodology.xhtml" class="nav_link bs-cy" style="display:none">Начин истраживања</a>
                            <a href="../methodology.xhtml" class="nav_link bs-la" style="display:none">Način istraživanja</a>
                        </li>
                        <li class="nav_button">
                            <a href="../text_directory.xhtml" class="nav_link en" style="display:block">Text Directory</a>
                            <a href="../text_directory.xhtml" class="nav_link bs-cy" style="display:none">Директориј текстова</a>
                            <a href="../text_directory.xhtml" class="nav_link bs-la" style="display:none">Direktorij tekstova</a>
                        </li>
                        <li class="nav_button">
                            <a href="../textual_analysis.xhtml" class="nav_link en" style="display:block">Textual Analysis</a>
                            <a href="../textual_analysis.xhtml" class="nav_link bs-cy" style="display:none">Анализа текстова</a>
                            <a href="../textual_analysis.xhtml" class="nav_link bs-la" style="display:none">Analiza tekstova</a>
                        </li>
                        <li class="nav_button">
                            <a href="../contributors.xhtml" class="nav_link en" style="display:block">Contributors</a>
                            <a href="../contributors.xhtml" class="nav_link bs-cy" style="display:none">Сурадници</a>
                            <a href="../contributors.xhtml" class="nav_link bs-la" style="display:none">Suradnici</a>
                        </li>
                        <li class="nav_button">
                            <a href="../bibliography.xhtml" class="nav_link en" style="display:block">Bibliography</a>
                            <a href="../bibliography.xhtml" class="nav_link bs-cy" style="display:none">Библиографија</a>
                            <a href="../bibliography.xhtml" class="nav_link bs-la" style="display:none">Bibliografija</a>
                        </li>
                    </ul>
                    <div class="languages">
                        <button class="languages"><span onclick="English()">English</span></button>
                        <button class="languages"><span onclick="Bosnian_Cyrillic()">Бос-Ћир</span></button>
                        <button class="languages"><span onclick="Bosnian_Latin()">Bos-Lat</span></button>
                    </div>
                </nav>
                <h1 class="main_title en" style="display:block">Textual Analysis</h1>
                <h1 class="main_title bs-cy" style="display:none">Анализа текстова</h1>
                <h1 class="main_title bs-la" style="display:none">Analiza tekstova</h1>
                <hr/>
                <section>
                    <h2 class="en" style="display:block">Percentages of Word Origins</h2>
                    <h2 class="bs-cy" style="display:none">Проценат почетака слова</h2>
                    <h2 class="bs-la" style="display:none">Procenat početaka slova</h2>
                    <div class="info">
                        <xsl:apply-templates mode="heading"/>
                        <br/>
                        <xsl:apply-templates mode="graph"/>
                    </div>
                    <h2 class="en" style="display:block">Total Number of Word Origins</h2>
                    <h2 class="bs-cy" style="display:none">Тотални број почетака слова</h2>
                    <h2 class="bs-la" style="display:none">Totalni broj početaka slova</h2>
                    <div class="info">
                        <xsl:apply-templates mode="chart"/>
                    </div>
                </section>
            </body>
        </html>
    </xsl:template>


    <!-- MODE:TITLE -->
    <xsl:template match="title" mode="heading">
        <h3>
            <xsl:apply-templates mode="heading" select="title_bs"/>
            <xsl:text> - </xsl:text>
            <xsl:apply-templates mode="heading" select="title_en"/>
            <xsl:text> - </xsl:text>
            <xsl:apply-templates mode="heading" select="cam:cyr-to-lat(title_en)"/>
        </h3>
    </xsl:template>
    <xsl:template match="author" mode="heading">
        <p class="en" style="display:block">
            <xsl:value-of select="@type ! translate(., 'p', 'P')"/>
            <xsl:text>: </xsl:text>
            <xsl:apply-templates mode="heading"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@lat"/>
            <xsl:text>)</xsl:text>
        </p>
        <p class="bs-cy" style="display:none">
            <xsl:value-of select="@type ! replace(., 'performer', 'Пјевац') ! replace(., 'poet', 'Пјесник')"/>
            <xsl:text>: </xsl:text>
            <xsl:apply-templates mode="heading"/>
        </p>
        <p class="bs-la" style="display:none">
            <xsl:value-of select="@type ! replace(., 'performer', 'Pjevac') ! replace(., 'poet', 'Pjesnik')"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="@lat"/>
        </p>
    </xsl:template>
    <xsl:template match="year" mode="heading"/>
    <xsl:template match="desc" mode="heading"/>
    <xsl:template match="url" mode="heading"/>
    <xsl:template match="body" mode="heading"/>


    <!-- MODE:graph-->
    <xsl:template mode="graph" match="meta"/>

    <xsl:template mode="graph" match="body">
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
            <text fill="white" x="{50+$bar-spacing}" y="{450-(4*$pc-turkic*100)-10}"
                transform="rotate(270 {50+$bar-spacing - 1},{450-(4*$pc-turkic*100)-10})">
                <xsl:text>Turkic / Turski / Турски </xsl:text>
                <xsl:value-of select="round($pc-turkic * 100, 1)"/>
                <xsl:text>%</xsl:text>
            </text>

            <!-- SLAVIC -->
            <rect fill="#FFC436" x="{50+$bar-spacing+($bar-width+$bar-spacing)}"
                y="{450-(4*($pc-slavic*100))}" width="{$bar-width}" height="{4*($pc-slavic*100)}"/>
            <text fill="white" x="{50+$bar-spacing+($bar-width+$bar-spacing)}"
                y="{450-(4*$pc-turkic*100)-10}"
                transform="rotate(270 {50+$bar-spacing+($bar-width+$bar-spacing)-1},{450-(4*$pc-turkic*100)-10})">
                <xsl:text>Slavic / Slavenski / Славенски </xsl:text>
                <xsl:value-of select="round($pc-slavic * 100, 1)"/>
                <xsl:text>%</xsl:text>
            </text>

            <!-- LATIN -->
            <rect fill="#FFC436" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}"
                y="{450-(4*($pc-latin*100))}" width="{$bar-width}" height="{4*($pc-latin*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(2*($bar-width+$bar-spacing))}"
                y="{450-(4*($pc-latin*100))-10}"
                transform="rotate(270 {50+$bar-spacing+(2*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                <xsl:text>Latin / Latinski / Латински </xsl:text>
                <xsl:value-of select="round($pc-latin * 100, 1)"/>
                <xsl:text>%</xsl:text>
            </text>

            <!-- GREEK -->
            <rect fill="#FFC436" x="{50+$bar-spacing+(3*($bar-width+$bar-spacing))}"
                y="{450-(4*($pc-greek*100))}" width="{$bar-width}" height="{4*($pc-greek*100)}"/>
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
                y="{450-(4*($pc-italian*100))}" width="{$bar-width}" height="{4*($pc-italian*100)}"/>
            <text fill="white" x="{50+$bar-spacing+(6*($bar-width+$bar-spacing))}"
                y="{450-(4*($pc-italian*100))-10}"
                transform="rotate(270 {50+$bar-spacing+(6*($bar-width+$bar-spacing))-1},{450-(4*$pc-turkic*100)-10})">
                <xsl:text>Italian / Talijanski / Талијански </xsl:text>
                <xsl:value-of select="round($pc-italian * 100, 1)"/>
                <xsl:text>%</xsl:text>
            </text>
        </svg>
    </xsl:template>

    <!-- MODE:chart -->
    <xsl:template mode="chart" match="meta"/>

    <xsl:template mode="chart" match="body">
        <xsl:variable name="total-words" as="xs:integer"
            select='count(//origin[not(@lang = "n/a")])'/>
        <xsl:variable name="n-turkic" as="xs:integer" select='count(//origin[@lang = "turkic"])'/>
        <xsl:variable name="n-slavic" as="xs:integer" select='count(//origin[@lang = "slavic"])'/>
        <xsl:variable name="n-latin" as="xs:integer" select='count(//origin[@lang = "latin"])'/>
        <xsl:variable name="n-greek" as="xs:integer" select='count(//origin[@lang = "greek"])'/>
        <xsl:variable name="n-hungarian" as="xs:integer"
            select='count(//origin[@lang = "hungarian"])'/>
        <xsl:variable name="n-germanic" as="xs:integer" select='count(//origin[@lang = "germanic"])'/>
        <xsl:variable name="n-italian" as="xs:integer" select='count(//origin[@lang = "italian"])'/>
        <xsl:variable name="n-NA" as="xs:integer" select='count(//origin[@lang = "n/a"])'/>

        <table>
            <tr>
                <th class="en" style="display:block">Language</th>
                <th class="en" style="display:block">Number</th>

                <th class="bs-cy" style="display:none">Језик</th>
                <th class="bs-cy" style="display:none">Број</th>

                <th class="bs-la" style="display:none">Jezik</th>
                <th class="bs-la" style="display:none">Broj</th>
            </tr>
            <tr>
                <td class="en" style="display:block">Turkic</td>
                <td class="bs-cy" style="display:none">Туркси</td>
                <td class="bs-la" style="display:none">Turksi</td>
                <td>
                    <xsl:value-of select="$n-turkic"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">Slavic</td>
                <td class="bs-cy" style="display:none">Славенски</td>
                <td class="bs-la" style="display:none">Slavenski</td>
                <td>
                    <xsl:value-of select="$n-slavic"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">Latin</td>
                <td class="bs-cy" style="display:none">Латински</td>
                <td class="bs-la" style="display:none">Latinski</td>
                <td>
                    <xsl:value-of select="$n-latin"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">Greek</td>
                <td class="bs-cy" style="display:none">Γрчки</td>
                <td class="bs-la" style="display:none">Grčki</td>
                <td>
                    <xsl:value-of select="$n-greek"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">Hungarian</td>
                <td class="bs-cy" style="display:none">Мађарски</td>
                <td class="bs-la" style="display:none">Mađarski</td>
                <td>
                    <xsl:value-of select="$n-hungarian"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">Germanic</td>
                <td class="bs-cy" style="display:none">Њемачки</td>
                <td class="bs-la" style="display:none">Njemački</td>
                <td>
                    <xsl:value-of select="$n-germanic"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">Italian</td>
                <td class="bs-cy" style="display:none">Талијански</td>
                <td class="bs-la" style="display:none">Talijanski</td>
                <td>
                    <xsl:value-of select="$n-italian"/>
                </td>
            </tr>
            <tr>
                <td class="en" style="display:block">N/a</td>
                <td class="bs-cy" style="display:none">Није словo</td>
                <td class="bs-la" style="display:none">Nije slovo</td>
                <td>
                    <xsl:value-of select="$n-NA"/>
                </td>
            </tr>
        </table>

    </xsl:template>

</xsl:stylesheet>
