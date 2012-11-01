<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="xhtml"
                >
  <xsl:output method="text" indent="no"/>

  <xsl:template match="/">
    <xsl:for-each select="//xhtml:div[@class='news']">
      <xsl:value-of select="substring-after(.//xhtml:img/@alt, 'Группа ')" />

      <xsl:text>	</xsl:text>
      <xsl:value-of select="normalize-space(xhtml:h2)" />
      <xsl:text>	</xsl:text>
      <xsl:value-of select="normalize-space(.//xhtml:div[@class='sign'])" />
      <xsl:text>
      </xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>