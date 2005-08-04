package org.flymine.dataconversion;

/*
 * Copyright (C) 2002-2005 FlyMine
 *
 * This code may be freely distributed and modified under the
 * terms of the GNU Lesser General Public Licence.  This should
 * be distributed with the code.  See the LICENSE file for more
 * information or http://www.gnu.org/copyleft/lesser.html.
 *
 */

import java.util.List;

import org.intermine.metadata.Model;
import org.intermine.xml.full.Item;

import org.flymine.io.gff3.GFF3Record;

import org.apache.tools.ant.BuildException;
/**
 * A converter/retriever for Tfbs GFF3 files.
 *
 * @author Wenyan Ji
 */

public class TfbsClusterGFF3RecordHandler extends GFF3RecordHandler
{


    /**
     * Create a new TfbsGFF3RecordHandler for the given target model.
     * @param tgtModel the model for which items will be created
     */
    public TfbsClusterGFF3RecordHandler(Model tgtModel) {
        super(tgtModel);

    }



    /**
     * @see GFF3RecordHandler#process()
     */
    public void process(GFF3Record record) throws BuildException {
        Item feature = getFeature();

        if (record.getAttributes().get("type") != null) {
            String type = (String) ((List) record.getAttributes().get("type")).get(0);
            feature.setAttribute("type", type);
        }

        if (record.getAttributes().get("sequence") != null) {
            Item sequence = createItem("Sequence");
            String residues = (String) ((List) record.getAttributes().get("sequence")).get(0);
            sequence.setAttribute("residues", residues);
            addItem(sequence);
            feature.setReference("sequence", sequence.getIdentifier());
        }

        if (record.getAttributes().get("gene1") != null) {
            createGeneAndRelated("gene1", record, feature);

        }
        if (record.getAttributes().get("gene2") != null) {
            createGeneAndRelated("gene2", record, feature);
        }


    }


    /**
     * @param clsName
     * @return item
     */
    private Item createItem(String clsName) {
        return getItemFactory().makeItemForClass(getTargetModel().getNameSpace()
                                  + clsName);
    }

    /**
     * create geneItem, DistanceRelation item and add relevant reference/collection to feature
     * attribute name in Gff3 Attributes
     * gene attributes like gene1=(geneId using ENSGxxxx),(3'or 5' or intron),distance
     * @param gene: attributes name, either gene1 or gene2
     * @param record: Gff3Record
     * @param feature
     * @throws BuildException if gene is not in right format
     */


    private void createGeneAndRelated(String gene, GFF3Record record, Item feature)
        throws BuildException {
        List genes = (List) record.getAttributes().get(gene);
        if (genes.size() != 3) {
            throw new BuildException
                ("gene attributes not in right format. please check the gff3 file");
        } else {
            Item geneItem = createItem("Gene");
            geneItem.setAttribute("organismDbId", (String) genes.get(0));
            Item distanceRelation = createItem("DistanceRelation");
            distanceRelation.setAttribute("type", (String) genes.get(1));
            distanceRelation.setAttribute("distance", (String) genes.get(2));
            distanceRelation.setReference("object", feature.getIdentifier());
            distanceRelation.setReference("subject", geneItem.getIdentifier());
            feature.addToCollection("geneDistances", distanceRelation.getIdentifier());
            addItem(geneItem);
            addItem(distanceRelation);
        }
    }

}
