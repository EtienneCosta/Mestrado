<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Mar 7, 2021</xd:p>
            <xd:p><xd:b>Author:</xd:b> etiennecosta</xd:p>
            <xd:p>Conversão do arquivo de música digital : XML para TTL</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="obra">
        ### http://www.di.uminho.pt/prc2021/amd#<xsl:value-of select="@id"/>
        :<xsl:value-of select="@id"/> rdf:type owl:NamedIndividual ,
         :Obra ;

         :título "<xsl:value-of select="titulo"/>" 

        <xsl:if test="subtitulo">
         ;   :subtítulo "<xsl:value-of select="subtitulo"/>" 
        </xsl:if>

        <xsl:if test="tipo">
        ; :tipo "<xsl:value-of select="tipo"/>" 
        </xsl:if>

        <xsl:if test="inf-relacionada">
          ;  :href "<xsl:value-of select="inf-relacionada/video/@href"/>" 
        </xsl:if>  .
        #---------------------------------------------

    <xsl:if test="compositor">
        ### http://www.di.uminho.pt/prc2021/amd#<xsl:value-of select="replace(compositor,' ','')"/>
        :<xsl:value-of select="replace(compositor,' ','')"/> rdf:type owl:NamedIndividual ,
        Compositor ;
        :compôs :<xsl:value-of select="@id"/>;
        :nome  "<xsl:value-of select="compositor"/>" .
        #---------------------------------------------
    </xsl:if>

    <xsl:if test="editado">
    ###  http://www.di.uminho.pt/prc2021/amd#<xsl:value-of select="replace(editado,' ','')"/>
    :<xsl:value-of select="replace(editado,' ','')"/> rdf:type owl:NamedIndividual ,
                          :Compositor ;
                :editou :<xsl:value-of select="@id"/> ;
                :nome  "<xsl:value-of select="editado"/>" .
    </xsl:if>

    <xsl:if test="arranjo">
    ###  http://www.di.uminho.pt/prc2021/amd#<xsl:value-of select="replace(arranjo,' ','')"/>
    :<xsl:value-of select="replace(arranjo,' ','')"/> rdf:type owl:NamedIndividual ,
                          :Compositor ;
                 :arranjou :<xsl:value-of select="@id"/> ,
                 :nome  "<xsl:value-of select="arranjo"/>" .
    </xsl:if>


    <xsl:for-each-group select="instrumentos/instrumento" group-by=".">
        ###  http://www.di.uminho.pt/prc2021/amd#<xsl:value-of select="replace(designacao,' ','')"/> 
            :<xsl:value-of select="replace(designacao,' ','')"/> rdf:type owl:NamedIndividual,
            :Instrumento ;
            :éUsado :<xsl:value-of select="../../@id"/> ;
            :designação "<xsl:value-of select="designacao"/>" .
            # --------------------------------------------------

            <xsl:for-each select="partitura">
                ### http://www.di.uminho.pt/prc2021/amd#<xsl:value-of select="@path"/>
                :<xsl:value-of select="@path"/> rdf:type owl:NamedIndividual ,
                :Partitura ;
                :éReferente :<xsl:value-of select="replace(../designacao,' ','')"/> ;
                :type "<xsl:value-of select="@type"/>" ;
                :path "<xsl:value-of select="@path"/>" 
                <xsl:if test="@afinacao">
                ; :afinação "<xsl:value-of select="@afinacao"/>" 
                </xsl:if>
                 <xsl:if test="@voz">
                ; :voz "<xsl:value-of select="@voz"/>" 
                </xsl:if>
                <xsl:if test="@clave">
                ; :clave "<xsl:value-of select="@clave"/>" 
                </xsl:if>  .
                # --------------------------------------------------
            </xsl:for-each>

    </xsl:for-each-group>

    </xsl:template>

</xsl:stylesheet>