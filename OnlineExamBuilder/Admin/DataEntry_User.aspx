<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="DataEntry_User.aspx.cs" Inherits="OnlineExamBuilder.Admin.DataEntry_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin:0px;">
        <div class="col-12 col-sm-12 col-md-4" style="padding:15px; ">
            <div class="row" style="margin:0px; padding:15px; border:1px solid #007bff;">
                <div class="col-6" style="padding:0px; font-size:20px;">Name</div>
                <div class="col-6" id="txtnam" style="padding:0px;"></div>
                <div class="col-6" style="padding:0px; font-size:20px;">Designation</div>
                <div class="col-6" id="txtdeg" style="padding:0px;"></div>
                <div class="col-12" style="padding:0px; padding-bottom:0px; text-align:right;"><button type="button" id="addnewuser" class="btn btn-sm btn-success">Edit</button></div>
            </div>
        </div>
    </div>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="txtheadtitle">Edit</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="col-12" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Name</div>
                    <div class="col-12" style="padding-bottom: 10px;">
                        <input type="text" class="w-100 form-control" id="txtusernamid" />
                    </div>
                    <div class="col-12" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Password</div>
                    <div class="col-12" style="padding-bottom: 10px;">
                        <input type="password" class="w-100 form-control" id="txtpassid" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" id="btnsave">Update</button>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdndesgid" runat="server"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ADataEntry').addClass('sidebar-active');
            PageMethods.Admin_UserGetbyID(Admin_UserGetbyIDbind1);
        });
        function Admin_UserGetbyIDbind1(result) {
            $('#txtnam').text(result[0].Name);
            $('#<%= hdndesgid.ClientID %>').val(result[0].Admin);
            if (result[0].Admin == false) {
                $('#txtdeg').text('DataEntry');
            } else {
                $('#txtdeg').text('Admin');
            }
            return false;
        }
        $('#addnewuser').click(function () {
            $('#myModal').modal('show');
            PageMethods.Admin_UserGetbyID(Admin_UserGetbyIDbind);
            return false;
        });
        function Admin_UserGetbyIDbind(result) {
            $('#txtusernamid').val(result[0].Name);
            $('#txtpassid').val(result[0].Password);
            return false;
        }
        $('#btnsave').click(function () {
            if ($('#txtusernamid').val() == "") {
                alert('Enter name');
                return false;
            } else if ($('#txtpassid').val() == "") {
                alert('Enter Password');
                return false;
            } else{
                $('#myModal').modal('hide');
                PageMethods.AdminUserInsUpdate($('#txtusernamid').val(), $('#txtpassid').val(), $('#<%= hdndesgid.ClientID %>').val());
                PageMethods.Admin_UserGetbyID(Admin_UserGetbyIDbind1);                
                return false;
            }
        });
    </Script>
</asp:Content>

    