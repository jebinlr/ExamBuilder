<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="OnlineExamBuilder.Admin.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../AppThemes/CSS/bootstrap.min.css" rel="stylesheet" />
    <script src="../AppThemes/JS/jquery-3.3.1.min.js"></script>
    <script src="../AppThemes/JS/popper.min.js"></script>
    <script src="../AppThemes/JS/bootstrap.min.js"></script>
    <div class="col-12" style="padding:0px;">
        <div class="row" style="margin:0px;">
            <div class="col-12" style="padding:15px; padding-bottom:0px; text-align:right;"><button type="button" id="addnewque" class="btn btn-sm btn-success">Add</button></div>
            <div class="col-12" id="divquestionresult" style="padding:15px;"></div>
        </div>
    </div>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="txtheadtitle"></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row" style="margin:0px;" id="Roweditheader">
                        <div class="col-6" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Subject</div>
                        <div class="col-6" style="text-align: left; font-size: 20px;  padding-bottom: 5px;" id="txtsub"></div>
                        <div class="col-6" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Type</div>
                        <div class="col-6" style="text-align: left; font-size: 20px;  padding-bottom: 5px;" id="txttype"></div>
                    </div>
                    <div class="row" style="margin:0px;" id="Roweditheader1">
                    <div class="col-12" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Subject</div>
                    <div class="col-12" style="padding-bottom: 10px;">
                        <select class="custom-select" id="selsubject">
                        </select>
                    </div>
                    <div class="col-12" style="text-align: left; font-size: 20px; font-weight: bold; padding-bottom: 5px;">Type</div>
                    <div class="col-12" style="padding-bottom: 10px;">
                        <select class="custom-select" id="seltype" onchange="changeType();">
                        </select>
                    </div>
                        </div>
                    <div class="col-12" style="text-align: left; font-size: 22px; font-weight: bold; padding-bottom: 5px;">Question</div>
                    <div class="col-12" style="padding-bottom: 10px;">
                        <input type="text" class="w-100 form-control" id="txtquestion" />
                    </div>
                    <div class="row" style="margin: 0px;" id="divnoofchoice">
                        <div class="col-12" style="text-align: left; font-size: 22px; font-weight: bold; padding-bottom: 5px;">NoOf Choice</div>
                        <div class="col-12" style="padding-bottom: 10px;">
                            <input type="text" class="w-100 form-control" id="txtnoofchoice" />
                        </div>
                        <div class="col-6" style="padding-bottom: 10px;">
                            <input type="text" class="w-100 form-control" id="txtchoice1" />
                        </div>
                        <div class="col-6" style="padding-bottom: 10px;">
                            <input type="text" class="w-100 form-control" id="txtchoice2" />
                        </div>
                        <div class="col-6" style="padding-bottom: 10px;">
                            <input type="text" class="w-100 form-control" id="txtchoice3" />
                        </div>
                        <div class="col-6" style="padding-bottom: 10px;">
                            <input type="text" class="w-100 form-control" id="txtchoice4" />
                        </div>
                    </div>
                    <div class="col-12" style="color:red;font-size:14px;" id="hintfillblanks">'_' is use to give Fill in the blanks</div>
                <div class="col-12" style="text-align: left; font-size: 22px; font-weight: bold; padding-bottom: 5px;">Answer</div>
                <div class="col-12" style="padding-bottom: 10px;">
                    <input type="text" class="w-100 form-control" id="txtanswer" />
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
    <asp:HiddenField runat="server" ID="hdnsingleid"/>
    <asp:HiddenField runat="server" ID="hdnmultipleid"/>
    <asp:HiddenField runat="server" ID="hdnfillid"/>
    <asp:HiddenField runat="server" ID="hdnsubid"/>
    <asp:HiddenField runat="server" ID="hdntypeid"/>
    <asp:HiddenField runat="server" ID="hdndelid"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ASubject').addClass('sidebar-active');
            PageMethods.Admin_QuestionGetall(Admin_QuestionGetallBind);
        });
        function Admin_QuestionGetallBind(result) {
            $('#divquestionresult').empty();
            $('#divquestionresult').show();
                var html = '';
                if (result.length > 0) {
                    html += '<div class="table table-responsive" >';
                    html += '<table class="table table-bordered">';
                    html += '<tr><th>Subject</th><th>Type</th><th>Question</th><th>Answer</th><th>Action</th></tr>';
                    for (var i = 0; i < result.length; i++) {
                        html += '<tr>';
                        html += '<td>' + result[i].Subject + '</td>';
                        html += '<td>' + result[i].Type + '</td>';
                        html += '<td>' + result[i].Question + '</td>';
                        html += '<td>' + result[i].Answer + '</td>';
                        html += '<td><div class="btn-group"><button type="button" class="btn btn-sm btn-success" onclick="return QuestionEdit(' + result[i].QuestionID + ',' + result[i].TypeID + ' ); " >Edit</button>';
                        html += '<button type="button" class="btn btn-sm btn-danger" onclick="return Questiondelete(' + result[i].QuestionID + ',' + result[i].TypeID + ' ); " >Delete</button></td>';
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
                $('#divquestionresult').append(html);
        }
        function QuestionEdit(id, typeid) {
            if (typeid == 1) {
                $('#<%= hdnsingleid.ClientID %>').val(id);
                $('#<%= hdntypeid.ClientID %>').val(1);
                $('#divnoofchoice').hide();
                $('#Roweditheader').show();
                $('#myModal').modal('show');
                $('#hintfillblanks').hide();
                $('#Roweditheader1').hide();
                $('#btnsave').text('Update');
                PageMethods.Admin_singletype(id, Admin_singletypeBind);
            } else if (typeid == 2) {
                $('#<%= hdnmultipleid.ClientID %>').val(id); 
                $('#<%= hdntypeid.ClientID %>').val(2);
                $('#divnoofchoice').show();
                $('#Roweditheader').show();
                $('#myModal').modal('show');
                $('#hintfillblanks').hide();
                $('#Roweditheader1').hide();
                $('#btnsave').text('Update');
                PageMethods.Admin_multitype(id, Admin_multitypeBind);
            } else {
                $('#<%= hdnfillid.ClientID %>').val(id);
                $('#<%= hdntypeid.ClientID %>').val(3);
                $('#hintfillblanks').show();
                $('#Roweditheader').show();
                $('#Roweditheader1').hide();
                $('#divnoofchoice').hide();
                $('#myModal').modal('show');
                $('#btnsave').text('Update');
                PageMethods.Admin_filltype(id, Admin_filltypeBind);
            }
        }
        function Admin_singletypeBind(result) {
            $('#selsubject').val(result[0].SubjectID);
            $('#<%= hdnsubid.ClientID %>').val(result[0].SubjectID);
            $('#seltype').val(1);
            $('#txtquestion').val(result[0].Question);
            $('#txtanswer').val(result[0].Answer);
            $('#txtsub').text(result[0].Subject);
            $('#txttype').text(result[0].Type);
            return false;
        }
        function Admin_multitypeBind(result) {
            $('#selsubject').val(result[0].SubjectID);
            $('#<%= hdnsubid.ClientID %>').val(result[0].SubjectID);
            $('#seltype').val(2);
            $('#txtquestion').val(result[0].Questions);
            $('#txtanswer').val(result[0].Answer);
            $('#txtnoofchoice').val(result[0].NoOFChoice);
            $('#txtchoice1').val(result[0].choice1);
            $('#txtchoice2').val(result[0].choice2);
            if (result[0].choice3 != null) {
                $('#txtchoice3').val(result[0].choice3);
            }
            if (result[0].choice4 != null) {
                $('#txtchoice4').val(result[0].choice4);
            }            
            $('#txtsub').text(result[0].Subject);
            $('#txttype').text(result[0].Type);
            return false;
        }
        function Admin_filltypeBind(result) {
            $('#selsubject').val(result[0].SubjectID);
            $('#<%= hdnsubid.ClientID %>').val(result[0].SubjectID);
            $('#seltype').val(1);
            $('#txtquestion').val(result[0].Question);
            $('#txtanswer').val(result[0].Answer);
            $('#txtsub').text(result[0].Subject);
            $('#txttype').text(result[0].Type);
            return false;
        }
        function Questiondelete(id, typeid) {
            $('#<%= hdntypeid.ClientID %>').val(typeid);
            $('#<%= hdndelid.ClientID %>').val(id);
            $('#myModaldel').modal('show');
        }
        $('#btndelete').click(function () {
            if ($('#<%= hdntypeid.ClientID %>').val() == 1) {
                PageMethods.Admin_SingleDelete($('#<%= hdndelid.ClientID %>').val());
            } else if ($('#<%= hdntypeid.ClientID %>').val() == 2) {
                PageMethods.Admin_MultipleDelete($('#<%= hdndelid.ClientID %>').val());
            } else {
                PageMethods.Admin_FillDelete($('#<%= hdndelid.ClientID %>').val());
            }
            $('#myModaldel').modal('hide');
            PageMethods.Admin_QuestionGetall(Admin_QuestionGetallBind);
            return false;
        });
        $('#addnewque').click(function () {
            $('#<%= hdnsingleid.ClientID %>').val(0);
            $('#<%= hdnmultipleid.ClientID %>').val(0);
            $('#<%= hdnfillid.ClientID %>').val(0);
            $('#<%= hdntypeid.ClientID %>').val(0);
            $('#<%= hdnsubid.ClientID %>').val(0);
            PageMethods.Admin_Subjectdrpdwn(Admin_SubjectdrpdwnBind);
            PageMethods.Admin_Typedrpdwn(Admin_TypedrpdwnBind);
            $('#btnsave').text('Save');
            $('#divnoofchoice').hide();
            $('#hintfillblanks').hide();
            $('#Roweditheader').hide();
            $('#Roweditheader1').show();
            $('#txtquestion').val("");
            $('#txtanswer').val("");
            $('#myModal').modal('show');
        });
        $('#txtnoofchoice').keypress(function (e) {
            var charcode = (e.which) ? e.which : event.keyCode
            if (String.fromCharCode(charcode).match(/[^2-4]/g))
                return false;
        });
        function Admin_SubjectdrpdwnBind(result) {
            $('#selsubject').empty();
            $('#selsubject').show();
            var html = '';
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    html += '<option value=' + result[i].ID + '>' + result[i].Subject + '</option>';
                }
            }
            $('#selsubject').append(html);
        }
        function Admin_TypedrpdwnBind(result) {
            $('#seltype').empty();
            $('#seltype').show();
            var html = '';
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    html += '<option value=' + result[i].ID + '>' + result[i].Type + '</option>';
                }
            }
            $('#seltype').append(html);
        }
        $('#btnsave').click(function () {   
            if ($('#<%= hdnsubid.ClientID %>').val() == 0) {
                var subject = $('#selsubject').val();
            } else {
                var subject = $('#<%= hdnsubid.ClientID %>').val();
            }
            if ($('#<%= hdntypeid.ClientID %>').val() == 0) {
                var type = $('#seltype').val();
            } else {
                var type = $('#<%= hdntypeid.ClientID %>').val();
            }
            if (type == 1) {
                if ($('#txtquestion').val() == "") {
                    alert('Enter Question');
                    return false;
                } else if ($('#txtanswer').val() == "") {
                    alert('Enter Answer');
                    return false;
                } else {
                    $('#myModal').modal('hide');
                    PageMethods.Admin_Singleinsert($('#<%= hdnsingleid.ClientID %>').val(), subject, $('#txtquestion').val(), $('#txtanswer').val(), Admin_Singleinsertsuccess);
                    return false;
                }                
            } else if (type == 2) {
                if ($('#txtquestion').val() == "") {
                    alert('Enter Question');
                    return false;
                } else if ($('#txtnoofchoice').val() == "") {
                    alert('Enter No of choice');
                    return false;
                } else if ($('#txtnoofchoice').val() < 2 || $('#txtnoofchoice').val() > 4) {
                    alert('Enter valide number for No of choice');
                    return false;
                } else if ($('#txtchoice1').val() == "") {
                    alert('Enter choices');
                    return false;
                } else if ($('#txtchoice2').val() == "") {
                    alert('Enter choices');
                    return false;                    
                } else if ($('#txtanswer').val() == "") {
                    alert('Enter Answer');
                    return false;
                } else {
                    $('#myModal').modal('hide');
                    PageMethods.Admin_Multipleinsert($('#<%= hdnmultipleid.ClientID %>').val(), subject, $('#txtnoofchoice').val(), $('#txtquestion').val(), $('#txtchoice1').val(),
                        $('#txtchoice2').val(), $('#txtchoice3').val(), $('#txtchoice4').val(), $('#txtanswer').val(), Admin_MultipleinsertSuccess);
                    return false;
                }              
            } else if (type == 3) {
                if ($('#txtquestion').val() == "") {
                    alert('Enter Question');
                    return false;
                } else if ($('#txtanswer').val() == "") {
                    alert('Enter Answer');
                    return false;
                } else {
                    $('#myModal').modal('hide');
                    PageMethods.Admin_Fillinsert($('#<%= hdnfillid.ClientID %>').val(), subject, $('#txtquestion').val(), $('#txtanswer').val(), Admin_Fillinsertsuccess);
                    return false;
                }                
            }
        });
        function changeType() {
            if ($('#seltype').val() == 1) {
                $('#divnoofchoice').hide();
                $('#hintfillblanks').hide();
            } else if ($('#seltype').val() == 2) {
                $('#divnoofchoice').show();
                $('#hintfillblanks').hide();
            } else {
                $('#hintfillblanks').show();
                $('#divnoofchoice').hide();
            }
        }
        function Admin_Singleinsertsuccess(result) {
            if (result>0) {
                PageMethods.Admin_questioninsert($('#selsubject').val(), $('#seltype').val(), result);                
            }            
            PageMethods.Admin_QuestionGetall(Admin_QuestionGetallBind);
        }
        function Admin_MultipleinsertSuccess(result) {
            if (result > 0) {
                PageMethods.Admin_questioninsert($('#selsubject').val(), $('#seltype').val(), result);                
            }
            PageMethods.Admin_QuestionGetall(Admin_QuestionGetallBind);
        }
        function Admin_Fillinsertsuccess(result) {
            if (result > 0) {
                PageMethods.Admin_questioninsert($('#selsubject').val(), $('#seltype').val(), result);                
            }
            PageMethods.Admin_QuestionGetall(Admin_QuestionGetallBind);
        }
    </script>
</asp:Content>
