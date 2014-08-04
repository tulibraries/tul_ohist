<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
        xmlns:foxml="info:fedora/fedora-system:def/foxml#"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:exsl="http://exslt.org/common"
        extension-element-prefixes="exsl">
        <xsl:output method="xml" indent="yes"/>
        
 
        
        <xsl:template match="metadata">
        <xsl:variable name="baseURI">
          <xsl:value-of select="tokenize(base-uri(.), '/')[last()]" />
        </xsl:variable>
<xsl:variable name="filenamepart">
<xsl:value-of select="tokenize($baseURI, '\.xml')" />
</xsl:variable>

<xsl:variable name="collection">
<xsl:value-of select="normalize-space($filenamepart[1])"/>
</xsl:variable>

<xsl:variable name="foxmlDir">
  <xsl:value-of select="manifest/foxml_dir" />
</xsl:variable>
                <xsl:for-each select="record">
                        <xsl:variable name="cdmfile">
                        
                                <xsl:value-of select="concat($collection,'x',CONTENTdm_number)"/>
                        </xsl:variable>
                        
                        <xsl:variable name="pid">
                                <xsl:value-of select="concat('cdm:',$cdmfile)" />
                        </xsl:variable>
                        
                        
                        <exsl:document method="xml" href="{$foxmlDir}/{$cdmfile}.xml">

                                <xsl:element name="foxml:digitalObject"
                                        xmlns:foxml="info:fedora/fedora-system:def/foxml#"
                                        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                                        <xsl:attribute name="VERSION">
                                                <xsl:value-of select="1.1"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="PID">
                                                <xsl:value-of select="$pid"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="xsi:schemaLocation">info:fedora/fedora-system:def/foxml# http://www.fedora.info/definitions/1/0/foxml1-1.xsd</xsl:attribute>

                                        <foxml:objectProperties>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#state"
                                                  VALUE="Active"/>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#label"
                                                  VALUE="FOXML Reference Example"/>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#ownerId"
                                                  VALUE=""/>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#createdDate"
                                                  VALUE="2013-11-06T21:24:13.236Z"/>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/view#lastModifiedDate"
                                                  VALUE="2013-11-06T21:24:13.236Z"/>
                                        </foxml:objectProperties>
                                        <foxml:datastream ID="DC" STATE="A" CONTROL_GROUP="X"
                                                VERSIONABLE="true">
                                                <foxml:datastreamVersion ID="DC.0"
                                                  LABEL="Dublin Core Record for this object"
                                                  CREATED="2013-11-06T21:24:13.236Z"
                                                  MIMETYPE="text/xml"
                                                  FORMAT_URI="http://www.openarchives.org/OAI/2.0/oai_dc/"
                                                  SIZE="342">
                                                  <foxml:xmlContent>
                                                          <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
                                                                  xmlns:dc="http://purl.org/dc/elements/1.1/" 
                                                                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"> 
                                                                  <xsl:attribute name="xsi:schemaLocation">http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd</xsl:attribute>
                                                                  
                                                                  <dc:identifier><xsl:value-of select="$pid"/></dc:identifier>
                                                          </oai_dc:dc>
                                                
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        
                                        <foxml:datastream ID="objectMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="objectMetadata.0" LABEL="Object metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 
                                                          <xsl:for-each select="Title">  
                                                                  <xsl:element name="title">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Date">  
                                                                  <xsl:element name="date">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Subject">  
                                                                  <xsl:element name="subject">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Description">  
                                                                  <xsl:element name="description">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Format">  
                                                                  <xsl:element name="format">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Type">  
                                                                  <xsl:element name="type">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Publisher">  
                                                                  <xsl:element name="publisher">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Digital_Collection">  
                                                                  <xsl:element name="digital_collection">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Digital_Publisher">  
                                                                  <xsl:element name="digital_publisher">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Digital_Specifications">  
                                                                  <xsl:element name="digital_specifications">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Contact">  
                                                                  <xsl:element name="contact">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Repository">  
                                                                  <xsl:element name="repository">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Repository_Collection">  
                                                                  <xsl:element name="repository_collection">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Language">  
                                                                  <xsl:element name="language">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          
                                                          <xsl:for-each select="Identifier">  
                                                                  <xsl:element name="identifier">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                         

                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        
                                        
                                        <foxml:datastream ID="contentdmMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="contentdmMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 
                                                          <xsl:for-each select="Item_URL">  
                                                                  <xsl:element name="item_url">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                          <xsl:for-each select="OCLC_number">  
                                                                  <xsl:element name="oclc_number">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                          <xsl:for-each select="Date_created">  
                                                                  <xsl:element name="date_created">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                          <xsl:for-each select="Date_modified">  
                                                                  <xsl:element name="date_modified">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                          <xsl:for-each select="CONTENTdm_number">  
                                                                  <xsl:element name="contentdm_number">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                          <xsl:for-each select="CONTENTdm_file_name">  
                                                                  <xsl:element name="contentdm_file_name">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                          <xsl:for-each select="CONTENTdm_file_path">  
                                                                  <xsl:element name="contentdm_file_path">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          
                                                
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>

                                </xsl:element>
                        </exsl:document>
                </xsl:for-each>

        </xsl:template>
</xsl:stylesheet>
