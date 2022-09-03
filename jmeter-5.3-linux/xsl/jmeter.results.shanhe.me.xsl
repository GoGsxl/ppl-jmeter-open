<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/testResults">
        <html lang="en">
        <head>
            <meta name="Author" content="shanhe.me"/>
            <title>JMeter接口测试报告</title>
            <style type="text/css"><![CDATA[
            
                * { margin: 0; padding: 0 }
                html, body { width: 100%; height: 100%; background: #b4b4b4; font-size: 12px }
                table { border: none; border-collapse: collapse; table-layout: fixed }
                td { vertical-align: baseline; font-size: 12px }
                #left-panel { position: absolute; left: 0; top: 0; bottom: 0; width: 300px; overflow: auto; background: #dee4ea }
                #left-panel li.navigation { font-weight: bold; cursor: default; color: #9da8b2; line-height: 18px; background-position: 12px 5px; background-repeat: no-repeat; padding: 0 0 0 25px; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAICAYAAAArzdW1AAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sDEBQqGbO7BEcAAAAdaVRYdENvbW1lbnQAAAAAAENyZWF0ZWQgd2l0aCBHSU1QZC5lBwAAAKRJREFUGNN1zM0KgkAYheF3RvtXSsGyWhRNaILS7bdt11W0KgJvoPwZp0UlBPUtz3nOJw7Hk7necv5dOA2Qaazo2vZP0LEt9olCVtqQROufKNmuqBuBNAYW4QzXGX6B0bDPcjGnMQYJ8Cg12U59oSzaUJQa4IUAXMclDHwAAn/MxPMw765FZd2QRgopBWmsKCrdfhXnS/4ZYElBXdyxewN008Y8AephLAkqz613AAAAAElFTkSuQmCC) }
                #left-panel li.success { color: #565b60 }
                #left-panel li.failure { color: red }
                #left-panel li { list-style: none; color: black; cursor: pointer }
                #left-panel li.selected { background-repeat: repeat-x; color: white; background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAUCAYAAABMDlehAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sDEBQxLTs5O2gAAAAdaVRYdENvbW1lbnQAAAAAAENyZWF0ZWQgd2l0aCBHSU1QZC5lBwAAAEdJREFUCNc1y7ERgEAMA0GNUhIyGqM2uqKgtyWZhE9v53A/7/A6D7BkMDNgy2AroB2wHTCZv5UMOgFLG1bvd7XBckBlwCXjA5wMOF5iOX/MAAAAAElFTkSuQmCC) }
                #left-panel div { line-height: 20px; background-position: 25px 3px; background-repeat: no-repeat; padding: 0 0 0 45px }
                #left-panel div.success { background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAOCAYAAADwikbvAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sDEBULEEc6wzcAAAAdaVRYdENvbW1lbnQAAAAAAENyZWF0ZWQgd2l0aCBHSU1QZC5lBwAAAiNJREFUKM99kktIVGEYhp/jzJl08lI6logp2Y2EFkbtaqlFROsWrlq4ioJWQRs37VoUVItWkYEVRGSBlhleCpywDEWxTEuxcURTZ6YzxzP/5WshCOHUt36f93kXnyMi5Lsnb4clI4s4fhkXzp5w8mWcfHBvfEpUxVdCUUU6lUPNHuD86cYtBQX5GhPrM7hRg7GaSDRg2vuUd90WuOPVsOyqy6FFo2yOQHlU1S9z9dZT+S/8I7GCLlkAN4eyAf56mnT6Fy1HLnGuuYa++MS/4e74qMRqfXLaJ9BpfnsrLC0m2BYuoqwUbj/+274JD43OEqmexwvW8NUKXnaZtVSS1pNtAAyOvyC6v48HnUNb4Z7PH8UtTlIQWA5tb2RhYY7kz3l2FleytJYg/qWb8t2KZ/0PN+1hgI6uEUr2jpHKpGlquExVaS0VbjUZL7WxaqIXK6ADQ0n9GNfv9XCttWnD/O57t0TKFklnF3g5fJ/seoaa2D4O1x0F4PlgO9oIftbgFgYMfLgjACGqj0vlsddoUnj+Kt/mxunq72RP+UGqYjWMTA7R+b6dUCSEGEF5hoJQip6BaFs4HJtCyRrKs6wHCovDip/kys0WWpovMpOYBCtoT2N9B5uzWG0Zid8gnFrVFEQDtBaUrxEgXBimaEeER2/uIiK4roPOaMRYjBKsFly3fOO3G06dETGCWIsYjckprMphtEKMAQtgsMYi1mJMQHJ6xvkDKQoyphCzkl0AAAAASUVORK5CYII=) }
                #left-panel div.failure { background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAOCAYAAADwikbvAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sDEBUJOEC5CU8AAAAdaVRYdENvbW1lbnQAAAAAAENyZWF0ZWQgd2l0aCBHSU1QZC5lBwAAAeVJREFUKM+NkDtok2EUhp8vl9ZLo/EyKI6KFgqCKC4OClrBWUQEcRRx1cGpk3WyInWrgoMZKkW8thYaEYQ0i7WC2ngrNDTERHJvkv/L/3//dxwc7F8jeOAsh/c973OOEhG61aPnaen7maXYt4MLZ4+pbppQt+F06jNH3QWOb8pxUs+SmJzjv83hxY8SVy3wNdtVneiHqe54IhLoB4/TUkyMyOrKj5yXoVtPZK02kLyYK7OnlqFWzgcCGtUC/YUJ3n5a/jd28tU7ORTN0myUA6Jms8bpWIa798elqzn1fokjThrpVBC3ETzNbYAuca59j/Hp+b/N869Tsk8tgVMCXQk+RlfQuk1/tMLMwzsSMCcm5zjhvoR2AdpF0GuwO4aqttS05ZSbZHhsBoAIwI83Cdkd/460XDAOG02d24MxvlR8dsUUh3f2UHaEtgdbWCHz4oZwcVCp66PP5FLhKjEc8DXaCMsNy8DYn/SnZ+L0hhWOb/F8yLs9fDtwk8j+VpqwrlC34PrgGEu2bhlYhZ1b8dncq3AMeBaUr/k6NUyk4ChKzu+N2hc6Bqody+WDG8g2fLatD7F3axjPgmvAtYJvIbouhhIRrl0ZktnkBGIt1gqeMXQ8D2MMiCIUCqFEsFhEQMSykCuqX0MzLAUJTzRsAAAAAElFTkSuQmCC) }
                #left-panel div.detail { display: none }
                #right-panel { position: absolute; right: 0; top: 0; bottom: 0; left: 301px; overflow: auto; background: white }
                #right-panel .group { font-size: 12px; font-weight: bold; line-height: 16px; padding: 0 0 0 18px; counter-reset: assertion; background-repeat: repeat-x; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAQCAYAAADXnxW3AAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sDEBUkDq8pxjkAAAAdaVRYdENvbW1lbnQAAAAAAENyZWF0ZWQgd2l0aCBHSU1QZC5lBwAAADdJREFUCNdVxrERwDAMAzGK0v47eS6Z927SpMFBAAbkvSvnRk5+7K5cVfLMyN39bWakJAjA5xw9R94jN3tVhVEAAAAASUVORK5CYII=) }
                #right-panel .zebra { background-repeat: repeat; padding: 0 0 0 18px; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAmCAYAAAAFvPEHAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9sDEBYWFlNztEcAAAAdaVRYdENvbW1lbnQAAAAAAENyZWF0ZWQgd2l0aCBHSU1QZC5lBwAAABdJREFUCNdjYKAtePv5338mBgYGBpoQAGy1BAJlb/y6AAAAAElFTkSuQmCC) }
                #right-panel .data { line-height: 19px; white-space: nowrap }
                #right-panel pre.data { white-space: pre }
                #right-panel tbody.failure { color: red }
                #right-panel td.key { min-width: 108px }
                #right-panel td.delimiter { min-width: 18px }
                #right-panel td.assertion:before { counter-increment: assertion; content: counter(assertion) ". " }
                #right-panel td.assertion { color: black }
                #right-panel .trail { border-top: 1px solid #b4b4b4 }
				
				<!--JSON响应值格式化所用样式 -->
				div.ControlsRow, div.HeadersRow {font-family: Georgia;}
				div.Canvas{font-family: Lucida Console, Georgia;font-size: 13px;background-color:#ECECEC;color:#000000;border:solid 1px #CECECE;}
				.ObjectBrace{color:#00AA00;font-weight:bold;}
				.ArrayBrace{color:#0033FF;font-weight:bold;}
				.PropertyName{color:#CC0000;font-weight:bold;}
				.String{color:#007777;}
				.Number{color:#AA00AA;}
				.Boolean{color:#0000FF;}
				.Function{color:#AA6633;text-decoration:italic;}
				.Null{color:#0000FF;}
				.Comma{color:#000000;font-weight:bold;}
				PRE.CodeContainer{margin-top:0px;margin-bottom:0px;}
				PRE.CodeContainer img{cursor:pointer;border:none;margin-bottom:-1px;}
				#CollapsibleViewDetail a{padding-left:10px;}
				#ControlsRow{white-space:nowrap;font: 11px Georgia;}
				#TabSizeHolder{padding-left:10px;padding-right:10px;}
				#HeaderTitle{text-align:right;font-size:11px;}
				#HeaderSubTitle{margin-bottom:2px;margin-top:0px}
				A.OtherToolsLink {color:#555;text-decoration:none;}
				A.OtherToolsLink:hover {text-decoration:underline;}	
				#alldata {table-layout:fixed;empty-cells:show;border-collapse: collapse;margin:0 auto;font-size:12px;border:1px solid #cad9ea;color:#4f6b72;}
				#alldata th{background-repeat:repeat-x;height:30px;border:1px solid #cad9ea;background-color:#EDF3FE;}
				#alldata td{border:1px solid #cad9ea;padding:0 1em 0;}
				#alldata2 {table-layout:fixed;empty-cells:show;border-collapse: collapse;margin:0 auto;font-size:12px;border:1px solid #cad9ea;color:#4f6b72;}
				#alldata2 th{background-repeat:repeat-x;height:30px;border:1px solid #cad9ea;}
				#alldata2 td{border:1px solid #cad9ea;padding:0 1em 0;}
				#alldata2 tr:nth-child(even){background-color:#EDF3FE;}
				
                
            ]]></style>
            <script type="text/javascript"><![CDATA[
            
                var onclick_li = (function() {
                    var last_selected = null;
                    return function(li, index) {
						Process(index);
                        if( last_selected == li )
                            return;
                        if( last_selected )
                            last_selected.className = "";
                        last_selected = li;
                        last_selected.className = "selected";
                        document.getElementById("right-panel").innerHTML = last_selected.firstChild.nextSibling.innerHTML;
                        return false;
                    };
                })();
                
                var patch_timestamp = function() {
                    var spans = document.getElementsByTagName("span");
                    var len = spans.length;
                    for( var i = 0; i < len; ++i ) {
                        var span = spans[i];
                        if( "patch_timestamp" == span.className )
                            span.innerHTML = new Date( parseInt( span.innerHTML ) );
                    }
                };
                
                var patch_navigation_class = (function() {
                
                    var set_class = function(el, flag) {
                        if(el) {
                            el.className += flag ? " success" : " failure";
                        }
                    };
                
                    var traverse = function(el, group_el, flag) {
                        while(1) {
                            if(el) {
                                if(el.className == 'navigation') {
                                    set_class(group_el, flag);
                                    group_el = el;
                                    flag = true;
                                } else {
                                    var o = el.firstChild;
                                    o = o ? o.className : null;
                                    flag = flag ? (o == 'success') : false;
                                }
                                el = el.nextSibling;
                            } else {
                                set_class(group_el, flag);
                                break;
                            }
                        }
                    };
                    
                    return function() {
                        var o = document.getElementById("result-list");
                        o = o ? o.firstChild : null;
                        if(o)
                            traverse(o, null, true);
                    };
                })();
        
                window.onload = function() {
                    patch_timestamp();
                    patch_navigation_class();
                    var o = document.getElementById("result-all");
                    o = o ? o.firstChild : null;
                    o = o ? o.nextSibling : null;
                    if(o)
                        onclick_li(o, 1);
                };
				
				
				//JSON 格式化引用的js
				window.SINGLE_TAB = "  ";
				window.QuoteKeys = true;
				function $id(id){ return document.getElementById(id); }
				function IsArray(obj) {
				  return  obj && 
						  typeof obj === 'object' && 
						  typeof obj.length === 'number' &&
						  !(obj.propertyIsEnumerable('length'));
				}

				function Process(index){
				  SetTab();
				  window.IsCollapsible = false;
				  debugger;
				  if (!index){
					return false;
				  }  
				  var json = $id("RawJson" + index).textContent;
				  
				  var html = "";
				  try{
					if(json == "") json = "\"\"";
					var obj = eval("["+json+"]");
					html = ProcessObject(obj[0], 0, false, false, false);
					$id("Canvas" + index).innerHTML = "<PRE class='CodeContainer'>"+html+"</PRE>";
				  }catch(e){
					//alert("JSON数据格式不正确:\n"+e.message);
					$id("Canvas" + index).innerHTML = "not Json Data";
				  }
				}
				window._dateObj = new Date();
				window._regexpObj = new RegExp();
				function ProcessObject(obj, indent, addComma, isArray, isPropertyContent){

				  var html = "";
				  var comma = (addComma) ? "<span class='Comma'>,</span> " : ""; 
				  var type = typeof obj;
				  var clpsHtml ="";
				  if(IsArray(obj)){
					if(obj.length == 0){
					  html += GetRow(indent, "<span class='ArrayBrace'>[ ]</span>"+comma, isPropertyContent);
					}else{
					  clpsHtml = window.IsCollapsible ? "<span><img src=\""+window.ImgExpanded+"\" onClick=\"ExpImgClicked(this)\" /></span><span class='collapsible'>" : "";
					  html += GetRow(indent, "<span class='ArrayBrace'>[</span>"+clpsHtml, isPropertyContent);
					  for(var i = 0; i < obj.length; i++){
						html += ProcessObject(obj[i], indent + 1, i < (obj.length - 1), true, false);
					  }
					  clpsHtml = window.IsCollapsible ? "</span>" : "";
					  html += GetRow(indent, clpsHtml+"<span class='ArrayBrace'>]</span>"+comma);
					}
				  }else if(type == 'object'){
					if (obj == null){
						html += FormatLiteral("null", "", comma, indent, isArray, "Null");
					}else if (obj.constructor == window._dateObj.constructor) { 
						html += FormatLiteral("new Date(" + obj.getTime() + ") /*" + obj.toLocaleString()+"*/", "", comma, indent, isArray, "Date"); 
					}else if (obj.constructor == window._regexpObj.constructor) {
						html += FormatLiteral("new RegExp(" + obj + ")", "", comma, indent, isArray, "RegExp"); 
					}else{
					  var numProps = 0;
					  for(var prop in obj) numProps++;
					  if(numProps == 0){
						html += GetRow(indent, "<span class='ObjectBrace'>{ }</span>"+comma, isPropertyContent);
					  }else{
						clpsHtml = window.IsCollapsible ? "<span><img src=\""+window.ImgExpanded+"\" onClick=\"ExpImgClicked(this)\" /></span><span class='collapsible'>" : "";
						html += GetRow(indent, "<span class='ObjectBrace'>{</span>"+clpsHtml, isPropertyContent);

						var j = 0;

						for(var prop in obj){

						  var quote = window.QuoteKeys ? "\"" : "";

						  html += GetRow(indent + 1, "<span class='PropertyName'>"+quote+prop+quote+"</span>: "+ProcessObject(obj[prop], indent + 1, ++j < numProps, false, true));

						}

						clpsHtml = window.IsCollapsible ? "</span>" : "";

						html += GetRow(indent, clpsHtml+"<span class='ObjectBrace'>}</span>"+comma);

					  }

					}

				  }else if(type == 'number'){

					html += FormatLiteral(obj, "", comma, indent, isArray, "Number");

				  }else if(type == 'boolean'){

					html += FormatLiteral(obj, "", comma, indent, isArray, "Boolean");

				  }else if(type == 'function'){

					if (obj.constructor == window._regexpObj.constructor) {

						html += FormatLiteral("new RegExp(" + obj + ")", "", comma, indent, isArray, "RegExp"); 

					}else{

						obj = FormatFunction(indent, obj);

						html += FormatLiteral(obj, "", comma, indent, isArray, "Function");

					}

				  }else if(type == 'undefined'){

					html += FormatLiteral("undefined", "", comma, indent, isArray, "Null");

				  }else{

					html += FormatLiteral(obj.toString().split("\\").join("\\\\").split('"').join('\\"'), "\"", comma, indent, isArray, "String");

				  }

				  return html;

				}

				function FormatLiteral(literal, quote, comma, indent, isArray, style){

				  if(typeof literal == 'string')
					literal = literal.split("<").join("&lt;").split(">").join("&gt;");
				  var str = "<span class='"+style+"'>"+quote+literal+quote+comma+"</span>";
				  if(isArray) str = GetRow(indent, str);
				  return str;

				}

				function FormatFunction(indent, obj){
				  var tabs = "";
				  for(var i = 0; i < indent; i++) tabs += window.TAB;
				  var funcStrArray = obj.toString().split("\n");
				  var str = "";
				  for(var i = 0; i < funcStrArray.length; i++){
					str += ((i==0)?"":tabs) + funcStrArray[i] + "\n";
				  }
				  return str;
				}

				function GetRow(indent, data, isPropertyContent){
				  var tabs = "";
				  for(var i = 0; i < indent && !isPropertyContent; i++) tabs += window.TAB;
				  if(data != null && data.length > 0 && data.charAt(data.length-1) != "\n")
					data = data+"\n";
				  return tabs+data;                       
				}

				function TraverseChildren(element, func, depth){
				  for(var i = 0; i < element.childNodes.length; i++){
					TraverseChildren(element.childNodes[i], func, depth + 1);
				  }
				  func(element, depth);
				}

				function SetTab(){
				  window.TAB = MultiplyString(2, window.SINGLE_TAB);
				}

				function MultiplyString(num, str){
				  var sb =[];
				  for(var i = 0; i < num; i++){
					sb.push(str);
				  }
				  return sb.join("");
				}
				
            ]]></script>
			
        </head>
        <body>
            <div id="left-panel">
				<ol id="result-all">
                    <xsl:for-each select="*[position() =1]">
                        <!-- group with the previous sibling -->
                        <xsl:if test="position() = 1 or @tn != preceding-sibling::*[1]/@tn">
                            <li class="navigation">测试名称</li>
                        </xsl:if>
                        <li onclick="return onclick_li(this, {position()});">
						<div>
								
                                <xsl:attribute name="class">
                                    <xsl:choose>
                                        <xsl:when test="count(/testResults/*[attribute::s='false']) = 0">success</xsl:when>
                                        <xsl:otherwise>failure</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="string('jmeter接口自动化测试')"/>
                            </div>
							<div class="detail">
                                <div class="group">统计</div>
								<br/>
									<table id="alldata" align="center"  border="0" cellpadding="5" cellspacing="2" width="95%">
		<tr valign="top">
			<th>所有</th>
			<th>失败</th>
			<th>成功率</th>
			<th>平均时间</th>
			<th>最小时间</th>
			<th>最大时间</th>
		</tr>
		<tr valign="top">
			<xsl:variable name="allCount" select="count(/testResults/*)" />
			<xsl:variable name="allFailureCount" select="count(/testResults/*[attribute::s='false'])" />
			<xsl:variable name="allSuccessCount" select="count(/testResults/*[attribute::s='true'])" />
			<xsl:variable name="allSuccessPercent" select="$allSuccessCount div $allCount" />
			<xsl:variable name="allTotalTime" select="sum(/testResults/*/@t)" />
			<xsl:variable name="allAverageTime" select="$allTotalTime div $allCount" />
			<xsl:variable name="allMinTime">
				<xsl:call-template name="min">
					<xsl:with-param name="nodes" select="/testResults/*/@t" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="allMaxTime">
				<xsl:call-template name="max">
					<xsl:with-param name="nodes" select="/testResults/*/@t" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="$allFailureCount &gt; 0">Failure</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<td align="center">
				<xsl:value-of select="$allCount" />
			</td>
			<td align="center">
				<xsl:value-of select="$allFailureCount" />
			</td>
			<td align="center">
				<xsl:call-template name="display-percent">
					<xsl:with-param name="value" select="$allSuccessPercent" />
				</xsl:call-template>
			</td>
			<td align="center">
				<xsl:call-template name="display-time">
					<xsl:with-param name="value" select="$allAverageTime" />
				</xsl:call-template>
			</td>
			<td align="center">
				<xsl:call-template name="display-time">
					<xsl:with-param name="value" select="$allMinTime" />
				</xsl:call-template>
			</td>
			<td align="center">
				<xsl:call-template name="display-time">
					<xsl:with-param name="value" select="$allMaxTime" />
				</xsl:call-template>
			</td>
		</tr>
	</table>
	<br/>
                                <div class="trail"></div>
						
								<div class="group">统计详情</div>
								<br/>
									<table id="alldata2" align="center" border="0" cellpadding="5" cellspacing="2" width="95%">
		<tr valign="top">
			<th>接口名称</th>
			<th>所有</th>
			<th>失败</th>
			<th>成功率</th>
			<th>平均时间</th>
			<th>最小时间</th>
			<th>最大时间</th>
		</tr>
		<xsl:for-each select="/testResults/*[not(@lb = preceding::*/@lb)]">
			<xsl:variable name="label" select="@lb" />
			<xsl:variable name="count" select="count(../*[@lb = current()/@lb])" />
			<xsl:variable name="failureCount" select="count(../*[@lb = current()/@lb][attribute::s='false'])" />
			<xsl:variable name="successCount" select="count(../*[@lb = current()/@lb][attribute::s='true'])" />
			<xsl:variable name="successPercent" select="$successCount div $count" />
			<xsl:variable name="totalTime" select="sum(../*[@lb = current()/@lb]/@t)" />
			<xsl:variable name="averageTime" select="$totalTime div $count" />
			<xsl:variable name="minTime">
				<xsl:call-template name="min">
					<xsl:with-param name="nodes" select="../*[@lb = current()/@lb]/@t" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="maxTime">
				<xsl:call-template name="max">
					<xsl:with-param name="nodes" select="../*[@lb = current()/@lb]/@t" />
				</xsl:call-template>
			</xsl:variable>
			<tr valign="top">
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$failureCount &gt; 0">Failure</xsl:when>
					</xsl:choose>
				</xsl:attribute>
				<td>
				<xsl:if test="$failureCount > 0">
				  <a><xsl:attribute name="href">#<xsl:value-of select="$label" /></xsl:attribute>
				  <xsl:value-of select="$label" />
				  </a>
				</xsl:if>
				<xsl:if test="0 >= $failureCount">
				  <xsl:value-of select="$label" />
				</xsl:if>
				</td>
				<td align="center">
					<xsl:value-of select="$count" />
				</td>
				<td align="center">
					<xsl:value-of select="$failureCount" />
				</td>
				<td align="center">
					<xsl:call-template name="display-percent">
						<xsl:with-param name="value" select="$successPercent" />
					</xsl:call-template>
				</td>
				<td align="center">
					<xsl:call-template name="display-time">
						<xsl:with-param name="value" select="$averageTime" />
					</xsl:call-template>
				</td>
				<td align="center">
					<xsl:call-template name="display-time">
						<xsl:with-param name="value" select="$minTime" />
					</xsl:call-template>
				</td>
				<td align="center">
					<xsl:call-template name="display-time">
						<xsl:with-param name="value" select="$maxTime" />
					</xsl:call-template>
				</td>
				
			</tr>			
		</xsl:for-each>
	</table>	                    
                            </div>
                        </li>
                    </xsl:for-each>
                </ol>
                <ol id="result-list">
                    <xsl:for-each select="*">
                        <!-- group with the previous sibling -->
                        <xsl:if test="position() = 1 or @tn != preceding-sibling::*[1]/@tn">
                            <li class="navigation">线程名称: <xsl:value-of select="@tn"/></li>
                        </xsl:if>
                        <li onclick="return onclick_li(this, {position()});">
                            <div>
                                <xsl:attribute name="class">
                                    <xsl:choose>
                                        <xsl:when test="@s = 'true'">success</xsl:when>
                                        <xsl:otherwise>failure</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="@lb"/>
                            </div><div class="detail">
                                <div class="group">请求详情</div>
                                <div class="zebra">
                                    <table>
                                        <tr><td class="data key">线程名称</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@tn"/></td></tr>
                                        <tr><td class="data key">时间</td><td class="data delimiter">:</td><td class="data"><span class="patch_timestamp"><xsl:value-of select="@ts"/></span></td></tr>
                                        <tr><td class="data key">消化时间</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@t"/> ms</td></tr>
                                        <tr><td class="data key">延迟</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@lt"/> ms</td></tr>
                                        <tr><td class="data key">字节</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@by"/></td></tr>
                                        <tr><td class="data key">请求次数</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@sc"/></td></tr>
                                        <tr><td class="data key">失败次数</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@ec"/></td></tr>
                                        <tr><td class="data key">响应状态码</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@rc"/></td></tr>
                                        <tr><td class="data key">响应消息</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="@rm"/></td></tr>
                                    </table>
                                </div>
                                <div class="trail"></div>
                                <xsl:if test="count(assertionResult) &gt; 0">
                                    <div class="group">断言</div>
                                    <div class="zebra">
                                        <table>
                                            <xsl:for-each select="assertionResult">
                                                <tbody>
                                                    <xsl:attribute name="class">
                                                        <xsl:choose>
                                                            <xsl:when test="failure = 'true'">failure</xsl:when>
                                                            <xsl:when test="error = 'true'">failure</xsl:when>
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                    <tr><td class="data assertion" colspan="3"><xsl:value-of select="name"/></td></tr>
                                                    <tr><td class="data key">是否断言失败</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="failure"/></td></tr>
                                                    <tr><td class="data key">是否断言错误</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="error"/></td></tr>
                                                    <tr><td class="data key">断言失败消息</td><td class="data delimiter">:</td><td class="data"><xsl:value-of select="failureMessage"/></td></tr>
                                                </tbody>
                                            </xsl:for-each>
                                        </table>
                                    </div>
                                    <div class="trail"></div>
                                </xsl:if>
                                <div class="group">请求信息</div>
                                <div class="zebra">
                                    <table>
                                        <tr><td class="data key">Method/Url</td><td class="data delimiter">:</td><td class="data"><pre class="data"><xsl:value-of select="method"/><xsl:text> </xsl:text><xsl:value-of select="java.net.URL"/></pre></td></tr>
                                        <tr><td class="data key">Query String</td><td class="data delimiter">:</td><td class="data"><pre class="data"><xsl:value-of select="queryString"/></pre></td></tr>
                                        <tr><td class="data key">Cookies</td><td class="data delimiter">:</td><td class="data"><pre class="data"><xsl:value-of select="cookies"/></pre></td></tr>
                                        <tr><td class="data key">请求头Headers</td><td class="data delimiter">:</td><td class="data"><pre class="data"><xsl:value-of select="requestHeader"/></pre></td></tr>
                                    </table>
                                </div>
                                <div class="trail"></div>
                                <div class="group">响应信息</div>
                                <div class="zebra">
                                    <table>
                                        <tr><td class="data key">响应-Headers</td><td class="data delimiter">:</td><td class="data"><pre class="data"><xsl:value-of select="responseHeader"/></pre></td></tr>
                                        <tr><td class="data key">响应body</td><td class="data delimiter">:</td><td class="data"><pre id='RawJson{position()}' class="data"><xsl:value-of select="responseData"/></pre></td></tr>
                                        <tr><td class="data key">Response File</td><td class="data delimiter">:</td><td class="data"><pre class="data"><xsl:value-of select="responseFile"/></pre></td></tr>
										<tr><td class="data key">JSON 格式化</td><td class="data delimiter">:</td><td><div id="Canvas{position()}" class="Canvas"></div></td></tr>
                                    </table>
                                </div>
                                <div class="trail"></div>
                            </div>
                        </li>
                    </xsl:for-each>
                </ol>
            </div>
            <div id="right-panel"></div>
        </body>
        </html>
    </xsl:template>
	<xsl:template name="min">
	<xsl:param name="nodes" select="/.." />
	<xsl:choose>
		<xsl:when test="not($nodes)">NaN</xsl:when>
		<xsl:otherwise>
			<xsl:for-each select="$nodes">
				<xsl:sort data-type="number" />
				<xsl:if test="position() = 1">
					<xsl:value-of select="number(.)" />
				</xsl:if>
			</xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="max">
	<xsl:param name="nodes" select="/.." />
	<xsl:choose>
		<xsl:when test="not($nodes)">NaN</xsl:when>
		<xsl:otherwise>
			<xsl:for-each select="$nodes">
				<xsl:sort data-type="number" order="descending" />
				<xsl:if test="position() = 1">
					<xsl:value-of select="number(.)" />
				</xsl:if>
			</xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="display-percent">
	<xsl:param name="value" />
	<xsl:value-of select="format-number($value,'0.00%')" />
</xsl:template>

<xsl:template name="display-time">
	<xsl:param name="value" />
	<xsl:value-of select="format-number($value,'0 ms')" />
</xsl:template>
</xsl:stylesheet>