<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:setBundle basename="model"/>

<!-- publication.jsp -->
<fmt:message key="publication.pubmed"/>:
<div style="margin-left: 20px">
  <html:link href="${WEB_PROPERTIES['pubmed.url.prefix']}${object.pubMedId}">
    <span>
      <html:img src="model/PubMed_logo_small.png"/>
    </span>
    <span>
      PMID:${object.pubMedId}
    </span>
  </html:link>
</div>
<!-- /publication.jsp -->