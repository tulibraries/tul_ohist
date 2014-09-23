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

                        <xsl:variable name="pidPrefix">
                                <xsl:value-of select="translate(Type, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                        </xsl:variable>

                        <xsl:variable name="MID">
                                <xsl:value-of select="Master_Identifier"/>
                        </xsl:variable>

                        <xsl:variable name="pidMiddle">
                                <xsl:value-of select="concat($pidPrefix,':',$MID)" />
                        </xsl:variable>
                        
                        <xsl:variable name="pid">
                                <xsl:value-of select="concat($pidMiddle,'x',$cdmfile)" />
                        </xsl:variable>
                        <xsl:variable name="bodyTextSize">10pt</xsl:variable>
                        <xsl:variable name="rdfAbout">
                          <xsl:value-of select="concat('info:fedora/', $pid)" />
                        </xsl:variable>
                        <xsl:variable name="rdfResource">
                          <xsl:value-of select="concat('info:fedora/afmodel:', Type)" />
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
                                        <foxml:datastream ID="RELS-EXT" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="RELS-EXT.0" LABEL="Fedora Object-to-Object Relationship Metadata" MIMETYPE="application/rdf+xml" >
                                            <foxml:xmlContent>
                                              <xsl:text>&#xa;</xsl:text>
                                              <rdf:RDF xmlns:ns0="info:fedora/fedora-system:def/model#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
                                                <xsl:element name="rdf:Description">
                                                  <xsl:attribute name="rdf:about"><xsl:value-of select="$rdfAbout"/></xsl:attribute>
                                                  <xsl:element name="ns0:hasModel">
                                                    <xsl:attribute name="rdf:resource"><xsl:value-of select="$rdfResource"/></xsl:attribute>
                                                  </xsl:element>
                                                </xsl:element>
                                              </rdf:RDF>
                                              <xsl:text>&#xa;</xsl:text>
                                            </foxml:xmlContent>
                                          </foxml:datastreamVersion>
                                        </foxml:datastream>
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
                                                          <xsl:for-each select="Contact">  
                                                                  <xsl:element name="contact">  
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
                                                          <xsl:for-each select="Repository">  
                                                                  <xsl:element name="repository">  
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
                                                          <xsl:for-each select="Language">  
                                                                  <xsl:element name="language">  
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
                                                          <xsl:for-each select="Digital_Collection">  
                                                                  <xsl:element name="digital_collection">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <doi />
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <permanent_url />
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Master_Identifier">  
                                                                  <xsl:element name="master_identifier">  
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
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        
                                        <foxml:datastream ID="creationMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="creationMetadata.0" LABEL="creation metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Created">  
                                                                  <xsl:element name="created">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Condition_Note">  
                                                                  <xsl:element name="condition_note">  
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
                                          <foxml:datastreamVersion ID="digitalMetadata.0" LABEL="digital metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Digital_Specifications">  
                                                                  <xsl:element name="digital_specifications">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Original_Recording_Specifications">  
                                                                  <xsl:element name="original_recording_specifications">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Transcript_Filename">  
                                                                  <xsl:element name="transcript_filename">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Audio_Filename">  
                                                                  <xsl:element name="audio_filename">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Photograph_Filename">  
                                                                  <xsl:element name="photograph_filename">  
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
                                          <foxml:datastreamVersion ID="geographicMetadata.0" LABEL="geographic metadata" MIMETYPE="text/xml">
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

                                        <foxml:datastream ID="notationsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="notationsMetadata.0" LABEL="notations metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Notes">  
                                                                  <xsl:element name="notes">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Personal_Names">  
                                                                  <xsl:element name="personal_names">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Biographical_History_Note">  
                                                                  <xsl:element name="biographical_history_note">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Content_Summary">  
                                                                  <xsl:element name="content_summary">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Collection_Description">  
                                                                  <xsl:element name="collection_description">  
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
                                          <foxml:datastreamVersion ID="physicalMetadata.0" LABEL="physical metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
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

                                        <foxml:datastream ID="rightsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="rightsMetadata.0" LABEL="rights metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Rights">  
                                                                  <xsl:element name="rights">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Click_Through">  
                                                                  <xsl:element name="click_through">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>

                                        <foxml:datastream ID="interviewContentMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="interviewContentMetadata.0" LABEL="interview content metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Transcript">  
                                                                  <xsl:element name="transcript">  
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
                                                          <xsl:for-each select="Narrator">  
                                                                  <xsl:element name="narrator">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Interviewer">  
                                                                  <xsl:element name="interviewer">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="OCR_Note">  
                                                                  <xsl:element name="ocr_note">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>

                                        <foxml:datastream ID="relatedResourcesMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="relatedResourcesMetadata.0" LABEL="related resources metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Repository_Collection">  
                                                                  <xsl:element name="repository_collection">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Finding_Aid_Link">  
                                                                  <xsl:element name="finding_aid_link">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Finding_Aid_Title">  
                                                                  <xsl:element name="finding_aid_title">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Online_Exhibit_Link">  
                                                                  <xsl:element name="online_exhibit_link">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Online_Exhibit_Title">  
                                                                  <xsl:element name="online_exhibit_title">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Catalog_Record_Link">  
                                                                  <xsl:element name="catalog_record_link">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Catalog_Record_Title">  
                                                                  <xsl:element name="catalog_record_title">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each> 
                                                          <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>

                                        <foxml:datastream ID="displayMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
                                          <foxml:datastreamVersion ID="displayMetadata.0" LABEL="display metadata" MIMETYPE="text/xml">
                                            <foxml:xmlContent>
                                              <fields>
                                                 <xsl:text>&#xa;</xsl:text>
                                                          <xsl:for-each select="Weight">  
                                                                  <xsl:element name="weight">  
                                                                          <xsl:value-of select="." />  
                                                                  </xsl:element>
                                                          </xsl:for-each>
                                                          <xsl:text>&#xa;</xsl:text>
                                                  </fields>
                                                  </foxml:xmlContent>
                                                </foxml:datastreamVersion>
                                        </foxml:datastream>
                                        <xsl:text>&#xa;</xsl:text>
                                    <xsl:text>&#xa;</xsl:text>
                                </xsl:element>
                                
                        </exsl:document>
                </xsl:for-each>
</xsl:copy>
        </xsl:template>
</xsl:stylesheet>
