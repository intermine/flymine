<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="im" %>

<TABLE>
  <TR>
    <TD valign="top">
<div class="heading2">
Current Data
</div>
<div class="body">
<p>
  Phenotypes resulting from the following RNAi experiments have been loaded:
</p>
<p>
  <B><I>C. elegans:</I></B>
</p>
<DL>
<DT>
Kamath et al (2003) Nature 421 231-237 (<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=12529635">PubMed: 12529635</A>).
</DT>
<DD>
Systematic functional analysis of the caenorhabditis elegans genome using RNAi.
</DD>
<DT>
Fraser et al (2000) Nature 408 325-330 (<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=11099033">PubMed: 11099033</A>).
</DT>
<DD>
Functional genomic analysis of C. elegans chromosome 1 by systematic RNA interference.
</DD>
<DT>
Simmer et al (2003) Plos Biology 1 77-84  (<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=14551910">PubMed: 14551910</A>).
</DT>
<DD>
Genome-wide RNAi of C. elegans using the hypersensitive rrf-3 strain reveals novel gene functions.
</DD>
</DL>
</div>
    <TD width="30%" valign="top">
      <div class="heading2">
        Datasets
      </div>
      <div class="body">
        
        <ul>
          <li>
            <im:querylink text="All <i>C. elegans</i> RNAi phenotype data (browse)" skipBuilder="true">
<query name="" model="genomic" view="Gene Gene.phenotypes">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
</query>
            </im:querylink>
          </li>
          <li>
            <im:querylink text="All <i>C. elegans</i> RNAi phenotype data (export)" skipBuilder="true">
<query name="" model="genomic" view="Gene.identifier Gene.organismDbId Gene.symbol Gene.phenotypes.name Gene.phenotypes.RNAiCode Gene.phenotypes.identifier">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
</query>
            </im:querylink>
          </li>
          <li>
            <im:querylink text="Kamath et al, 2003 (browse)" skipBuilder="true">
<query name="" model="genomic" view="Gene Gene.annotations.property">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
  <node path="Gene.annotations" type="Annotation">
  </node>
  <node path="Gene.annotations.evidence" type="ExperimentalResult">
  </node>
  <node path="Gene.annotations.evidence.analysis" type="Analysis">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication" type="Publication">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication.pubMedId" type="String">
    <constraint op="=" value="12529635">
    </constraint>
  </node>
  <node path="Gene.annotations.property" type="Phenotype">
  </node>
</query>        
            </im:querylink>
          </li>
          <li>
            <im:querylink text="Kamath et al, 2003 (export)" skipBuilder="true">
        <query name="" model="genomic" view="Gene.identifier Gene.organismDbId Gene.symbol Gene.annotations.property.name Gene.annotations.property.RNAiCode Gene.annotations.property.identifier">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
  <node path="Gene.annotations" type="Annotation">
  </node>
  <node path="Gene.annotations.evidence" type="ExperimentalResult">
  </node>
  <node path="Gene.annotations.evidence.analysis" type="Analysis">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication" type="Publication">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication.pubMedId" type="String">
    <constraint op="=" value="12529635">
    </constraint>
  </node>
  <node path="Gene.annotations.property" type="Phenotype">
  </node>
</query>
            </im:querylink>
          </li>
          <li>
            <im:querylink text="Fraser et al, 2000 (browse)" skipBuilder="true">
        <query name="" model="genomic" view="Gene Gene.annotations.property">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
  <node path="Gene.annotations" type="Annotation">
  </node>
  <node path="Gene.annotations.evidence" type="ExperimentalResult">
  </node>
  <node path="Gene.annotations.evidence.analysis" type="Analysis">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication" type="Publication">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication.pubMedId" type="String">
    <constraint op="=" value="11099033">
    </constraint>
  </node>
  <node path="Gene.annotations.property" type="Phenotype">
  </node>
</query>
            </im:querylink>
          </li>
          <li>
            <im:querylink text="Fraser et al, 2000 (export)" skipBuilder="true">
<query name="" model="genomic" view="Gene.identifier Gene.organismDbId Gene.symbol Gene.annotations.property.name Gene.annotations.property.RNAiCode Gene.annotations.property.identifier">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
  <node path="Gene.annotations" type="Annotation">
  </node>
  <node path="Gene.annotations.evidence" type="ExperimentalResult">
  </node>
  <node path="Gene.annotations.evidence.analysis" type="Analysis">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication" type="Publication">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication.pubMedId" type="String">
    <constraint op="=" value="11099033">
    </constraint>
  </node>
  <node path="Gene.annotations.property" type="Phenotype">
  </node>
</query>        
            </im:querylink>
          </li>
          <li>
            <im:querylink text="Simmer et al, 2003 (browse)" skipBuilder="true">
<query name="" model="genomic" view="Gene Gene.annotations.property">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
  <node path="Gene.annotations" type="Annotation">
  </node>
  <node path="Gene.annotations.evidence" type="ExperimentalResult">
  </node>
  <node path="Gene.annotations.evidence.analysis" type="Analysis">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication" type="Publication">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication.pubMedId" type="String">
    <constraint op="=" value="14551910">
    </constraint>
  </node>
  <node path="Gene.annotations.property" type="Phenotype">
  </node>
</query>        
            </im:querylink>
          </li>
          <li>
            <im:querylink text="Simmer et al, 2003 (export)" skipBuilder="true">
<query name="" model="genomic" view="Gene.identifier Gene.organismDbId Gene.symbol Gene.annotations.property.name Gene.annotations.property.RNAiCode Gene.annotations.property.identifier">
  <node path="Gene" type="Gene">
  </node>
  <node path="Gene.organism" type="Organism">
  </node>
  <node path="Gene.organism.shortName" type="String">
    <constraint op="=" value="C. elegans">
    </constraint>
  </node>
  <node path="Gene.annotations" type="Annotation">
  </node>
  <node path="Gene.annotations.evidence" type="ExperimentalResult">
  </node>
  <node path="Gene.annotations.evidence.analysis" type="Analysis">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication" type="Publication">
  </node>
  <node path="Gene.annotations.evidence.analysis.publication.pubMedId" type="String">
    <constraint op="=" value="14551910">
    </constraint>
  </node>
  <node path="Gene.annotations.property" type="Phenotype">
  </node>
</query>        
            </im:querylink>
          </li>
        </ul>
      </div>
    </TD>
  </TR>
</TABLE>