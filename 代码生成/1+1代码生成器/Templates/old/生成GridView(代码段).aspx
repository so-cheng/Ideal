<ext:Store ID="${StoreID}" runat="server" IgnoreExtraFields="${IgnoreExtraFields}" #if(${HaveRefresh}=="true")OnRefreshData="${StoreID}_Refresh"#end>
    <Reader>
        <ext:JsonReader ReaderID="${pkName}">
            <Fields>
		#foreach($Item in $TableColumns.Rows)
		<ext:RecordField Name="${Item.ColumnName}" #if(${Item.Type}=="datetime") Type="Date"#end/>
		#end
            </Fields>
        </ext:JsonReader>
    </Reader>
</ext:Store>
<ext:GridPanel 
	ID="${GridPanelID}"
    runat="server"
    StoreID="${StoreID}"
    TrackMouseOver="true"
    Title="${Title}"
    AutoHeight="true"
    AutoWidth="true"
    Icon="Table">
	<ColumnModel runat="server">
		<Columns>
  #foreach($Item in $TableColumns.Rows)
      #if(${Item.Type}=="datetime")
      <ext:Column Header="${Item.ColumnDesc}" Sortable="true" DataIndex="${Item.ColumnName}" Width="60">
      <Renderer Fn="Ext.util.Format.dateRenderer('Y-m-d')" />
      </ext:Column>
      #else
      <ext:Column Header="${Item.ColumnDesc}" Sortable="true" DataIndex="${Item.ColumnName}" />
      #end
  #end
  </Columns>
	</ColumnModel>
	#if(${AddFilters} == "true")
	<Plugins>
        <ext:GridFilters FiltersText="条件过滤">
            <Filters>
      #foreach($Item in $TableColumns.Rows)
	    <ext:StringFilter DataIndex="${Item.ColumnName}" />
	    #end
            </Filters>
        </ext:GridFilters>
    </Plugins>
	#end
	#if(${AddPagingToolbar}=="true")
	<BottomBar>
        <ext:PagingToolbar runat="server" ID="PagingToolBar1" StoreID="${StoreID}" PageSize="${PageSize}"
            DisplayInfo="true">
        </ext:PagingToolbar>
    </BottomBar>
	#end
</ext:GridPanel>