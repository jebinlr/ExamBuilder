<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineExamBuilder.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../AppThemes/CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../AppThemes/CSS/sticky-footer.css" rel="stylesheet" />
    <script src="../AppThemes/JS/jquery-3.3.1.min.js"></script>
    <script src="../AppThemes/JS/bootstrap.min.js"></script>
</head>
<body class="d-flex flex-column h-100 text-center" style="background-color: #f1f1f2;">
    <main role="main" class="flex-shrink-0">
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true" runat="server" />
            <div class="container" style="padding: 0px;">
                <div class="row m-md-5" style="margin: 0px;" id="divloginid">
                    <div class="col-lg-1 col-md-2"></div>
                    <div class="col-lg-10 col-md-8 col-sm-12 col-12-padding">
                        <div class="row" style="margin: 0px; background-color: white;">
                            <div class="col-12" style="font-weight: bold; font-size: 36px; padding-bottom: 20px;">ExamBuilder LogIn</div>
                            <div class="col-12" style="text-align: left; font-size: 22px; font-weight: bold; padding-bottom: 5px;">Name</div>
                            <div class="col-12" style="padding-bottom: 10px;">
                                <input type="text" class="w-100 form-control" id="txtusernamid" />
                            </div>
                            <div class="col-12" style="text-align: left; font-size: 22px; font-weight: bold; padding-bottom: 5px;">Password</div>
                            <div class="col-12" style="padding-bottom: 20px;">
                                <input type="password" class="w-100 form-control" id="txtpassid" />
                            </div>
                            <div class="col-12">
                                <button type="button" class="w-100 btn btn-lg btn-primary btn-block" id="loginsubmitbtn" style="font-size: 18px;">Login</button>
                            </div>
                            <div class="col-12" style="padding-bottom:15px;text-align:left;">
                                <a href="#">Forgot my password</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-2"></div>
                </div>
            </div>
            <asp:Button ID="btnlogin" CssClass="d-none" runat="server" OnClick="btnlogin_Click"/>
            <asp:HiddenField ID="hdnid" runat="server"/>
        </form>
    </main>
    <footer class="footer mt-auto py-3" style="background-color: #f1f1f2;">
    </footer>
</body>
    <script type="text/javascript">
        $('#loginsubmitbtn').click(function () {
            if ($('#txtusernamid').val() == "") {
                alert('Enter name');
                return false;
            } else if ($('#txtpassid').val() == "") {
                alert('Enter Password');
                return false;
            } else {
                PageMethods.Admin_Login($('#txtusernamid').val(), $('#txtpassid').val(), Admin_LoginBind);
                return false;
            }
        });
        function Admin_LoginBind(result) {
            if (result.length > 0) {
                $('#<%= hdnid.ClientID %>').val(result[0].ID);
                document.getElementById("<%= btnlogin.ClientID %>").click();
                return false;
            } else {
                alert('Entered Name or Password incorrect');
                return false;
            }
        }
    </script>
</html>
