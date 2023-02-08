<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <!--indent serve per l'indentazione nell'output -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <!-- l'attributo serve per il collegamento con xml-->
    <xsl:template match="/">
        <html lang="it">
            <head>
                <title><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']"/></title>
                <meta name="viewport" content="width=device-width,initial-scale=1" />
            
                <link href="progetto.css" rel="stylesheet" type="text/css" />
                
            </head>
            <body>
                <!-- MENU -->
                <header>
                    <div id="MENU">
                        <ul class="ULmenu">
                            <li><a href="#info"> Informazioni </a></li>
                            <li><a href="#pag16-17"> Pagine </a></li>
                            <li><a href="#gloss"> Terminologia </a></li>
                            <li><a href="#bibl"> Bibliografia </a></li>
                        </ul>
                    </div>
                </header>

                <section id="pIniziale" class="home">
                    <div id="Home">
                        <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" /></h1>
                    </div>
                </section>

                <!--informazioni sull'autore e sul manoscritto -->
                <br />
                <br />
                <section id="info" class="info">
                    <div id="biografia">
                        <xsl:apply-templates select="//tei:listPerson"/>
                    </div>
                </section>

                <section id="info1" class="info">
                    <div>
                        <xsl:apply-templates select="//tei:msContents" />
                    </div>
                </section>

                <section id="info2" class="info">
                    <div>
                        <xsl:apply-templates select="//tei:physDesc"/>
                    </div>
                </section>

                <section id="info3" class="info">
                    <div>
                        <xsl:apply-templates select="//tei:history"/>
                    </div>
                </section>

                <!-- fotografie pagine 16 e 17-->
                <section id="fotoPagine">
                    <div id="fotoP" class="FP">
                        <xsl:apply-templates select="//tei:facsimile" />
                        <span id="foto"></span>
                    </div>
                </section>

                <!--bottoni-->
                <section id="Bott">
                    <div id="bottoni" class="BTT">
                        <h2> Fenomeni notevoli </h2>
                        <br />
                        <button type="button" id="cancellazioni"> Cancellazione </button>
                        <button type="button" id="aggiunte"> Aggiunta </button>
                        <button type="button" id="abbreviazioni"> Abbreviazione </button>
                        <button type="button" id="termini"> Termine </button>
                        <button type="button" id="esLinguistico"> Esempio linguistico </button>
                        <button type="button" id="normalizzazione"> Normalizzazione </button>
                        <button type="button" id="inserimento"> Aggiunta dell'editore </button>
                    </div>
                </section>

                <!-- pag 16 e 17 -->
                <section id="pag16-17">
                    <div id="PG16-17" class="pag">
                        <xsl:attribute name="id">
                            <xsl:value-of select="//tei:div/@facs"/>
                        </xsl:attribute>
                        <br/>

                        <h2> Pagine 16 e 17 </h2>

                        <div class="trascrizione">
                            <div class="text" id="trascr">
                                <h3>Trascrizione</h3>
                                <xsl:apply-templates select="//tei:body/tei:div[@type='trascrizione']" />
                            </div>
                            <div class="text" id="trad">
                                <h3>Traduzione</h3>
                                <div class="traduz">
                                    <xsl:apply-templates select="//tei:body/tei:div[@type='traduzione']" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- glossario -->   
                <section id="gloss">
                    <div id="Gloss" class="BTT1">
                        <br />
                        <br />
                        <h2>Glossario</h2>
                        <xsl:apply-templates select="//tei:back/tei:div/tei:list" />
                    </div>
                </section>

                <!-- bibliografia -->
                <section id="bibl" class="BBL">
                    <h2>Bibliografia</h2>
                    <div class="bibliografia">
                        <xsl:apply-templates select="//tei:listBibl"/>
                    </div>
                </section>

                <!-- footer -->
                <section id="foot" class="FT">
                    <footer id="footer">
                        <h2>Informazioni</h2>
                        <ul>
                            <li><xsl:apply-templates select="//tei:editionStmt/tei:edition"/></li>
                           
                        </ul>
                        <ul class="listaAbout">
                            <xsl:for-each select="//tei:editionStmt/tei:respStmt">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <script src="progetto.js"/>
                    </footer> 
                </section> 
            </body>
        </html>
    </xsl:template>

    <!-- serve per visualizzare i contenuti -->
    <xsl:template match="tei:listPerson">
        <h2> L'autore </h2>

        <xsl:value-of select="//tei:person[@xml:id='FDS']/tei:persName"/>
        è stato un <xsl:value-of select="//tei:person/tei:occupation"/> svizzero,
        nato il <xsl:value-of select="//tei:person/tei:birth/tei:date" /> 
        a <xsl:value-of select="//tei:person/tei:birth/tei:placeName/tei:settlement"/>, 
        muore il <xsl:value-of select="//tei:person/tei:death/tei:date"/>
        a <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:settlement"/>,
        in <xsl:value-of select="//tei:person/tei:death/tei:placeName/tei:country"/>. 
        
    </xsl:template>

    <xsl:template match="tei:msContents">
        <h2>Il manoscritto</h2>
        <h3>Titolo</h3>
        <p><xsl:value-of select="//tei:title"/></p>
        <h3>Autore</h3>
        <p><xsl:value-of select="//tei:docAuthor"/></p>
        <h3>Lingua</h3>
        <p><xsl:value-of select="//tei:textLang"/></p>
        <h3>Data e Luogo</h3>
        <p><xsl:value-of select="//tei:docImprint//tei:docDate"/>,
        <xsl:value-of select="//tei:docImprint//tei:pubPlace"/></p>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <h2>Informazioni aggiuntive</h2>
        <h3>Materiale</h3>
        <p><xsl:value-of select="//tei:objectDesc//tei:supportDesc//tei:support"/></p>
        <h3>Dimensioni manoscritto</h3>
        <p><xsl:value-of select="//tei:objectDesc//tei:supportDesc//tei:extent"/></p>
        <h3>Lunghezza pagine</h3>
        <p><xsl:value-of select="//tei:objectDesc//tei:layout"/></p>
        <h3>Numero di identificazione</h3>
        <p><xsl:value-of select="//tei:msIdentifier//tei:idno"/></p>
        <h3>Mani</h3>
        <p><xsl:value-of select="//tei:physDesc//tei:handDesc"/></p>
        <h3>Condizioni</h3>
        <p><xsl:value-of select="//tei:objectDesc//tei:supportDesc//tei:condition"/></p>
        <h3>Scrittura</h3>
        <p><xsl:value-of select="//tei:physDesc//tei:typeDesc"/></p>
    </xsl:template>

    <xsl:template match="tei:history">
        <h2>Storia del manoscritto</h2>
        <p><xsl:value-of select="//tei:origin"/></p>
        <p><xsl:value-of select="//tei:acquisition"/></p>
    </xsl:template>

    <!-- immagini -->
    <xsl:template match="tei:facsimile">
        <h2>Le pagine</h2>
        <xsl:for-each select="//tei:surface">
            <xsl:element name="img">
                <xsl:attribute name="class">immagini</xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <!-- trascrizione -->
    <!-- pb -->
    <xsl:template match="tei:pb">
        <xsl:element name="br"/>
        <xsl:element name="b">
            <xsl:attribute name="class">titolo</xsl:attribute><br/>
            Pagina <xsl:value-of select="[@n]"/>
            <xsl:element name="br"/>
        </xsl:element>
    </xsl:template>

    <!-- ab -->
    <xsl:template match="tei:ab">
        <xsl:element name="br"/>
        <xsl:element name="b">
            <xsl:element name="div">
                <xsl:attribute name="class">pericope</xsl:attribute><br/>
                Pericope <xsl:value-of select="[@n]"/>
            </xsl:element>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- lb -->
    <xsl:template match="tei:lb">
        <xsl:element name="br"/>
        <xsl:element name="b">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">num</xsl:attribute>
            <xsl:value-of select="@n"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- fw -->
    <xsl:template match="tei:fw">
    
    </xsl:template>

    <!-- head -->
    <xsl:template match="tei:text/body/div/head">
        
    </xsl:template>

    <!-- cancellazione -->
    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Aggiunta dell'autore -->
    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- aggiunta dell'editore -->
    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">supplied</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <!-- Abbreviazione -->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- expan -->
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <!-- Termine -->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:attribute name="class">term</xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="@ref"/></xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Esempio linguistico -->
    <xsl:template match="tei:foreign">
        <xsl:element name="span">
            <xsl:attribute name="class">foreign</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Correzione fatta con choice -->
    <xsl:template match="//tei:choice/tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- choice -->
    <xsl:template match="//tei:choice/tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:attribute name="href"><xsl:value-of select="@ref"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- correzione -->
    <xsl:template match="tei:choice/tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- parole illeggibili -->
    <xsl:template match="tei:gap">
        <xsl:element name="span">
            <xsl:attribute name="class">del</xsl:attribute>
            - - - -
        </xsl:element>
    </xsl:template>

    
    <!-- parole sottolineate -->
    <xsl:template match="tei:*[@rend='underline']">
        <xsl:element name="span">
            <xsl:attribute name="class">underline</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- corsivo -->
    <xsl:template match="tei:*[@rend='italic']">
        <xsl:element name="span">
            <xsl:attribute name="class">italic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- parole tolte dall'editore -->
    <xsl:template match="tei:surplus">
        <xsl:element name="span">
            <xsl:attribute name="class">surplus</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- parola enfatizzata -->
    <xsl:template match="tei:emph">
        <xsl:element name="span">
            <xsl:attribute name="class">emph</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>



    <!-- glossario -->
    <xsl:template match="tei:list[@type='terminology']">
        <xsl:for-each select="tei:label">
            <xsl:element name="div">
                <xsl:attribute name="class">termGlossario</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="tei:term/@xml:id"/></xsl:attribute>
                <xsl:element name="br"></xsl:element>
                <xsl:element name="br"></xsl:element>
                <xsl:element name="br"></xsl:element>
                <xsl:element name="br"></xsl:element>
                <xsl:element name="h4">
                <xsl:attribute name="class">termGlossario</xsl:attribute>
                <xsl:value-of select="tei:term[@xml:lang='fr']"/>
                <xsl:element name="br"></xsl:element>
                <xsl:value-of select="tei:term[@xml:lang='it']"/>
                <xsl:element name="br"></xsl:element>
                </xsl:element>
                <p class="definizione">
                    <xsl:variable name="currentTermID">
                        <xsl:value-of select="concat('#',tei:term/@xml:id)"/>
                    </xsl:variable>
                    <xsl:for-each select="../tei:item/tei:gloss">
                        <xsl:if test="$currentTermID = @target">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </p>
            </xsl:element>
            <xsl:element name="br"></xsl:element>
        </xsl:for-each>
    </xsl:template>


    <!-- bibliografia -->
    <xsl:template match="tei:listBibl">
        <xsl:element name="ul">
            <xsl:for-each select="tei:bibl">
                <xsl:element name="li">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@source"/>
                    </xsl:attribute>

                    <xsl:element name="span">
                        <xsl:attribute name="class">underline</xsl:attribute>
                        <xsl:value-of select="tei:title"/>
                    </xsl:element>,
                    <xsl:for-each select="tei:author/tei:persName">
                        <i><xsl:value-of select="." /></i>,
                    </xsl:for-each>
                    <xsl:for-each select="tei:pubPlace/tei:placeName">
                        <i><xsl:value-of select="." /></i>,
                    </xsl:for-each>
                    <xsl:value-of select="tei:publisher"/>,
                    <xsl:value-of select="tei:date"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
