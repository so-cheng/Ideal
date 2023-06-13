<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="${webclassnamestar}${TableName}${webclassnameend}.aspx.cs" Inherits="${webnamespace}.${webclassnamestar}${TableName}${webclassnameend}" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Default"/> 
	<ext:Viewport ID="Viewport1" runat="server" Layout="FitLayout">
            <Items>
    <ext:GridPanel ID="${GridPaneID}" runat="server" TrackMouseOver="true"
        Title="${InfoName}信息列表" AutoScroll="true" Icon="Table">
		<Store>
            <ext:Store runat="server" ID="Store1" OnRefreshData="${StoreID}_OnRefreshData">
                <Reader>
                    <ext:JsonReader IDProperty="${pkName}">
                        <Fields>
#foreach($Item in $TableColumns.Rows)
					<ext:RecordField Name="${Item.ColumnName}" #if(${Item.Type}=="datetime") Type="Date"#end/>
#end
				</Fields>
                    </ext:JsonReader>
                </Reader>
            </ext:Store>
        </Store>
        <TopBar>
            <ext:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <ext:Button runat="server" ID="btn_add" Text="添加${InfoName}信息" Icon="Add">
                        <DirectEvents>
                            <Click OnEvent="btn_add_Click">
                                <EventMask ShowMask="true" Msg="请稍后..." />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                    <ext:ToolbarSeparator />
                    <ext:Button runat="server" ID="btn_edit" Text="修改${InfoName}信息" Icon="TableEdit">
                        <Listeners>
                            <Click Handler="if(!${GridPaneID}.getSelectionModel().getSelected())
                            {
                                Ext.Msg.show({
                                    icon: Ext.MessageBox.ERROR,
                                    title:'提示', 
                                    msg: '请选择要修改的${InfoName}信息！', 
                                    buttons:Ext.Msg.OK
                                });
                                return false;
                            }" />
                        </Listeners>
                        <DirectEvents>
                            <Click OnEvent="btn_edit_Click">
                                <EventMask ShowMask="true" Msg="请稍后..." />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                    <ext:ToolbarSeparator />
                    <ext:Button runat="server" ID="btn_dele" Text="删除${InfoName}信息" Icon="Delete">
                        <Listeners>
                            <Click Handler="if(!${GridPaneID}.getSelectionModel().getSelected())
                            {
                                Ext.Msg.show({
                                    icon: Ext.MessageBox.ERROR,
                                    title:'提示', 
                                    msg: '请选择要删除的${InfoName}信息！', 
                                    buttons:Ext.Msg.OK
                                });
                                return false;
                            }" />
                        </Listeners>
                        <DirectEvents>
                            <Click OnEvent="btn_dele_Click">
                                <Confirmation ConfirmRequest="true" Message="确定要删除所选信息？" Title="提示" />
                                <EventMask ShowMask="true" Msg="请稍后" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Items>
            </ext:Toolbar>
        </TopBar>
		<ColumnModel runat="server">
			<Columns>
#foreach($Item in $TableColumns.Rows)
#if(${Item.PrimaryKey} != "true")
#if(${Item.Type}=="datetime")
				<ext:Column Header="${Item.ColumnDesc}" Sortable="true" DataIndex="${Item.ColumnName}" Width="60">
				<Renderer Fn="Ext.util.Format.dateRenderer('Y-m-d')" />
				</ext:Column>
#else
				<ext:Column Header="${Item.ColumnDesc}" Sortable="true" DataIndex="${Item.ColumnName}" />
#end
#end
#end
			</Columns>
		</ColumnModel>
#if(${AddFilters} == "true")
		<Plugins>
			<ext:GridFilters FiltersText="筛选数据">
				<Filters>
#foreach($Item in $TableColumns.Rows)
#if(${Item.csType}=="DateTime")
	<ext:DateFilter DataIndex="${Item.ColumnName}" />
#elseif(${Item.csType}=="bool")
	<ext:BooleanFilter DataIndex="${Item.ColumnName}" />
#else
	<ext:StringFilter DataIndex="${Item.ColumnName}" />
#end
#end
				</Filters>
			</ext:GridFilters>
		</Plugins>
#end
		<BottomBar>
			<ext:PagingToolbar runat="server" ID="PagingToolBar1" StoreID="${StoreID}" PageSize="${PageSize}" DisplayInfo="true">
			</ext:PagingToolbar>
		</BottomBar>
		<SelectionModel>
            <ext:RowSelectionModel runat="server" ID="RowSelectionModel1" SingleSelect="true" />
        </SelectionModel>
    </ext:GridPanel>
    <ext:Window runat="server" ID="win_Info" Title="${InfoName}信息"  CloseAction="Hide" Width="350" AutoHeight="true" Modal="true" Hidden="true">
        <Content>
            <ext:FormPanel runat="server" ID="form_Content" AutoHeight="true" Frame="true">
                <Content>
                    <ext:FormLayout runat="server" LabelWidth="90">
					<Anchors>
#foreach($Item in $TableColumns.Rows)
#if(${Item.PrimaryKey} != "true")
						<ext:Anchor Horizontal="80%">
#if(${Item.csType}=="int")
							<ext:NumberField runat="server" ID="txt_${Item.ColumnName}" FieldLabel="${Item.ColumnDesc}"  AnchorHorizontal="90%"/>
#elseif(${Item.csType}=="DateTime")
							<ext:DateField runat="server" ID="dt_${Item.ColumnName}" FieldLabel="${Item.ColumnDesc}"  AnchorHorizontal="90%"/>
#elseif(${Item.csType}=="bool")
							<ext:ComboBox runat="server" ID="cmb_${Item.ColumnName}" FieldLabel="${Item.ColumnDesc}" Editable="false" AllowBlank="false"  AnchorHorizontal="90%">
								<Items>
									<ext:ListItem Text="是" Value="1" />
									<ext:ListItem Text="否" Value="0" />
								</Items>
							</ext:ComboBox>
#else
							<ext:TextField runat="server" ID="txt_${Item.ColumnName}" FieldLabel="${Item.ColumnDesc}"  AnchorHorizontal="90%"/>
#end
                        </ext:Anchor>
						
#end                    
#end
						</Anchors>
                    </ext:FormLayout>
                </Content>
            </ext:FormPanel>
        </Content>
        <Buttons>
            <ext:Button ID="btn_Save" runat="server" Text="保存" Icon="Disk">
                <DirectEvents>
                    <Click OnEvent="btn_Save_Click">
                        <EventMask ShowMask="true" Msg="正在保存..." />
                    </Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button runat="server" Text="取消" Icon="Cancel">
                <Listeners>
                    <Click Handler="win_Info.hide();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>
    <ext:Hidden runat="server" ID="hid_ReaderID" />
	</Items>
        </ext:Viewport>
    </form>
</body>
</html>
