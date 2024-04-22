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
    select="collection('../texts_xml/?select=*.xml')"/>
  <xsl:variable name="all-lang-instances" as="xs:string+" select="$all-docs//origin/@lang"/>
  <xsl:variable name="all-lang-names" as="xs:string+"
    select="$all-lang-instances => distinct-values() => sort()"/>
  <xsl:variable name="total-lang-instance-count" as="xs:integer" select="count($all-lang-instances)"/>

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
    <xsl:variable name="apply-cap-nj" as="xs:string" select="$apply-cap-lj => replace('Њ', 'Nj')"/>
    <xsl:variable name="apply-cap-dzh" as="xs:string" select="$apply-cap-nj => replace('Џ', 'Dž')"/>
    <xsl:variable name="one-to-one" as="xs:string"
      select="$apply-cap-dzh => translate('абвгдђежзијклмнопрстћуфхцчшАБВГДЂЕЖЗИЈКЛМНОПРСТЋУФЦЧШ', 'abvgdđežzijklmnoprstćufhcčšABVGDĐEŽZIJKLMNOPRSTĆUFCČŠ')"/>
    <xsl:value-of select="$one-to-one"/>
  </xsl:function>

  <!-- TEMPLATES -->
  <xsl:template name="xsl:initial-template" match="/">
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
              <a href="index.html" class="nav_link en" style="display:block">About the Project</a>
              <a href="index.html" class="nav_link bs-cy" style="display:none">О овом пројекту</a>
              <a href="index.html" class="nav_link bs-la" style="display:none">O ovom projetku</a>
            </li>
            <li class="nav_button">
              <a href="methodology.xhtml" class="nav_link en" style="display:block">Methodology</a>
              <a href="methodology.xhtml" class="nav_link bs-cy" style="display:none">Начин
                истраживања</a>
              <a href="methodology.xhtml" class="nav_link bs-la" style="display:none">Način
                istraživanja</a>
            </li>
            <li class="nav_button">
              <a href="text_directory.xhtml" class="nav_link en" style="display:block">Text
                Directory</a>
              <a href="text_directory.xhtml" class="nav_link bs-cy" style="display:none">Директориј
                текстова</a>
              <a href="text_directory.xhtml" class="nav_link bs-la" style="display:none">Direktorij
                tekstova</a>
            </li>
            <li class="nav_button">
              <a href="textual_analysis.xhtml" class="nav_link en" style="display:block">Textual
                Analysis</a>
              <a href="textual_analysis.xhtml" class="nav_link bs-cy" style="display:none">Анализа
                текстова</a>
              <a href="textual_analysis.xhtml" class="nav_link bs-la" style="display:none">Analiza
                tekstova</a>
            </li>
            <li class="nav_button">
              <a href="contributors.xhtml" class="nav_link en" style="display:block"
                >Contributors</a>
              <a href="contributors.xhtml" class="nav_link bs-cy" style="display:none">Сурадници</a>
              <a href="contributors.xhtml" class="nav_link bs-la" style="display:none">Suradnici</a>
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
        <h1 class="main_title en"  style="display:block">Textual Analysis</h1>
        <h1 class="main_title bs-cy" style="display:none">Анализа текстова</h1>
        <h1 class="main_title bs-la" style="display:none">Analiza tekstova</h1>
        <hr/>
        <section>
          <!-- CHART -->
          <h2 class="en" style="display:block">Aggregated Counts</h2>
          <h2 class="bs-cy" style="display:none">Сакупљени бројеви</h2>
          <h2 class="bs-la" style="display:none">Sakupljeni brojevi</h2>
          <table>
            <tr>
              <th>
                <span class="en" style="display:block">Language</span>
                <span class="bs-cy" style="display:none">Језик</span>
                <span class="bs-la" style="display:none">Jezik</span>
              </th>
              <th>
                <span class="en" style="display:block">Count</span>
                <span class="bs-cy" style="display:none">Број</span>
                <span class="bs-la" style="display:none">Broj</span>
              </th>
              <th>
                <span class="en" style="display:block">Percentage</span>
                <span class="bs-cy" style="display:none">Просенати</span>
                <span class="bs-la" style="display:none">Procenati</span>
              </th>
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
                    select="(100 * $lang-instance-count div $total-lang-instance-count) => round(2)"/>
                  <xsl:text>%</xsl:text>
                </td>
              </tr>
            </xsl:for-each>
          </table>
          <!-- GRAPH -->
          <div class="info">
            <h2 class="en" style="display:block">Aggregated Graph</h2>
            <h2 class="bs-cy" style="display:none">Сакупљени граф</h2>
            <h2 class="bs-la" style="display:none">Sakupljeni graf</h2>
            <xsl:variable name="lang-count-map" as="map(xs:string, xs:integer)">
              <xsl:map>
                <xsl:for-each select="$all-lang-names">
                  <xsl:variable name="count" select="count($all-lang-instances[. eq current()])"/>
                  <xsl:map-entry key="current()" select="$count"/>
                </xsl:for-each>
              </xsl:map>
            </xsl:variable>
            <xsl:variable name="pc-slavic" as="xs:double"
              select="map:get($lang-count-map, 'slavic')"/>
            <xsl:variable name="pc-turkic" as="xs:double"
              select="map:get($lang-count-map, 'turkic')"/>
            <xsl:variable name="pc-latin" as="xs:double" select="map:get($lang-count-map, 'latin')"/>
            <xsl:variable name="pc-greek" as="xs:double" select="map:get($lang-count-map, 'greek')"/>
            <xsl:variable name="pc-hunarian" as="xs:double"
              select="map:get($lang-count-map, 'hungarian')"/>
            <xsl:variable name="pc-germaic" as="xs:double"
              select="map:get($lang-count-map, 'germanic')"/>
            <xsl:variable name="pc-italian" as="xs:double"
              select="map:get($lang-count-map, 'italian')"/>
            <xsl:variable name="total-words" as="xs:integer" select="count($all-lang-instances)"/>

            <xsl:variable name="total-words" as="xs:integer"
              select='count($all-docs//origin[not(@lang = "n/a")])'/>

            <xsl:variable name="n-turkic" as="xs:integer"
              select='count($all-docs//origin[@lang = "turkic"])'/>
            <xsl:variable name="pc-turkic" as="xs:double" select="$n-turkic div $total-words"/>

            <xsl:variable name="n-slavic" as="xs:integer"
              select='count($all-docs//origin[@lang = "slavic"])'/>
            <xsl:variable name="pc-slavic" as="xs:double" select="$n-slavic div $total-words"/>

            <xsl:variable name="n-latin" as="xs:integer"
              select='count($all-docs//origin[@lang = "latin"])'/>
            <xsl:variable name="pc-latin" as="xs:double" select="$n-latin div $total-words"/>

            <xsl:variable name="n-greek" as="xs:integer"
              select='count($all-docs//origin[@lang = "greek"])'/>
            <xsl:variable name="pc-greek" as="xs:double" select="$n-greek div $total-words"/>

            <xsl:variable name="n-hungarian" as="xs:integer"
              select='count($all-docs//origin[@lang = "hungarian"])'/>
            <xsl:variable name="pc-hungarian" as="xs:double" select="$n-hungarian div $total-words"/>

            <xsl:variable name="n-germanic" as="xs:integer"
              select='count($all-docs//origin[@lang = "germanic"])'/>
            <xsl:variable name="pc-germanic" as="xs:double" select="$n-germanic div $total-words"/>

            <xsl:variable name="n-italian" as="xs:integer"
              select='count($all-docs//origin[@lang = "italian"])'/>
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
          </div>
          <!-- COUNTS BY POEM -->
          <div class="info">
            <h2 class="en" style="display:block">Counts by Poem</h2>
            <h2 class="bs-cy" style="display:none">Бројеви сваке пјесме</h2>
            <h2 class="bs-la" style="display:none">Brojevi svake pjesme</h2>
            <table>
              <tr>
                <th>
                  <span class="en" style="display:block">Poem</span>
                  <span class="bs-cy" style="display:none">Пјесма</span>
                  <span class="bs-la" style="display:none">Pjesma</span>
                </th>
                <th>
                  <span class="en" style="display:block">Poet</span>
                  <span class="bs-cy" style="display:none">Пјесник</span>
                  <span class="bs-la" style="display:none">Pjesnik</span>
                </th>
                <th>
                  <span class="en" style="display:block">Performer</span>
                  <span class="bs-cy" style="display:none">Пјевац</span>
                  <span class="bs-la" style="display:none">Pjevac</span>
                </th>
                <th>
                  <span class="en" style="display:block">Slavic</span>
                  <span class="bs-cy" style="display:none">Славенски</span>
                  <span class="bs-la" style="display:none">Slavenski</span>
                </th>
                <th>
                  <span class="en" style="display:block">Turkic</span>
                  <span class="bs-cy" style="display:none">Турски</span>
                  <span class="bs-la" style="display:none">Turski</span>
                </th>
                <th>
                  <span class="en" style="display:block">Other languages</span>
                  <span class="bs-cy" style="display:none">Други језици</span>
                  <span class="bs-la" style="display:none">Drugi jezici</span>
                </th>
              </tr>
              <xsl:apply-templates mode="poem-graph" select="$all-docs/poem"/>
            </table>
          </div>
        </section>
      </body>
    </html>
  </xsl:template>

  <xsl:template mode="poem-graph" match="poem">
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
    <tr>
      <td>
        <span class="en" style="display:block">
          <xsl:apply-templates mode="poem-graph" select=".//title_bs => cam:cyr-to-lat()"/>
          <xsl:text> (</xsl:text>
          <xsl:apply-templates mode="poem-graph" select=".//title_en"/>
          <xsl:text>)</xsl:text>
        </span>
        <span class="bs-cy" style="display:none">
          <xsl:apply-templates mode="poem-graph" select=".//title_bs"/>
        </span>
        <span class="bs-la" style="display:none">
          <xsl:apply-templates mode="poem-graph" select=".//title_bs => cam:cyr-to-lat()"/>
        </span>
      </td>
      <td>
        <span class="en" style="display:block">
          <xsl:value-of select=".//author[@type = 'poet']/@lat"/>
        </span>
        <span class="bs-cy" style="display:none">
          <xsl:value-of select=".//author[@type = 'poet']"/>
        </span>
        <span class="bs-la" style="display:none">
          <xsl:value-of select=".//author[@type = 'poet']/@lat"/>
        </span>
      </td>
      <td>
        <span class="en" style="display:block">
          <xsl:value-of select=".//author[@type = 'performer']/@lat"/>
        </span>
        <span class="bs-cy" style="display:none">
          <xsl:value-of select=".//author[@type = 'performer']"/>
        </span>
        <span class="bs-la" style="display:none">
          <xsl:value-of select=".//author[@type = 'performer']/@lat"/>
        </span>
      </td>
      <td>
        <xsl:value-of select="(($poem-gross-slav div $poem-gross-word) * 100) ! round(., 2)"/>
        <xsl:text>%</xsl:text>
      </td>
      <td>
        <xsl:value-of select="(($poem-gross-turk div $poem-gross-word) * 100) ! round(., 2)"/>
        <xsl:text>%</xsl:text>
      </td>
      <td>
        <xsl:value-of select="(($poem-gross-other div $poem-gross-word) * 100) ! round(., 2)"/>
        <xsl:text>%</xsl:text>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
