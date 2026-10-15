<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormsApp.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WGS84 to SWEREF 99 TM</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>WGS84 to SWEREF 99 TM</h1>
        <div>
            <asp:Label runat="server" AssociatedControlID="txtLatitude" Text="Latitude (WGS84, degrees):" />
            <asp:TextBox ID="txtLatitude" runat="server" />
        </div>
        <div>
            <asp:Label runat="server" AssociatedControlID="txtLongitude" Text="Longitude (WGS84, degrees):" />
            <asp:TextBox ID="txtLongitude" runat="server" />
        </div>
        <div>
            <asp:Button ID="btnConvert" runat="server" Text="Convert" OnClick="btnConvert_Click" />
        </div>
        <div>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="false" />
        </div>
        <asp:Panel ID="pnlResult" runat="server" Visible="false">
            <h2>SWEREF 99 TM (EPSG:3006)</h2>
            <div>Northing (N): <asp:Label ID="lblNorthing" runat="server" /></div>
            <div>Easting (E): <asp:Label ID="lblEasting" runat="server" /></div>
        </asp:Panel>
    </form>
</body>
</html>
