<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>


    <xsl:template match="/">

        <html>

            <head>
                <title>Arqueossítios do NW Português 🇵🇹 </title>
                

            </head>

            <body style="background-color:#FFF8DC;font-family: 'Montserrat', sans-serif;">
                <h1 align="center"> ARQUEOSSÍTIOS DO NW PORTUGUÊS 🇵🇹 </h1>
                <table width="100%" border="1">
                    <tr>
                        <td width="30%" valign="top">
                            <a name="indice"/>
                            <h3 align="center">ÍNDICE</h3>
                            <ul>
                                <xsl:apply-templates mode="indice" select="//ARQELEM">
                                    <xsl:sort select="IDENTI"/>
                                </xsl:apply-templates>
                            </ul>
                        </td>

                        <td>
                            <xsl:apply-templates select="//ARQELEM">
                                <xsl:sort data-type="text" select="CONCEL"/>
                            </xsl:apply-templates>
                        </td>
                    </tr>
                </table>
            </body>
        </html>

    </xsl:template>


    <!-- Templates para o índice ............................................-->

    <xsl:template match="ARQELEM" mode="indice">
        <li>
            <a href="#{IDENTI}">
                <xsl:value-of select="IDENTI"/>
            </a>
        </li>
    </xsl:template>





    <!-- Templates para o conteúdo ............................................-->
    <xsl:template match="ARQELEM">
        <a name="{IDENTI}"/>
        
        <p><b>Identificador</b>: <xsl:value-of select="IDENTI"/></p>

        <xsl:if test="DESCRI">
            <p><b>Descrição</b>: <xsl:value-of select="DESCRI"/></p>
        </xsl:if>

        <xsl:if test="CRONO">
            <p><b>Crono</b>: <xsl:value-of select="CRONO"/></p>
        </xsl:if>


        <xsl:if test="LUGAR != ''">
            <p><b>Lugar</b>: <xsl:value-of select="LUGAR"/></p>
        </xsl:if>

        <p><b>Freguesia</b>: <xsl:value-of select="FREGUE"/></p>
        <p><b>Concelho</b>: <xsl:value-of select="CONCEL"/></p>
        <xsl:if test="LATITU != ''">
            <p><b>Latitude</b>: <xsl:value-of select="LATITU"/></p>
        </xsl:if>

        <xsl:if test="LONGIT != ''">
            <p><b>Longitude</b>: <xsl:value-of select="LONGIT"/></p>
        </xsl:if>

        <xsl:if test="LONGIT != ''">
            <p><b>Altitude</b>: <xsl:value-of select="ALTITU"/></p>
        </xsl:if>

        <xsl:if test="ACESSO != ''">
            <p style="line-height:2"><b>Acesso</b>: <xsl:value-of select="ACESSO"/></p>
        </xsl:if>


        <xsl:if test="QUADRO != ''">
            <p style="line-height:2"><b>Quadro</b>: <xsl:value-of select="QUADRO"/></p>
        </xsl:if>

        
        
         <xsl:if test="TRAARQ!=''">
            <p style="line-height:2"><b>Trabalhos Arqueológicos</b>: <xsl:value-of select="TRAARQ"/></p>    
        </xsl:if>
        
        
        
          <p style="line-height:2"><b>Descrição Arqueológica</b>: <xsl:value-of select="DESARQ"/></p>    
        
        
        <xsl:if test="INTERP!=''">
            <p style="line-height:2"><b>Interpretação</b>: <xsl:value-of select="INTERP"/></p>    
        </xsl:if>
        
        <xsl:if test="DEPOSI!=''">
            <p style="line-height:2"><b>Depósito</b>: <xsl:value-of select="DEPOSI"/></p>    
        </xsl:if>
        
        <xsl:if test="INTERE!=''">
            <p style="line-height:2"><b>Interesse Arqueológico</b>: <xsl:value-of select="INTERE"/></p>    
        </xsl:if>
        
        
        

        <p><b>Autor</b>: <xsl:value-of select="AUTOR"/>  </p>

        <p><b>Data</b>: <xsl:value-of select="DATA"/>  </p>


        <address>[<a href="#indice">Voltar ao índice</a>]</address>
        <center>
            <hr  width="100%"/>
        </center>
    </xsl:template>







</xsl:stylesheet>
