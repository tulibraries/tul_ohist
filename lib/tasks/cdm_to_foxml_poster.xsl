<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
        xmlns:foxml="info:fedora/fedora-system:def/foxml#"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:exsl="http://exslt.org/common"
        extension-element-prefixes="exsl">
        <xsl:output method="xml" indent="yes"/>
        <xsl:template match="metadata">
        <xsl:copy>
	<xsl:variable name="collection">
	  <xsl:value-of select="manifest/contentdm_collection_id" />
	</xsl:variable>
  <xsl:variable name="foxmlDir">
    <xsl:value-of select="manifest/foxml_dir" />
  </xsl:variable>
                <xsl:for-each select="record">
                        <xsl:variable name="cdmfile">
                        
                                <xsl:value-of select="concat($collection,'x',CONTENTdm_number)"/>
                        </xsl:variable>
                        
                        <xsl:variable name="pid">
                                <xsl:value-of select="concat('poster:',$cdmfile)" />
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
                                                  <xsl:text>&#xa;</xsl:text>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#label"
                                                  VALUE="FOXML Reference Example"/>
                                                  <xsl:text>&#xa;</xsl:text>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#ownerId"
                                                  VALUE=""/>
                                                  <xsl:text>&#xa;</xsl:text>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/model#createdDate"
                                                  VALUE="2013-11-06T21:24:13.236Z"/>
                                                  <xsl:text>&#xa;</xsl:text>
                                                <foxml:property
                                                  NAME="info:fedora/fedora-system:def/view#lastModifiedDate"
                                                  VALUE="2013-11-06T21:24:13.236Z"/>
                                                  <xsl:text>&#xa;</xsl:text>
                                        </foxml:objectProperties>                                        
                                        <xsl:text>&#xa;</xsl:text>
                                        <foxml:datastream ID="objectMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                        <xsl:text>&#xa;</xsl:text>
                                          <foxml:datastreamVersion ID="objectMetadata.0" LABEL="Object metadata" MIMETYPE="text/xml">
                                          <xsl:text>&#xa;</xsl:text>
                                            <foxml:xmlContent>
                                            <xsl:text>&#xa;</xsl:text>
                                              <fields>
                                              <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Title">  
                                                                  <xsl:element name="title">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Date">  
                                                                  <xsl:element name="date">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Subject">  
                                                                  <xsl:element name="subject">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Description">  
                                                                  <xsl:element name="description">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Format">  
                                                                  <xsl:element name="format">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Type">  
                                                                  <xsl:element name="type">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Publisher">  
                                                                  <xsl:element name="publisher">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Digital_Collection">  
                                                                  <xsl:element name="digital_collection">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Digital_Publisher">  
                                                                  <xsl:element name="digital_publisher">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Digital_Specifications">  
                                                                  <xsl:element name="digital_specifications">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Contact">  
                                                                  <xsl:element name="contact">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Repository">  
                                                                  <xsl:element name="repository">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Repository_Collection">  
                                                                  <xsl:element name="repository_collection">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Language">  
                                                                  <xsl:element name="language">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Identifier">  
                                                                  <xsl:element name="identifier">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  <xsl:text>&#xa;</xsl:text>
                                                  </foxml:xmlContent>
                                                  <xsl:text>&#xa;</xsl:text>
                                                </foxml:datastreamVersion>
                                                <xsl:text>&#xa;</xsl:text>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                        
                                        <foxml:datastream ID="contentdmMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="contentdmMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Item_URL">  
                                                                  <xsl:element name="item_url">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="OCLC_number">  
                                                                  <xsl:element name="oclc_number">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Date_created">  
                                                                  <xsl:element name="date_created">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Date_modified">  
                                                                  <xsl:element name="date_modified">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="CONTENTdm_number">  
                                                                  <xsl:element name="contentdm_number">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="CONTENTdm_file_name">  
                                                                  <xsl:element name="contentdm_file_name">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="CONTENTdm_file_path">  
                                                                  <xsl:element name="contentdm_file_path">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:element name="contentdm_collection_id">
                                                              <xsl:value-of select="$collection" />
                                                          </xsl:element>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:element name="path_to_thumbnail">
                                                              <xsl:value-of select="concat('http://cdm15037.contentdm.oclc.org/utils/getthumbnail/collection/',$collection,'/id/',CONTENTdm_number)" />
                                                          </xsl:element>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:element name="reference_url">
                                                              <xsl:value-of select="concat('/catalog/',$pid)" />
                                                          </xsl:element>
                                                          <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        
                                        <foxml:datastream ID="descMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="descMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Acknowledgment">  
                                                                  <xsl:element name="acknowledgment">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Alternate_Title">  
                                                                  <xsl:element name="alternate_title">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Contributor">  
                                                                  <xsl:element name="contributor">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Corporate_Name">  
                                                                  <xsl:element name="corporate_name">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Hidden_Date">  
                                                                  <xsl:element name="hidden_date">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Series">  
                                                                  <xsl:element name="series">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Volume">  
                                                                  <xsl:element name="volume">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                        <foxml:datastream ID="geographicMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="geographicMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Geographic_Subject">  
                                                                  <xsl:element name="geographic_subject">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Organization_Building">  
                                                                  <xsl:element name="organization_building">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                        <foxml:datastream ID="physicalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="physicalMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Folder">  
                                                                  <xsl:element name="folder">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Location">  
                                                                  <xsl:element name="location">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Physical_Description">  
                                                                  <xsl:element name="physical_description">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                        <foxml:datastream ID="notationsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="notationsMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="notes">  
                                                                  <xsl:element name="notes">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="personal_names">  
                                                                  <xsl:element name="personal_names">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                        <foxml:datastream ID="digitalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="digitalMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="File_Name">  
                                                                  <xsl:element name="file_name">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Document_Content">  
                                                                  <xsl:element name="document_content">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                        <foxml:datastream ID="creationMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="creationMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Created">  
                                                                  <xsl:element name="created">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Creator">  
                                                                  <xsl:element name="creator">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                    <xsl:text>&#xa;</xsl:text>
                                </xsl:element>
                                
                        </exsl:document>
                </xsl:for-each>
</xsl:copy>
        </xsl:template>
</xsl:stylesheet>
