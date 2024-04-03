<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:cam="sevdah-functions"
  xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="#all" version="3.0">
  <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
    indent="yes"/>
  <!-- ================================================================== -->
  <!-- Stylesheet variables                                               -->
  <!-- ================================================================== -->
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
  <xsl:template name="xsl:initial-template">
    <html>
      <head>
        <title>Aggregated counts</title>
        <style type="text/css">
          table,
          tr,
          th,
          td {
            border: 1px solid black;
            border-collapse: collapse;
          }
          th,
          td {
            padding: 2px 3px;
          }
          tr:not(:first-child) > th {
            text-align: left;
          }
          td {
            text-align: right;
          }</style>
      </head>
      <body>
        <h1>Aggregated counts</h1>
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
                  select="(100 * $lang-instance-count div $total-lang-instance-count) => round(2)"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
