<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Catalog</title>
      </head>
      <body>
        <h1>Catalog</h1>
        <ul>
          <xsl:apply-templates select="//product"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="product">
    <li>
      <article>
        <h3><xsl:value-of select="@product_id"/></h3>
        <p><xsl:value-of select="@description"/></p>
        <table>
          <tr>
            <th>Item Number</th>
            <th>Price</th>
            <th>Gender</th>
            <th>Small</th>
            <th>Medium</th>
            <th>Large</th>
            <th>Extra Large</th>
          </tr>
          <xsl:apply-templates select="catalog_item"/>
        </table>
      </article>
    </li>
  </xsl:template>
  
  <xsl:template match="catalog_item">
    <tr>
      <td><xsl:value-of select="item_number"/></td>
      <td><xsl:value-of select="price"/></td>
      <td>
        <xsl:choose>
          <xsl:when test="@gender='Men'">M</xsl:when>
          <xsl:when test="@gender='Women'">W</xsl:when>
          <xsl:otherwise>N/A</xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:apply-templates select="size[@description='Small']"/>
      </td>
      <td>
        <xsl:apply-templates select="size[@description='Medium']"/>
      </td>
      <td>
        <xsl:apply-templates select="size[@description='Large']"/>
      </td>
      <td>
        <xsl:apply-templates select="size[@description='Extra Large']"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="size">
    <table>
      <xsl:apply-templates select="color_swatch"/>
    </table>
  </xsl:template>
  
  <xsl:template match="color_swatch">
    <tr>
      <td><xsl:value-of select="."/></td>
      <td><img src="{@image}" alt="{.}"/></td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>