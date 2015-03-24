/**
 * @author Dimitry Kudrayvtsev
 * @version 2.0
 */

d3.gantt = function() {
    var FIT_TIME_DOMAIN_MODE = "fit";
    var FIXED_TIME_DOMAIN_MODE = "fixed";
    
    var margin = {
        top : 20,
        right : 0,
        bottom : 20,
        left : 100
    };
    var timeDomainStart = d3.time.day.offset(new Date(),-3);
    var timeDomainEnd = d3.time.hour.offset(new Date(),+3);
    var timeDomainMode = FIT_TIME_DOMAIN_MODE;// fixed or fit
    var taskTypes = [];
    var taskStatus = [];
    var height = document.body.clientHeight - margin.top - margin.bottom-5;
    var width = document.body.clientWidth - margin.right - margin.left-5;

    var tickFormat = "%H:%M";

    var keyFunction = function(d) {
	    return d.startDate + d.taskName + d.endDate;
    };

    var rectTransform = function(d) {
	    return "translate(" + x(d.startDate) + "," + y(d.taskName) + ")";
    };

    var initTimeDomain = function() {
        if (timeDomainMode === FIT_TIME_DOMAIN_MODE) {
            if (tasks === undefined || tasks.length < 1) {
            timeDomainStart = d3.time.day.offset(new Date(), -3);
            timeDomainEnd = d3.time.hour.offset(new Date(), +3);
            return;
            }
            tasks.sort(function(a, b) {
            return a.endDate - b.endDate;
            });
            timeDomainEnd = tasks[tasks.length - 1].endDate;
            tasks.sort(function(a, b) {
            return a.startDate - b.startDate;
            });
            timeDomainStart = tasks[0].startDate;
        }
    };
    var x, y, xAxis, yAxis;
    var initAxis = function() {
        x = d3.time
            .scale()
            .domain([ timeDomainStart, timeDomainEnd ])
            .range([ 0, width ])
            .clamp(true);

        y = d3.scale
            .ordinal()
            .domain(taskTypes)
            .rangeRoundBands([ 0, height - margin.top - margin.bottom ], .1, .3);

        xAxis = d3.svg
            .axis()
            .scale(x)
            .orient("bottom")
            .tickFormat(d3.time.format(tickFormat))
            .tickSubdivide(true)
            .tickSize(8).tickPadding(8);

        yAxis = d3.svg
            .axis()
            .scale(y)
            .orient("left")
            .ticks(8, "%");
            //.tickSize(0);
    };
    initAxis();
    
    function gantt(tasks) {
	
        initTimeDomain();
        initAxis();

        //var svg = d3.select("body")
        var svg = d3.select("#gant")
            .append("svg")
            .attr("class", "chart")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("class", "gantt-chart")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .attr("transform", "translate(" + margin.left + ", " + margin.top + ")");
	
        svg.selectAll(".chart")
            .data(tasks, keyFunction).enter()
            .append("rect")
            .attr("rx", 5)
            .attr("ry", 5)
            .attr("data-title", function(d){
                return d.title;
            })
            .attr("class", function(d){
             if(taskStatus[d.status] == null){ return "bar";}
                 return taskStatus[d.status] + " task";
            })
            .attr("y", 0)
            .attr("transform", rectTransform)
            .attr("height", function(d) { return y.rangeBand(); })
            .attr("width", function(d) {
                 return (x(d.endDate) - x(d.startDate));
            });

            svg.selectAll(".task")
//        svg
//            .append("text")
//            .classed('chart', true)
//            //.attr("y", function(d) { return (y(d.y1) + y(d.y0)) / 2; }) // Center text
//            .attr("y", 0)
//            .attr("fill","#fff")
//            .style("stroke-width", 1)
//            .style({"font-size":"18px","z-index":"999999999"})
//            .style("text-anchor", "middle")
//            .text(function(d) {
//                return d.name;
//            });
	 
        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0, " + (height - margin.top - margin.bottom) + ")")
            .transition()
            .call(xAxis);

        svg.append("g")
            .attr("class", "y axis")
            //.attr("transform", "translate(" + (margin.left) + ", 0)")
            .transition()
            .call(yAxis)
            .selectAll(".tick text")
            .call(d3TextWrap, margin.left);

        return gantt;
    }
    
    gantt.redraw = function(tasks) {

        initTimeDomain();
        initAxis();

        var svg = d3.select("svg");

        var ganttChartGroup = svg.select(".gantt-chart");
        var rect = ganttChartGroup.selectAll("rect").data(tasks, keyFunction);

        rect.enter()
            .insert("rect",":first-child")
            .attr("rx", 5)
            .attr("ry", 5)
            .attr("class", function(d){
                if(taskStatus[d.status] == null){ return "bar";}
                return taskStatus[d.status];
            })
            .transition()
            .attr("y", 0)
            .attr("transform", rectTransform)
            .attr("height", function(d) { return y.rangeBand(); })
            .attr("width", function(d) {
                return (x(d.endDate) - x(d.startDate));
            });

        rect.transition()
            .attr("transform", rectTransform)
            .attr("height", function(d) { return y.rangeBand(); })
            .attr("width", function(d) {
                return (x(d.endDate) - x(d.startDate));
            });

        rect.exit().remove();

        svg.select(".x").transition().call(xAxis);
        svg.select(".y").transition().call(yAxis);

        return gantt;
    };

    function d3TextWrap(text, width, paddingRightLeft, paddingTopBottom) {
        paddingRightLeft = paddingRightLeft || 5; //Default padding (5px)
        paddingTopBottom = (paddingTopBottom || 5) - 2; //Default padding (5px), remove 2 pixels because of the borders
        var maxWidth = width; //I store the tooltip max width
        width = width - (paddingRightLeft * 2); //Take the padding into account

        var arrLineCreatedCount = [];
        text.each(function() {
            var text = d3.select(this),
                words = text.text().split(/[ \f\n\r\t\v]+/).reverse(), //Don't cut non-breaking space (\xA0), as well as the Unicode characters \u00A0 \u2028 \u2029)
                word,
                line = [],
                lineNumber = 0,
                lineHeight = 1.1, //Ems
                x,
                y = text.attr("y"),
                dy = parseFloat(text.attr("dy")),
                createdLineCount = 1, //Total line created count
                textAlign = text.style('text-anchor') || 'start'; //'start' by default (start, middle, end, inherit)

            //Clean the data in case <text> does not define those values
            if (isNaN(dy)) dy = 0; //Default padding (0em) : the 'dy' attribute on the first <tspan> _must_ be identical to the 'dy' specified on the <text> element, or start at '0em' if undefined

            //Offset the text position based on the text-anchor
            var wrapTickLabels = d3.select(text.node().parentNode).classed('tick'); //Don't wrap the 'normal untranslated' <text> element and the translated <g class='tick'><text></text></g> elements the same way..
            if (wrapTickLabels) {
                switch (textAlign) {
                    case 'start':
                        x = -width / 2;
                        break;
                    case 'middle':
                        x = 0;
                        break;
                    case 'end':
                        x = width / 2;
                        break;
                    default :
                }
            }
            else { //untranslated <text> elements
                switch (textAlign) {
                    case 'start':
                        x = paddingRightLeft;
                        break;
                    case 'middle':
                        x = maxWidth / 2;
                        break;
                    case 'end':
                        x = maxWidth - paddingRightLeft;
                        break;
                    default :
                }
            }
            y = +((null === y) ? paddingTopBottom : y);

            var tspan = text.text(null).append("tspan").attr("x", x).attr("y", y).attr("dy", dy + "em");
            //noinspection JSHint
            while (word = words.pop()) {
                line.push(word);
                tspan.text(line.join(" "));
                if (tspan.node().getComputedTextLength() > width/3 && line.length > 1) {
                    line.pop();
                    tspan.text(line.join(" "));
                    line = [word];
                    tspan = text.append("tspan").attr("x", x).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
                    ++createdLineCount;
                }
            }

            arrLineCreatedCount.push(createdLineCount); //Store the line count in the array
        });
        return arrLineCreatedCount;
    }

    gantt.margin = function(value) {
        if (!arguments.length)
            return margin;
        margin = value;
        return gantt;
    };

    gantt.timeDomain = function(value) {
        if (!arguments.length)
            return [ timeDomainStart, timeDomainEnd ];
        timeDomainStart = +value[0], timeDomainEnd = +value[1];
        return gantt;
    };

    /**
     * @param {string}
     *                vale The value can be "fit" - the domain fits the data or
     *                "fixed" - fixed domain.
     */
    gantt.timeDomainMode = function(value) {
        if (!arguments.length)
            return timeDomainMode;
        timeDomainMode = value;
        return gantt;
    };

    gantt.taskTypes = function(value) {
        if (!arguments.length)
            return taskTypes;
        taskTypes = value;
        return gantt;
    };

    gantt.taskStatus = function(value) {
        if (!arguments.length)
            return taskStatus;
        taskStatus = value;
        return gantt;
    };

    gantt.width = function(value) {
        if (!arguments.length)
            return width;
        width = +value;
        return gantt;
    };

    gantt.height = function(value) {
        if (!arguments.length)
            return height;
        height = +value;
        return gantt;
    };

    gantt.tickFormat = function(value) {
        if (!arguments.length)
            return tickFormat;
        tickFormat = value;
        return gantt;
    };

    return gantt;
};
