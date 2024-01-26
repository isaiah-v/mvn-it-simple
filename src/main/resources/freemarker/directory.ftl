<#ftl output_format="HTML">

<#macro trimSlashes str>${str?remove_beginning("/")?remove_ending("/")}</#macro>

<#macro filepath path file><@compress>
    /<@trimSlashes str=path/>/<@trimSlashes str=file/>
</@compress></#macro>

<html>
    <head>
        <style>
        body {
          font-family: Arial, Helvetica, sans-serif;
        }
        div.table {
          display: table;
          width: 100%;
          background-color: #eee;
        }
        div.table div.tr {
          display: table-row;
          width: 100%;
          clear: both;
        }
        div.table div.tr.odd {
          background-color: #dfe8f5;
        }
        div.table div.td {
          display: table-cell;
          padding: 4px;
          vertical-align: middle;
        }
        div.table div.td.icon {
          width: 0%
        }
        span {
            font-size: x-large;
        }

        </style>
    </head>
    <body>
        <div>${uri}</div>

        <#assign row = 0>
        <div class="table">
            <#-- parent directory -->
            <#if !isRoot>
                <#assign row++>
                <div class="tr <#if row%2==0>odd</#if>">
                    <div class="td icon"><span>&#128194;</span></div>
                    <div class="td"><a href="${parentUri}"> ../ </a></div>
                </div>
            </#if>

            <#-- directories -->
            <#list directories as directory>
                <#assign row++>
                <div class="tr <#if row%2==0>odd</#if>">
                    <div class="td icon"><span>&#128194;</span></div>
                    <div class="td"><a href="<@filepath path=uri file=directory />">${directory}</a></div>
                </div>
            </#list>

            <#-- files -->
            <#list files as file>
                <#assign row++>
                <div class="tr <#if row%2==0>odd</#if>">
                    <div class="td icon"><span>&#128196;</span></div>
                    <div class="td"><a href="<@filepath path=uri file=file />">${file}</a></div>
                </div>
            </#list>
        </div>
    </body>
</html>