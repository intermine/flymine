<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="im" %>

<table width="100%">
  <tr>
    <td valign="top" rowspan="2">
      <div class="heading2">
        Current data
      </div>
      <div class="body">

 <h4>  
  <a href="javascript:toggleDiv('hiddenDiv1');">
    <img id='hiddenDiv1Toggle' src="images/undisclosed.gif"/>
      Data from the UniProt Knowledgebase (UniProtKB) ...
  </a>
 </h4>

<div id="hiddenDiv1" style="display:none;">
          <p>
            All proteins from the <a
            href="http://www.ebi.uniprot.org/index.shtml">UniProt
            Knowledgebase</a> (version 7.5) for the following organisms have
            been loaded:</p>

          <ul>             
              <li><i>D. melanogaster</i></li>
              <li><i>A. gambiae</i></li>
              <li><i>C. elegans</i></li>
          </ul>
          <p>           
            For each protein record in UniProt for each species the following
            information is extracted and loaded into FlyMine:</p>
         <ul>             
              <li>Entry name</li>
              <li>Primary accession number</li>
              <li>Secondary accession number</li>
              <li>Protein name</li>
              <li>Comments</li>
              <li>Publications</li>
              <li>Sequence</li>
              <li>Gene ORF name</li>
          </ul>     

  </div>
     
   <h4>  
    <a href="javascript:toggleDiv('hiddenDiv2');">
     <img id='hiddenDiv2Toggle' src="images/undisclosed.gif"/>
      Data from InterPro ...
    </a>
   </h4>

<div id="hiddenDiv2" style="display:none;">

          <p>
            Protein family and domain assignments to proteins in UniProt have
            been loaded from <a
            href="http://www.ebi.ac.uk/interpro">InterPro</a> (version 12.1)
            for the following organisms:</p>
          <ul> 
              <li><i>D. melanogaster</i></li>
              <li><i>A. gambiae</i></li>
              <li><i>C. elegans</i></li>
          </ul> 
</div>

<%--  // add later:
        <p>
          Search for a protein identifier: <tiles:insert name="browse.tile"/>
        </p>
