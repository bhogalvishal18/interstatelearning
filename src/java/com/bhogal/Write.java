/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bhogal;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 *
 * @author Vishal
 */
public class Write {
    
public String Treedata(String tree)
{
    
    String result="var margin = {\n" +
"    top: 20,\n" +
"    right: 120,\n" +
"    bottom: 20,\n" +
"    left: 120\n" +
"},\n" +
"width = 960 - margin.right - margin.left,\n" +
"height = 800 - margin.top - margin.bottom;\n" +
"\n" +
"var root ="+tree+"\n"+
"var i = 0,\n" +
"    duration = 750,\n" +
"    rectW = 60,\n" +
"    rectH = 30;\n" +
"\n" +
"var tree = d3.layout.tree().nodeSize([70, 40]);\n" +
"var diagonal = d3.svg.diagonal()\n" +
"    .projection(function (d) {\n" +
"    return [d.x + rectW / 2, d.y + rectH / 2];\n" +
"});\n" +
"\n" +
"var svg = d3.select(\"#body\").append(\"svg\").attr(\"width\", 1000).attr(\"height\", 1000)\n" +
"    .call(zm = d3.behavior.zoom().scaleExtent([1,3]).on(\"zoom\", redraw)).append(\"g\")\n" +
"    .attr(\"transform\", \"translate(\" + 350 + \",\" + 20 + \")\");\n" +
"\n" +
"//necessary so that zoom knows where to zoom and unzoom from\n" +
"zm.translate([350, 20]);\n" +
"\n" +
"root.x0 = 0;\n" +
"root.y0 = height / 2;\n" +
"\n" +
"function collapse(d) {\n" +
"    if (d.children) {\n" +
"        d._children = d.children;\n" +
"        d._children.forEach(collapse);\n" +
"        d.children = null;\n" +
"    }\n" +
"}\n" +
"\n" +
"root.children.forEach(collapse);\n" +
"update(root);\n" +
"\n" +
"d3.select(\"#body\").style(\"height\", \"800px\");\n" +
"\n" +
"function update(source) {\n" +
"\n" +
"    // Compute the new tree layout.\n" +
"    var nodes = tree.nodes(root).reverse(),\n" +
"        links = tree.links(nodes);\n" +
"\n" +
"    // Normalize for fixed-depth.\n" +
"    nodes.forEach(function (d) {\n" +
"        d.y = d.depth * 180;\n" +
"    });\n" +
"\n" +
"    // Update the nodes…\n" +
"    var node = svg.selectAll(\"g.node\")\n" +
"        .data(nodes, function (d) {\n" +
"        return d.id || (d.id = ++i);\n" +
"    });\n" +
"\n" +
"    // Enter any new nodes at the parent's previous position.\n" +
"    var nodeEnter = node.enter().append(\"g\")\n" +
"        .attr(\"class\", \"node\")\n" +
"        .attr(\"transform\", function (d) {\n" +
"        return \"translate(\" + source.x0 + \",\" + source.y0 + \")\";\n" +
"    })\n" +
"        .on(\"click\", click);\n" +
"\n" +
"    nodeEnter.append(\"rect\")\n" +
"        .attr(\"width\", rectW)\n" +
"        .attr(\"height\", rectH)\n" +
"        .attr(\"stroke\", \"black\")\n" +
"        .attr(\"stroke-width\", 1)\n" +
"        .style(\"fill\", function (d) {\n" +
"        return d._children ? \"lightsteelblue\" : \"#fff\";\n" +
"    });\n" +
"\n" +
"    nodeEnter.append(\"text\")\n" +
"        .attr(\"x\", rectW / 2)\n" +
"        .attr(\"y\", rectH / 2)\n" +
"        .attr(\"dy\", \".35em\")\n" +
"        .attr(\"text-anchor\", \"middle\")\n" +
"        .text(function (d) {\n" +
"        return d.name;\n" +
"    });\n" +
"\n" +
"    // Transition nodes to their new position.\n" +
"    var nodeUpdate = node.transition()\n" +
"        .duration(duration)\n" +
"        .attr(\"transform\", function (d) {\n" +
"        return \"translate(\" + d.x + \",\" + d.y + \")\";\n" +
"    });\n" +
"\n" +
"    nodeUpdate.select(\"rect\")\n" +
"        .attr(\"width\", rectW)\n" +
"        .attr(\"height\", rectH)\n" +
"        .attr(\"stroke\", \"black\")\n" +
"        .attr(\"stroke-width\", 1)\n" +
"        .style(\"fill\", function (d) {\n" +
"        return d._children ? \"lightsteelblue\" : \"#fff\";\n" +
"    });\n" +
"\n" +
"    nodeUpdate.select(\"text\")\n" +
"        .style(\"fill-opacity\", 1);\n" +
"\n" +
"    // Transition exiting nodes to the parent's new position.\n" +
"    var nodeExit = node.exit().transition()\n" +
"        .duration(duration)\n" +
"        .attr(\"transform\", function (d) {\n" +
"        return \"translate(\" + source.x + \",\" + source.y + \")\";\n" +
"    })\n" +
"        .remove();\n" +
"\n" +
"    nodeExit.select(\"rect\")\n" +
"        .attr(\"width\", rectW)\n" +
"        .attr(\"height\", rectH)\n" +
"    //.attr(\"width\", bbox.getBBox().width)\"\"\n" +
"    //.attr(\"height\", bbox.getBBox().height)\n" +
"    .attr(\"stroke\", \"black\")\n" +
"        .attr(\"stroke-width\", 1);\n" +
"\n" +
"    nodeExit.select(\"text\");\n" +
"\n" +
"    // Update the links…\n" +
"    var link = svg.selectAll(\"path.link\")\n" +
"        .data(links, function (d) {\n" +
"        return d.target.id;\n" +
"    });\n" +
"\n" +
"    // Enter any new links at the parent's previous position.\n" +
"    link.enter().insert(\"path\", \"g\")\n" +
"        .attr(\"class\", \"link\")\n" +
"        .attr(\"x\", rectW / 2)\n" +
"        .attr(\"y\", rectH / 2)\n" +
"        .attr(\"d\", function (d) {\n" +
"        var o = {\n" +
"            x: source.x0,\n" +
"            y: source.y0\n" +
"        };\n" +
"        return diagonal({\n" +
"            source: o,\n" +
"            target: o\n" +
"        });\n" +
"    });\n" +
"\n" +
"    // Transition links to their new position.\n" +
"    link.transition()\n" +
"        .duration(duration)\n" +
"        .attr(\"d\", diagonal);\n" +
"\n" +
"    // Transition exiting nodes to the parent's new position.\n" +
"    link.exit().transition()\n" +
"        .duration(duration)\n" +
"        .attr(\"d\", function (d) {\n" +
"        var o = {\n" +
"            x: source.x,\n" +
"            y: source.y\n" +
"        };\n" +
"        return diagonal({\n" +
"            source: o,\n" +
"            target: o\n" +
"        });\n" +
"    })\n" +
"        .remove();\n" +
"\n" +
"    // Stash the old positions for transition.\n" +
"    nodes.forEach(function (d) {\n" +
"        d.x0 = d.x;\n" +
"        d.y0 = d.y;\n" +
"    });\n" +
"}\n" +
"\n" +
"// Toggle children on click.\n" +
"function click(d) {\n" +
"    if (d.children) {\n" +
"        d._children = d.children;\n" +
"        d.children = null;\n" +
"    } else {\n" +
"        d.children = d._children;\n" +
"        d._children = null;\n" +
"    }\n" +
"    update(d);\n" +
"}\n" +
"\n" +
"//Redraw for zoom\n" +
"function redraw() {\n" +
"  //console.log(\"here\", d3.event.translate, d3.event.scale);\n" +
"  svg.attr(\"transform\",\n" +
"      \"translate(\" + d3.event.translate + \")\"\n" +
"      + \" scale(\" + d3.event.scale + \")\");\n" +
"}";
    
    
    
    
    return result;
}
    
}
