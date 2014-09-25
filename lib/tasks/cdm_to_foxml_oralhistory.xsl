<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:foxml="info:fedora/fedora-system:def/foxml#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:exsl="http://exslt.org/common" xmlns:ex="http://exslt.org/dates-and-times" extension-element-prefixes="exsl ex">
  <xsl:variable name="collection">
    <xsl:value-of select="metadata/manifest/contentdm_collection_id" />
  </xsl:variable>
  <xsl:variable name="foxml_dir">
    <xsl:value-of select="metadata/manifest/foxml_dir" />
  </xsl:variable>
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="metadata/record">
    <xsl:copy>
      <xsl:variable name="current_time">
        <xsl:value-of select="ex:date-time()"/>
      </xsl:variable>
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
      <xsl:variable name="rdfAbout">
        <xsl:value-of select="concat('info:fedora/', $pid)" />
      </xsl:variable>
      <xsl:variable name="rdfResource">
        <xsl:value-of select="concat('info:fedora/afmodel:', Type)" />
      </xsl:variable>
      <exsl:document method="xml" href="{$foxml_dir}/{$cdmfile}.xml">
        <xsl:element name="foxml:digitalObject" xmlns:foxml="info:fedora/fedora-system:def/foxml#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <xsl:attribute name="VERSION"><xsl:value-of select="1.1"/></xsl:attribute>
        <xsl:attribute name="PID"><xsl:value-of select="$pid"/></xsl:attribute>
        <xsl:attribute name="xsi:schemaLocation">info:fedora/fedora-system:def/foxml# http://www.fedora.info/definitions/1/0/foxml1-1.xsd</xsl:attribute>
        <foxml:objectProperties>
          <foxml:property NAME="info:fedora/fedora-system:def/model#state" VALUE="Active"/>
          <foxml:property NAME="info:fedora/fedora-system:def/model#label" VALUE="FOXML Reference Example"/>
          <foxml:property NAME="info:fedora/fedora-system:def/model#ownerId" VALUE=""/>
          <foxml:property NAME="info:fedora/fedora-system:def/model#createdDate" VALUE="{$current_time}"/>
          <foxml:property NAME="info:fedora/fedora-system:def/view#lastModifiedDate" VALUE=""/>
        </foxml:objectProperties>                                        
        <foxml:datastream ID="RELS-EXT" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="RELS-EXT.0" LABEL="Fedora Object-to-Object Relationship Metadata" MIMETYPE="application/rdf+xml" >
            <foxml:xmlContent>
              <rdf:RDF xmlns:ns0="info:fedora/fedora-system:def/model#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
              <xsl:element name="rdf:Description">
              <xsl:attribute name="rdf:about"><xsl:value-of select="$rdfAbout"/></xsl:attribute>
              <xsl:element name="ns0:hasModel">
              <xsl:attribute name="rdf:resource"><xsl:value-of select="$rdfResource"/></xsl:attribute>
              </xsl:element>
              </xsl:element>
              </rdf:RDF>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="objectMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="objectMetadata.0" LABEL="Object metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <xsl:apply-templates select="Title"/>
                <xsl:apply-templates select="Date"/>
                <xsl:apply-templates select="Contact"/>
                <xsl:apply-templates select="Digital_Publisher"/>
                <xsl:apply-templates select="Repository"/>
                <xsl:apply-templates select="Format"/>
                <xsl:apply-templates select="Type"/>
                <xsl:apply-templates select="Language"/>
                <xsl:apply-templates select="Subject"/>
                <xsl:apply-templates select="Digital_Collection"/>
                <doi />
                <permanent_url />
                <xsl:apply-templates select="Master_Identifier"/>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>                                        
        <foxml:datastream ID="contentdmMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="contentdmMetadata.0" LABEL="ContentDM metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <item_url><xsl:apply-templates select="Item_URL"/></item_url>
                <oclc_number><xsl:apply-templates select="OCLC_number"/></oclc_number>
                <date_created><xsl:apply-templates select="Date_created"/></date_created>
                <date_modified><xsl:apply-templates select="Date_modified"/></date_modified>
                <contentdm_number><xsl:apply-templates select="CONTENTdm_number"/></contentdm_number>
                <contentdm_file_name><xsl:apply-templates select="CONTENTdm_file_name"/></contentdm_file_name>
                <contentdm_file_path><xsl:apply-templates select="CONTENTdm_file_path"/></contentdm_file_path>
                <contentdm_collection_id><xsl:value-of select="$collection"/></contentdm_collection_id>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="creationMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="creationMetadata.0" LABEL="creation metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <created><xsl:apply-templates select="Created"/></created>
                <condition_note><xsl:apply-templates select="Condition_Note"/></condition_note>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="digitalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="digitalMetadata.0" LABEL="digital metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <digital_specifications><xsl:apply-templates select="Digital_Specifications"/></digital_specifications>
                <original_recording_specifications><xsl:apply-templates select="Original_Recording_Specifications"/></original_recording_specifications>
                <transcript_filename><xsl:apply-templates select="Transcript_Filename"/></transcript_filename>
                <audio_filename><xsl:apply-templates select="Audio_Filename"/></audio_filename>
                <photograph_filename><xsl:apply-templates select="Photograph_Filename"/></photograph_filename>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="geographicMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="geographicMetadata.0" LABEL="geographic metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <xsl:apply-templates select="Geographic_Subject"/>
                <xsl:apply-templates select="Organization_Building"/>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="notationsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="notationsMetadata.0" LABEL="notations metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <notes><xsl:apply-templates select="Notes"/></notes>
                <xsl:apply-templates select="Personal_Names"/>
                <biographical_history_note><xsl:apply-templates select="Biographical_History_Note"/></biographical_history_note>
                <content_summary><xsl:apply-templates select="Content_Summary"/></content_summary>
                <collection_description><xsl:apply-templates select="Collection_Description"/></collection_description>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="physicalMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="physicalMetadata.0" LABEL="physical metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <location><xsl:apply-templates select="Location"/></location>
                <physical_description><xsl:apply-templates select="Physical_Description"/></physical_description>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="rightsMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="rightsMetadata.0" LABEL="rights metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <rights><xsl:apply-templates select="Rights"/></rights>
                <click_through><xsl:apply-templates select="Click_Through"/></click_through>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="interviewContentMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="interviewContentMetadata.0" LABEL="interview content metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <transcript><xsl:apply-templates select="Transcript"/></transcript>
                <document_content><xsl:apply-templates select="Document_Content"/></document_content>
                <xsl:apply-templates select="Narrator" />
                <xsl:apply-templates select="Interviewer" />
                <ocr_note><xsl:apply-templates select="OCR_Note"/></ocr_note>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="relatedResourcesMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="relatedResourcesMetadata.0" LABEL="related resources metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <xsl:apply-templates select="Repository_Collection"/>
                <xsl:apply-templates select="Finding_Aid_Link"/>
                <xsl:apply-templates select="Finding_Aid_Title"/>
                <xsl:apply-templates select="Online_Exhibit_Link"/>
                <xsl:apply-templates select="Online_Exhibit_Title"/>
                <xsl:apply-templates select="Catalog_Record_Link"/>
                <xsl:apply-templates select="Catalog_Record_Title"/>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        <foxml:datastream ID="displayMetadata" STATE="A" CONTROL_GROUP="X" VERSIONABLE="true">
          <foxml:datastreamVersion ID="displayMetadata.0" LABEL="display metadata" MIMETYPE="text/xml">
            <foxml:xmlContent>
              <fields>
                <weight><xsl:apply-templates select="Weight"/></weight>
              </fields>
            </foxml:xmlContent>
          </foxml:datastreamVersion>
        </foxml:datastream>
        </xsl:element>
      </exsl:document>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="Title">
    <title><xsl:apply-templates /></title>
  </xsl:template>
  <xsl:template match="Date">
    <date><xsl:apply-templates /></date>
  </xsl:template>
  <xsl:template match="Contact">
    <contact><xsl:apply-templates /></contact>
  </xsl:template>
  <xsl:template match="Digital_Publisher">
    <digital_publisher><xsl:apply-templates /></digital_publisher>
  </xsl:template>
  <xsl:template match="Repository">
    <repository><xsl:apply-templates /></repository>
  </xsl:template>
  <xsl:template match="Format">
    <format><xsl:apply-templates /></format>
  </xsl:template>
  <xsl:template match="Type">
    <type><xsl:apply-templates /></type>
  </xsl:template>
  <xsl:template match="Language">
    <language><xsl:apply-templates /></language>
  </xsl:template>
  <xsl:template match="Subject">
    <subject><xsl:apply-templates /></subject>
  </xsl:template>
  <xsl:template match="Digital_Collection">
    <digital_collection><xsl:apply-templates /></digital_collection>
  </xsl:template>
  <xsl:template match="Master_Identifier">
    <master_identifier><xsl:apply-templates /></master_identifier>
  </xsl:template>
  <xsl:template match="Narrator">
    <narrator><xsl:apply-templates /></narrator>
  </xsl:template>
  <xsl:template match="Repository_Collection">
    <repository_collection><xsl:apply-templates /></repository_collection>
  </xsl:template>
  <xsl:template match="Finding_Aid_Link">
    <finding_aid_link><xsl:apply-templates /></finding_aid_link>
  </xsl:template>
  <xsl:template match="Finding_Aid_Title">
    <finding_aid_title><xsl:apply-templates /></finding_aid_title>
  </xsl:template>
  <xsl:template match="Online_Exhibit_Link">
    <online_exhibit_link><xsl:apply-templates /></online_exhibit_link>
  </xsl:template>
  <xsl:template match="Online_Exhibit_Title">
    <online_exhibit_title><xsl:apply-templates /></online_exhibit_title>
  </xsl:template>
  <xsl:template match="Catalog_Record_Link">
    <catalog_record_link><xsl:apply-templates /></catalog_record_link>
  </xsl:template>
  <xsl:template match="Catalog_Record_Title">
    <catalog_record_title><xsl:apply-templates /></catalog_record_title>
  </xsl:template>
  <xsl:template match="Personal_Names">
    <personal_names><xsl:apply-templates /></personal_names>
  </xsl:template>
  <xsl:template match="Geographic_Subject">
    <geographic_subject><xsl:apply-templates /></geographic_subject>
  </xsl:template>
  <xsl:template match="Organization_Building">
    <organization_building><xsl:apply-templates /></organization_building>
  </xsl:template>
</xsl:stylesheet>
