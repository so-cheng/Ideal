using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using ${modelnamespace};
using ${bllnamespace};

namespace ${webnamespace}
{
    public partial class ${webclassnamestar}${TableName}${webclassnameend} : ${basepage}
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }

        /// <summary>
        /// 绑定数据列表
        /// </summary>
        private void ShowData()
        {
            ${StoreID}.DataSource = ${bllclassnamestar}${TableName}.GetAllEntityList();
            ${StoreID}.DataBind();
        }

        /// <summary>
        /// 初始化表单内容
        /// </summary>
        private void InitFormContent()
        {
			hid_ReaderID.Value = "";
#foreach($Item in $TableColumns.Rows)
#if(${Item.PrimaryKey} != "true")
#if(${Item.csType}=="DateTime")
			dt_${Item.ColumnName}.Value = "";
#elseif(${Item.csType}=="bool")
			cmb_${Item.ColumnName}.SelectedItem.Value = "0";
#else
			txt_${Item.ColumnName}.Text = "";
#end
#end
#end
        }

        /// <summary>
        /// 通过实体设置表单内容
        /// </summary>
        private void SetFormContent(${modelclassnamestar}${TableName} entity)
        {
#foreach($Item in $TableColumns.Rows)
#if(${Item.PrimaryKey} != "true")
#if(${Item.csType}=="DateTime")
			if (entity.${Item.ColumnName} != null)
                dt_${Item.ColumnName}.SelectedDate = Convert.ToDateTime(entity.${Item.ColumnName});
#elseif(${Item.csType}=="int")
			txt_${Item.ColumnName}.Text = entity.${Item.ColumnName}.ToString();
#elseif(${Item.csType}=="bool")
			cmb_${Item.ColumnName}.SelectedItem.Value = entity.${Item.ColumnName} ? "1" : "0";
#else
			txt_${Item.ColumnName}.Text = entity.${Item.ColumnName};
#end
#end
#end
            hid_ReaderID.Value = entity.ID;
        }

        /// <summary>
        /// 将表单内容赋值给实体
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        private void GetFormContent(${modelclassnamestar}${TableName} entity)
        {
#foreach($Item in $TableColumns.Rows)
#if(${Item.PrimaryKey} != "true")
#if(${Item.csType}=="DateTime")
			if (dt_${Item.ColumnName}.SelectedDate.Year != 1)
            {
                entity.${Item.ColumnName} = dt_${Item.ColumnName}.SelectedDate;
            }
            else
            {
                entity.${Item.ColumnName} = null;
            }
#elseif(${Item.csType}=="int")
			entity.${Item.ColumnName} = Convert.ToInt32(txt_${Item.ColumnName}.Text);
#elseif(${Item.csType}=="bool")
			entity.${Item.ColumnName} = cmb_${Item.ColumnName}.SelectedItem.Value == "1" ? true : false;
#else
			entity.${Item.ColumnName} = txt_${Item.ColumnName}.Text;
#end
#end
#end
        }

        /// <summary>
        /// 刷新数据源事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ${StoreID}_OnRefreshData(object sender, StoreRefreshDataEventArgs e)
        {
            ShowData();
        }

        /// <summary>
        /// 添加${InfoName}信息事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_add_Click(object sender, DirectEventArgs e)
        {
            InitFormContent();
            win_Info.Title = "添加${InfoName}信息";
            win_Info.Show();
        }

        /// <summary>
        /// 修改${InfoName}信息事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_edit_Click(object sender, DirectEventArgs e)
        {
            ${modelclassnamestar}${TableName} entity = ${bllclassnamestar}${TableName}.GetEntityById(Convert.ToInt32(RowSelectionModel1.SelectedRow.RecordID));
            if (entity != null)
            {
                SetFormContent(entity);
                win_Info.Title = "修改${InfoName}信息";
                win_Info.Show();
            }
            else
            {
                X.Msg.Show(new MessageBoxConfig
                {
                    Title = "提示",
                    Message = "信息不存在或已被删除！",
                    Buttons = MessageBox.Button.OK,
                    Icon = MessageBox.Icon.ERROR
                });
            }
        }

        /// <summary>
        /// 删除信息事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_dele_Click(object sender, DirectEventArgs e)
        {
            ${bllclassnamestar}${TableName}.DeleteEntityById(Convert.ToInt32(RowSelectionModel1.SelectedRow.RecordID));
            X.Msg.Show(new MessageBoxConfig
            {
                Title = "提示",
                Message = "信息删除成功！",
                Buttons = MessageBox.Button.OK,
                Icon = MessageBox.Icon.INFO
            });
            ShowData();
        }

        /// <summary>
        /// 保存按钮事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Save_Click(object sender, DirectEventArgs e)
        {
            ${modelclassnamestar}${TableName} entity = hid_ReaderID.Value.ToString() == "" ? 
                new ${modelclassnamestar}${TableName}() : 
                ${bllclassnamestar}${TableName}.GetEntityById(Convert.ToInt32(hid_ReaderID.Value));
            if (entity != null)
            {
                entity.Attach();
                GetFormContent(entity);
                ${bllclassnamestar}${TableName}.SaveEntity(entity);
            }
            else
            {
                X.Msg.Show(new MessageBoxConfig
                {
                    Title = "保存失败",
                    Message = "信息不存在或已被删除！",
                    Buttons = MessageBox.Button.OK,
                    Icon = MessageBox.Icon.ERROR
                });
            }
            win_Info.Hide();
            ShowData();
        }
    }
}
