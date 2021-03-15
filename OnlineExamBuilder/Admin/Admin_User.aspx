<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="Admin_User.aspx.cs" Inherits="OnlineExamBuilder.Admin_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin:0px;">
        <div class="col-12" style="padding:15px; padding-bottom:0px; text-align:right;"><button type="button" id="addnewuser" class="btn btn-sm btn-success">Add</button></div>
        <div class="col-12" id="divadminuserresult" style="padding:15px;"></div>
    </div>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="txtheadtitle"></h4>
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
                    <div class="col-12" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Admin Level</div>
                    <div class="col-12" style="padding-bottom:20px">
                        <div class="row" style="margin:0px;">
                            <div class="col-6">
                            <label class="col-form-label" style="font-weight:500;">
                                <input type="radio" class="form-check-input" name="optionradio"  id="radadmin"/>
                                Admin
                            </label>
                        </div>
                        <div class="col-6">  
                            <label class="col-form-label" style="font-weight:500;">
                            <input type="radio" class="form-check-input" name="optionradio" id="radadtaentry"/> DataEntry
                        </label>
                        </div>
                        </div>                                                
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" id="btnsave"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="myModaldel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">Are you Sure to Delete.</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" id="btndelete">Delete</button>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdnuserid" runat="server"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebaraadminuser').addClass('sidebar-active');
            PageMethods.Admin_UserGetAll(Admin_UserGetAllBind);
        });
        function Admin_UserGetAllBind(result) {            
            $('#divadminuserresult').empty();
            $('#divadminuserresult').show();
            var html = '';
            if (result.length > 0) {
                html += '<div class="table table-responsive" >';
                html += '<table class="table table-bordered">';
                html += '<tr><th>Name</th><th>Admin Level</th><th>Action</th></tr>';
                for (var i = 0; i < result.length; i++) {
                    html += '<tr>';
                    html += '<td>' + result[i].Name + '</td>';
                    if (result[i].Admin == true) {
                        html += '<td>Admin</td>';
                    } else {
                        html += '<td>Data Entry</td>';
                    }                    
                    html += '<td><div class="btn-group"><button type="button" class="btn btn-sm btn-success" onclick="return AdminUserEdit(' + result[i].ID + ' ); " >Edit</button>';
                    html += '<button type="button" class="btn btn-sm btn-danger" onclick="return AddUserdelete(' + result[i].ID + ' ); " >Delete</button></td>';
                }
                html += '</tr>';
                html += '</table>';
            } else {
                html += '<div class="table table-responsive" >';
                html += '<table class="table table-bordered">';
                html += '<tr><th>Name</th><th>Admin Level</th><th>Action</th></tr>';
                    html += '<tr>';
                    html += '<td colspan="3">No record found</td>';
                html += '</tr>';
                html += '</table>';
            }
            $('#divadminuserresult').append(html);
        }
        $('#addnewuser').click(function () {
            $('#<%= hdnuserid.ClientID %>').val(0);
            $('#txtusernamid').val("");
            $('#txtpassid').val("");
            $('#radadmin').prop('checked', false);
            $('#radadtaentry').prop('checked', false);
            $('#txtheadtitle').text('Add');
            $('#btnsave').text('Add');
            $('#myModal').modal('show');            
        });
        function AdminUserEdit(id) {
            $('#<%= hdnuserid.ClientID %>').val(id);
            $('#txtheadtitle').text('Edit');
            $('#btnsave').text('Update');
            $('#myModal').modal('show');
            PageMethods.Admin_UserGetbyID(id,Admin_UserGetbyIDbind);
            return false;
        }
        function Admin_UserGetbyIDbind(result) {
            $('#txtusernamid').val(result[0].Name);
            $('#txtpassid').val(result[0].Password);
            if (result[0].Admin == true) {
                $('#radadmin').prop('checked', true);
            } else {
                $('#radadtaentry').prop('checked', true);
            }
            return false;
        }
        function AddUserdelete(id) {
            $('#<%= hdnuserid.ClientID %>').val(id);
            $('#txtheadtitle').text('Edit');            
            $('#myModaldel').modal('show');
        }
        $('#btnsave').click(function () {
            if ($('#txtusernamid').val() == "") {
                alert('Enter name');
                return false;
            } else if ($('#txtpassid').val() == "") {
                alert('Enter Password');
                return false;
            } else if ($('#radadmin:checked').length > 0) {
                var level = true;
                $('#myModal').modal('hide');
                PageMethods.AdminUserInsUpdate($('#<%= hdnuserid.ClientID %>').val(), $('#txtusernamid').val(), $('#txtpassid').val(), level,Adminuserinsertbind);                                
                PageMethods.Admin_UserGetAll(Admin_UserGetAllBind);
                return false;
            } else if ($('#radadtaentry:checked').length > 0) {
                var level = false;
                $('#myModal').modal('hide');
                PageMethods.AdminUserInsUpdate($('#<%= hdnuserid.ClientID %>').val(), $('#txtusernamid').val(), $('#txtpassid').val(), level, Adminuserinsertbind);                
                PageMethods.Admin_UserGetAll(Admin_UserGetAllBind);
                return false;
            } else {
                alert('Select Admin Level');
                return false;
            }           
        });
        function Adminuserinsertbind(result) {
            if (result > 0) {
                PageMethods.Admin_UserGetAll(Admin_UserGetAllBind);
                return false;
            } else {
                alert('Entered name and password already exists');
                return false;
            }            
        }
        $('#btndelete').click(function () {
            PageMethods.AdminUserDelete($('#<%=hdnuserid.ClientID%>').val());
            PageMethods.Admin_UserGetAll(Admin_UserGetAllBind);
        });
    </script>
</asp:Content>
