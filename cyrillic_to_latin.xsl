<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:cam="sevdah-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>

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
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//title_bs" mode="title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../index-style.css"/>
                <script type="text/javascript" src="../show-hide_en_bs-cy_bs-la.js"/>
                <script type="text/javascript" src="../text-transformations.js"/>
            </head>
            <body>
                <nav class="navigation">
                    <h1 class="website_title">SEVDAH</h1>
                    <ul class="navig">
                        <li class="nav_button">
                            <a href="../index.html" class="nav_link en" style="display:block">About
                                the Project</a>
                            <a href="../index.html" class="nav_link bs-cy" style="display:none">О
                                овом пројекту</a>
                            <a href="../index.html" class="nav_link bs-la" style="display:none">O
                                ovom projetku</a>
                        </li>
                        <li class="nav_button">
                            <a href="../methodology.xhtml" class="nav_link en" style="display:block"
                                >Methodology</a>
                            <a href="../methodology.xhtml" class="nav_link bs-cy"
                                style="display:none">Начин истраживања</a>
                            <a href="../methodology.xhtml" class="nav_link bs-la"
                                style="display:none">Način istraživanja</a>
                        </li>
                        <li class="nav_button">
                            <a href="../text_directory.xhtml" class="nav_link en"
                                style="display:block">Text Directory</a>
                            <a href="../text_directory.xhtml" class="nav_link bs-cy"
                                style="display:none">Директориј текстова</a>
                            <a href="../text_directory.xhtml" class="nav_link bs-la"
                                style="display:none">Direktorij tekstova</a>
                        </li>
                        <li class="nav_button">
                            <a href="../textual_analysis.xhtml" class="nav_link en"
                                style="display:block">Textual Analysis</a>
                            <a href="../textual_analysis.xhtml" class="nav_link bs-cy"
                                style="display:none">Анализа текстова</a>
                            <a href="../textual_analysis.xhtml" class="nav_link bs-la"
                                style="display:none">Analiza tekstova</a>
                        </li>
                        <li class="nav_button">
                            <a href="../contributors.xhtml" class="nav_link en"
                                style="display:block">Contributors</a>
                            <a href="../contributors.xhtml" class="nav_link bs-cy"
                                style="display:none">Сурадници</a>
                            <a href="../contributors.xhtml" class="nav_link bs-la"
                                style="display:none">Suradnici</a>
                        </li>
                        <li class="nav_button">
                            <a href="../bibliography.xhtml" class="nav_link en"
                                style="display:block">Bibliography</a>
                            <a href="../bibliography.xhtml" class="nav_link bs-cy"
                                style="display:none">Библиографија</a>
                            <a href="../bibliography.xhtml" class="nav_link bs-la"
                                style="display:none">Bibliografija</a>
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
                <h1 class="main_title en" style="display:block">
                    <xsl:value-of select="//title_en"/>
                </h1>
                <h1 class="main_title bs-cy" style="display:none">
                    <xsl:value-of select="//title_bs"/>
                </h1>
                <h1 class="main_title bs-la" style="display:none">
                    <xsl:apply-templates select="//title_bs" mode="main_lat"/>
                </h1>
                <div class="options">
                    <section class="options">
                        <h3 class="options en" style="display:block">Slavic Origin</h3>
                        <h3 class="options bs-cy" style="display:none">Из Славенског</h3>
                        <h3 class="options bs-la" style="display:none">Iz Slavenskog</h3>
                        <ul class="options">
                            <li class="options">
                                <button class="options languageToggle" data-language="slavic"
                                    data-style="italic">
                                    <span class="en" style="display:block">Italics</span>
                                    <span class="bs-cy" style="display:none">Курзивно</span>
                                    <span class="bs-la" style="display:none">Kurzivno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="slavic"
                                    data-style="bold">
                                    <span class="en" style="display:block">Bold</span>
                                    <span class="bs-cy" style="display:none">Масно</span>
                                    <span class="bs-la" style="display:none">Masno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="slavic"
                                    data-style="under">
                                    <span class="en" style="display:block">Underline</span>
                                    <span class="bs-cy" style="display:none">Подучено</span>
                                    <span class="bs-la" style="display:none">Podučeno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="slavic"
                                    data-style="clear">
                                    <span class="en" style="display:block">Clear</span>
                                    <span class="bs-cy" style="display:none">Без стила</span>
                                    <span class="bs-la" style="display:none">Bez stila</span>
                                </button>
                            </li>
                        </ul>
                    </section>
                    <hr/>
                    <section class="options">
                        <h3 class="options en" style="display:block">Turkic Origin</h3>
                        <h3 class="options bs-cy" style="display:none">Из Турског</h3>
                        <h3 class="options bs-la" style="display:none">Iz Turskog</h3>
                        <ul class="options">
                            <li class="options">
                                <button class="options languageToggle" data-language="turkic"
                                    data-style="italic">
                                    <span class="en" style="display:block">Italics</span>
                                    <span class="bs-cy" style="display:none">Курзивно</span>
                                    <span class="bs-la" style="display:none">Kurzivno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="turkic"
                                    data-style="bold">
                                    <span class="en" style="display:block">Bold</span>
                                    <span class="bs-cy" style="display:none">Масно</span>
                                    <span class="bs-la" style="display:none">Masno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="turkic"
                                    data-style="under">
                                    <span class="en" style="display:block">Underline</span>
                                    <span class="bs-cy" style="display:none">Подучено</span>
                                    <span class="bs-la" style="display:none">Podučeno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="turkic"
                                    data-style="clear">
                                    <span class="en" style="display:block">Clear</span>
                                    <span class="bs-cy" style="display:none">Без стила</span>
                                    <span class="bs-la" style="display:none">Bez stila</span>
                                </button>
                            </li>
                        </ul>
                    </section>
                    <hr/>
                    <section class="options">
                        <h3 class="options en" style="display:block">Other Origins</h3>
                        <h3 class="options bs-cy" style="display:none">Из других језика</h3>
                        <h3 class="options bs-la" style="display:none">Iz drugih jezika</h3>
                        <ul class="options">
                            <li class="options">
                                <button class="options languageToggle" data-language="other"
                                    data-style="italic">
                                    <span class="en" style="display:block">Italics</span>
                                    <span class="bs-cy" style="display:none">Курзивно</span>
                                    <span class="bs-la" style="display:none">Kurzivno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="other"
                                    data-style="bold">
                                    <span class="en" style="display:block">Bold</span>
                                    <span class="bs-cy" style="display:none">Масно</span>
                                    <span class="bs-la" style="display:none">Masno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="other"
                                    data-style="under">
                                    <span class="en" style="display:block">Underline</span>
                                    <span class="bs-cy" style="display:none">Подучено</span>
                                    <span class="bs-la" style="display:none">Podučeno</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options languageToggle" data-language="other"
                                    data-style="clear">
                                    <span class="en" style="display:block">Clear</span>
                                    <span class="bs-cy" style="display:none">Без стила</span>
                                    <span class="bs-la" style="display:none">Bez stila</span>
                                </button>
                            </li>
                        </ul>
                    </section>
                    <hr/>
                    <section class="options">
                        <h3 class="options en" style="display:block">Alphabet / Azbuka</h3>
                        <h3 class="options bs-cy" style="display:none">Абецеда / Азбука</h3>
                        <h3 class="options bs-la" style="display:none">Abeceda / Azbuka</h3>
                        <ul class="options">
                            <li class="options">
                                <button class="options" style="display:block" onclick="Cyrillic()">
                                    <span class="en" style="display:block">Cyrillic</span>
                                    <span class="bs-cy" style="display:none">Ћирилица</span>
                                    <span class="bs-la" style="display:none">Ćirilica</span>
                                </button>
                            </li>
                            <li class="options">
                                <button class="options" style="display:block" onclick="Latin()">
                                    <span class="en" style="display:block">Latin</span>
                                    <span class="bs-cy" style="display:none">Латински</span>
                                    <span class="bs-la" style="display:none">Latinski</span>
                                </button>
                            </li>
                        </ul>
                    </section>
                    <hr/>
                    <section class="options">
                        <button class="options">
                            <a
                                href="{document-uri(.) ! replace(., '\.xml', '-chart.xhtml') ! replace(., '^.*/texts_xml/', '../testing_xslt_transform/', 'm')}">
                                <span class="en" style="display:block">See the graph</span>
                                <span class="bs-cy" style="display:none">Погледајте граф</span>
                                <span class="bs-la" style="display:none">Pogledajte graf</span>
                            </a>
                        </button>
                    </section>
                </div>
                <hr/>
                <section class="text_window cyrillic" style="display:block">
                    <xsl:apply-templates select="//title_bs" mode="cyr_tit"/>
                    <xsl:apply-templates select="//body" mode="cyrillic"/>
                </section>
                <section class="text_window latin_alp" style="display:none">
                    <xsl:apply-templates select="//title_bs" mode="lat_tit"/>
                    <xsl:apply-templates select="//body" mode="latin"/>
                </section>
            </body>
        </html>
    </xsl:template>

    <!-- TITLES -->
    <xsl:template match="title_bs" mode="title">
        <title>
            <xsl:value-of select="."/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="cam:cyr-to-lat(.)"/>
        </title>
    </xsl:template>

    <xsl:template match="title_bs" mode="cyr_tit">
        <h1 class="poem_title cyrillic">
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>

    <xsl:template match="title_bs" mode="lat_tit">
        <h1 class="poem_title lat">
            <xsl:value-of select="cam:cyr-to-lat(.)"/>
        </h1>
    </xsl:template>

    <xsl:template match="title_bs" mode="main_lat">
        <xsl:value-of select="cam:cyr-to-lat(.)"/>
    </xsl:template>

    <!-- CYRILLIC -->

    <xsl:template match="lg" mode="cyrillic">
        <xsl:apply-templates mode="cyrillic"/>
        <br/>
    </xsl:template>

    <xsl:template match="l" mode="cyrillic">
        <xsl:apply-templates mode="cyrillic"/>
        <br/>
    </xsl:template>

    <xsl:template match="origin" mode="cyrillic">
        <span class="{@lang} cyr">
            <xsl:apply-templates mode="cyrillic"/>
        </span>
    </xsl:template>

    <!-- LATIN -->

    <xsl:template match="lg" mode="latin">
        <xsl:apply-templates mode="latin"/>
        <br/>
        <br/>
    </xsl:template>

    <xsl:template match="l" mode="latin">
        <xsl:apply-templates mode="latin"/>
        <br/>
    </xsl:template>

    <xsl:template match="origin" mode="latin">
        <span class="{@lang} lat">
            <xsl:apply-templates select="cam:cyr-to-lat(.)" mode="latin"/>
        </span>
    </xsl:template>

</xsl:stylesheet>
