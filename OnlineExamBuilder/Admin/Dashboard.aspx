<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineExamBuilder.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .dashboard-title-head{
            padding:0px 7px; 
            text-align:center;
            color:white;
            font-size:30px;
            font-weight:700;            
        }
        .dashboard-total-head{
            font-size:20px;
            padding:10px 0px;
            text-align:center;
        }
    </style>
    <div class="row" style="margin:0px;">
        <div class="col-12" style="padding:7.5px;">
            <div class="row" style="margin:0px;">
                <div class="col-md-4 col-sm-6 col-12" style="padding:7.5px;">
                    <div class="row" style="margin:0px; border:1px solid red;border-radius:4px;">
                        <div class="col-12 dashboard-title-head" style="background-color:red;">English</div>
                        <div class="col-12 dashboard-total-head">Total Questions: <label id="lblenglishid" runat="server" style="margin:0px;"></label></div>
                    </div>
                    <div class="row" style="margin:0px; margin-top:15px; border:1px solid red; padding:15px; border-radius:4px;">
                        <div class="col-12" style="font-size:20px; padding:0px;">Single</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:green;"></div>
                        </div>
                        <div class="col-12" style="font-size:20px; margin-top:15px; padding:0px;">Multiple</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:red;"></div>
                        </div>
                        <div class="col-12" style="font-size:20px; margin-top:15px; padding:0px;">Fill</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:blue;"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12" style="padding:7.5px;">
                    <div class="row" style="margin:0px; border:1px solid green;border-radius:4px;">
                        <div class="col-12 dashboard-title-head" style="background-color:green;">Maths</div>
                        <div class="col-12 dashboard-total-head">Total Questions: <label id="lblmathsid" runat="server" style="margin:0px;"></label></div>
                    </div>
                    <div class="row" style="margin:0px; margin-top:15px; border:1px solid green; padding:15px; border-radius:4px;">
                        <div class="col-12" style="font-size:20px; padding:0px;">Single</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:green;"></div>
                        </div>
                        <div class="col-12" style="font-size:20px; margin-top:15px; padding:0px;">Multiple</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:red;"></div>
                        </div>
                        <div class="col-12" style="font-size:20px; margin-top:15px; padding:0px;">Fill</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:blue;"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12" style="padding:7.5px;">
                    <div class="row" style="margin:0px; border:1px solid yellow;border-radius:4px;">
                        <div class="col-12 dashboard-title-head" style="background-color:yellow;">Science</div>
                        <div class="col-12 dashboard-total-head">Total Questions: <label id="lblscienceid" runat="server" style="margin:0px;"></label></div>
                    </div>
                    <div class="row" style="margin:0px; margin-top:15px; border:1px solid yellow; padding:15px; border-radius:4px;">
                        <div class="col-12" style="font-size:20px; padding:0px;">Single</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:green;"></div>
                        </div>
                        <div class="col-12" style="font-size:20px; margin-top:15px; padding:0px;">Multiple</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:red;"></div>
                        </div>
                        <div class="col-12" style="font-size:20px; margin-top:15px; padding:0px;">Fill</div>
                        <div class="col-12" style="background-color:#ddd;padding:0px;">
                            <div class="row" style="margin:0px; text-align:right;padding-top:15px;padding-bottom:15px;color:white; width:90%;background-color:blue;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ADashboard').addClass('sidebar-active');
        });
    </Script>
</asp:Content>
