<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="XSD">
      <schema location="../ApplesOranges.xsd"/>
      <rootElement name="Orchad" namespace="http://mmikhail.com/sample/xml/Orchard"/>
    </source>
    <source type="XSD">
      <schema location="../ApplesOranges.xsd"/>
      <rootElement name="GroceryList" namespace="http://mmikhail.com/sample/xml/Orchard"/>
      <param name="OldList" />
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="../ApplesOranges.xsd"/>
      <rootElement name="GroceryList" namespace="http://mmikhail.com/sample/xml/Orchard"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.8(build 150622.2350.0222) AT [WED JUL 05 21:00:23 EDT 2017]. -->
?>
<xsl:stylesheet version="2.0"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:ns0="http://mmikhail.com/sample/xml/Orchard"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl ns0 xsd bpws xp20 mhdr bpel oraext dvm hwf med ids bpm xdk xref bpmn ora socket ldap">
  <xsl:param name="OldList"/>
  <xsl:variable name="orchd">
    <xsl:for-each select="/ns0:Orchad/*">
       <ns0:Item Name="{name()}">
            <xsl:value-of select="."/>
       </ns0:Item>        
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="groups">
    <xsl:for-each-group select="$OldList/ns0:GroceryList/ns0:Item,$orchd/ns0:Item" group-by="@Name">  
       <ns0:Item Name="{current-grouping-key()}">
        <xsl:value-of select="sum(current-group())"/>
       </ns0:Item> 
    </xsl:for-each-group>
  </xsl:variable>
  <xsl:template match="/">
    <ns0:GroceryList>
      <xsl:copy-of select="$groups"/>
   </ns0:GroceryList>   
  </xsl:template>
</xsl:stylesheet>