--%>
      </div>
    </td>
    <td valign="top">
      <div class="heading2">
        Bulk download <i>Drosophila</i> data
      </div>
      <div class="body">
        <ul>
          <li>
            <i>D. melanogaster</i> proteins and corresponding genes:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]" skipBuilder="true">
                <query name="" model="genomic" view="Protein Protein.genes">
                  <node path="Protein" type="Protein">
                  </node>
                  <node path="Protein.organism" type="Organism">
                  </node>
                  <node path="Protein.organism.name" type="String">
                    <constraint op="=" value="Drosophila melanogaster"
                                description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="Protein.identifier Protein.name Protein.primaryAccession Protein.genes.identifier Protein.genes.chromosomeLocation.start Protein.genes.chromosomeLocation.end">
                  <node path="Protein" type="Protein">
                  </node>
                  <node path="Protein.organism" type="Organism">
                  </node>
                  <node path="Protein.organism.name" type="String">
                    <constraint op="=" value="Drosophila melanogaster" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
          <li>
            <i>D. melanogaster</i> protein domains:
            <im:querylink text="[browse]"
                          skipBuilder="true">
              <query name="" model="genomic" view="ProteinDomain">
              p  <node path="ProteinDomain" type="ProteinDomain">
                </node>
                <node path="ProteinDomain.proteins" type="Protein">
                </node>
                <node path="ProteinDomain.proteins.organism" type="Organism">
                </node>
                <node path="ProteinDomain.proteins.organism.name" type="String">
                </node>
                <node path="ProteinDomain.proteins.organism.genus" type="String">
                  <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                  </constraint>
                </node>
              </query>
            </im:querylink>
            or
            <im:querylink text="[export/download]"
                          skipBuilder="true">
              <query name="" model="genomic" view="ProteinDomain.identifier ProteinDomain.interproId ProteinDomain.name ProteinDomain.shortName">
                <node path="ProteinDomain" type="ProteinDomain">
                </node>
                <node path="ProteinDomain.proteins" type="Protein">
                </node>
                <node path="ProteinDomain.proteins.organism" type="Organism">
                </node>
                <node path="ProteinDomain.proteins.organism.name" type="String">
                </node>
                <node path="ProteinDomain.proteins.organism.genus" type="String">
                  <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                  </constraint>
                </node>
              </query>
            </im:querylink>
          </li>


          <li>
            <span style="white-space:nowrap">
              <i>D. melanogaster</i> proteins with corresponding protein domains:
              <im:querylink text="[browse]"
                            skipBuilder="true">
                <query name="" model="genomic" view="ProteinDomain.proteins ProteinDomain" constraintLogic="A and B">
                  <node path="ProteinDomain" type="ProteinDomain">
                  </node>
                  <node path="ProteinDomain.proteins" type="Protein">
                  </node>
                  <node path="ProteinDomain.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinDomain.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinDomain.proteins.organism.genus" type="String">
                    <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinDomain.proteins.name ProteinDomain.proteins.identifier ProteinDomain ProteinDomain.identifier ProteinDomain.interproId ProteinDomain.name ProteinDomain.shortName" constraintLogic="A and B">
                  <node path="ProteinDomain" type="ProteinDomain">
                  </node>
                  <node path="ProteinDomain.proteins" type="Protein">
                  </node>
                  <node path="ProteinDomain.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinDomain.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinDomain.proteins.organism.genus" type="String">
                    <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
          <li>
            <i>D. melanogaster</i> protein families:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily.identifier ProteinFamily.interproId ProteinFamily.name ProteinFamily.shortName">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
          <li>
            <i>D. melanogaster</i> proteins with corresponding protein families:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily.proteins ProteinFamily" constraintLogic="A and B">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily.proteins.name ProteinFamily.proteins.identifier ProteinFamily ProteinFamily.identifier ProteinFamily.interproId ProteinFamily.name ProteinFamily.shortName" constraintLogic="A and B">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Drosophila" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
        </ul>
      </div>
    </td>
  </tr>
  <tr>
    <td valign="top">
      <div class="heading2">
        Bulk download <i>Anopheles</i> data
      </div>
      <div class="body">
        <ul>
          <li>
            <i>A. gambiae</i> proteins and corresponding genes:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]" skipBuilder="true">
                <query name="" model="genomic" view="Protein Protein.genes">
                  <node path="Protein" type="Protein">
                  </node>
                  <node path="Protein.organism" type="Organism">
                  </node>
                  <node path="Protein.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="Protein.identifier Protein.name Protein.primaryAccession Protein.genes.identifier Protein.genes.chromosomeLocation.start Protein.genes.chromosomeLocation.end">
                  <node path="Protein" type="Protein">
                  </node>
                  <node path="Protein.organism" type="Organism">
                  </node>
                  <node path="Protein.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>

          </li>
          <li>
            <i>A. gambiae</i> protein domains:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]"
                            skipBuilder="true">
                <query name="" model="genomic" view="ProteinDomain">
                  <node path="ProteinDomain" type="ProteinDomain">
                  </node>
                  <node path="ProteinDomain.proteins" type="Protein">
                  </node>
                  <node path="ProteinDomain.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinDomain.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinDomain.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinDomain.identifier ProteinDomain.interproId ProteinDomain.name ProteinDomain.shortName">
                  <node path="ProteinDomain" type="ProteinDomain">
                  </node>
                  <node path="ProteinDomain.proteins" type="Protein">
                  </node>
                  <node path="ProteinDomain.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinDomain.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinDomain.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
          <li>
            <i>A. gambiae</i> proteins with corresponding protein domains:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinDomain.proteins ProteinDomain" constraintLogic="A and B">
                  <node path="ProteinDomain" type="ProteinDomain">
                  </node>
                  <node path="ProteinDomain.proteins" type="Protein">
                  </node>
                  <node path="ProteinDomain.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinDomain.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinDomain.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinDomain.proteins.name ProteinDomain.proteins.identifier ProteinDomain ProteinDomain.identifier ProteinDomain.interproId ProteinDomain.name ProteinDomain.shortName" constraintLogic="A and B">
                  <node path="ProteinDomain" type="ProteinDomain">
                  </node>
                  <node path="ProteinDomain.proteins" type="Protein">
                  </node>
                  <node path="ProteinDomain.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinDomain.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinDomain.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
          <li>
            <i>A. gambiae</i> protein families:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily.identifier ProteinFamily.interproId ProteinFamily.name ProteinFamily.shortName">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
          <li>
            <i>A. gambiae</i> proteins with corresponding protein families:
            <span style="white-space:nowrap">
              <im:querylink text="[browse]"
                            skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily.proteins ProteinFamily" constraintLogic="A and B">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
              or
              <im:querylink text="[export/download]" skipBuilder="true">
                <query name="" model="genomic" view="ProteinFamily.proteins.name ProteinFamily.proteins.identifier ProteinFamily ProteinFamily.identifier ProteinFamily.interproId ProteinFamily.name ProteinFamily.shortName" constraintLogic="A and B">
                  <node path="ProteinFamily" type="ProteinFamily">
                  </node>
                  <node path="ProteinFamily.proteins" type="Protein">
                  </node>
                  <node path="ProteinFamily.proteins.organism" type="Organism">
                  </node>
                  <node path="ProteinFamily.proteins.organism.name" type="String">
                  </node>
                  <node path="ProteinFamily.proteins.organism.genus" type="String">
                    <constraint op="=" value="Anopheles" description="" identifier="" code="A">
                    </constraint>
                  </node>
                </query>
              </im:querylink>
            </span>
          </li>
        </ul>
      </div>
    </td>
  </tr>
</table>