<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormsApp.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>WGS84 to SWEREF 99 TM</title>
    <style>
        :root { color-scheme: light; font-family: system-ui, -apple-system, "Segoe UI", sans-serif; color: #18212b; background: #f3f6f8; }
        body { margin: 0; padding: 3rem 1rem; }
        main { box-sizing: border-box; max-width: 38rem; margin: 0 auto; padding: 2rem; background: #fff; border: 1px solid #dce3e8; border-radius: .75rem; box-shadow: 0 .5rem 1.5rem #18212b12; }
        h1 { margin-top: 0; font-size: 1.75rem; }
        p { line-height: 1.55; color: #465563; }
        .field { margin: 1.25rem 0; }
        .field label { display: block; margin-bottom: .4rem; font-weight: 600; }
        .field input { box-sizing: border-box; width: 100%; padding: .7rem .75rem; border: 1px solid #9aa8b4; border-radius: .35rem; font: inherit; }
        .field input:focus, .button:focus { outline: 3px solid #8bc7ff; outline-offset: 2px; }
        .hint { display: block; margin-top: .35rem; color: #536575; font-size: .9rem; }
        .button { padding: .7rem 1.1rem; border: 0; border-radius: .35rem; background: #145c8e; color: #fff; font: inherit; font-weight: 600; cursor: pointer; }
        .button:hover { background: #0e476f; }
        .error { margin-top: 1rem; color: #a32121; }
        .result { margin-top: 1.5rem; padding: 1rem; background: #edf6fb; border-left: .25rem solid #145c8e; }
        .result h2 { margin-top: 0; font-size: 1.2rem; }
        @media (max-width: 30rem) { body { padding: 1rem .5rem; } main { padding: 1.25rem; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <h1>WGS84 to SWEREF 99 TM</h1>
            <p>Convert geographic coordinates to SWEREF 99 TM (EPSG:3006). Enter decimal degrees using a period as the decimal separator.</p>
            <div class="field">
                <asp:Label runat="server" AssociatedControlID="txtLatitude" Text="Latitude (−90 to 90°)" />
                <asp:TextBox ID="txtLatitude" runat="server" placeholder="e.g. 59.3293" inputmode="decimal" />
            </div>
            <div class="field">
                <asp:Label runat="server" AssociatedControlID="txtLongitude" Text="Longitude (−180 to 180°)" />
                <asp:TextBox ID="txtLongitude" runat="server" placeholder="e.g. 18.0686" inputmode="decimal" />
                <span class="hint">Coordinates are in WGS84; output is in metres.</span>
            </div>
            <asp:Button ID="btnConvert" runat="server" Text="Convert coordinates" CssClass="button" OnClick="btnConvert_Click" />
            <div>
                <asp:Label ID="lblError" runat="server" CssClass="error" role="alert" EnableViewState="false" />
            </div>
            <asp:Panel ID="pnlResult" runat="server" CssClass="result" Visible="false" aria-live="polite">
                <h2>SWEREF 99 TM results</h2>
                <div>Northing (N): <asp:Label ID="lblNorthing" runat="server" /> m</div>
                <div>Easting (E): <asp:Label ID="lblEasting" runat="server" /> m</div>
            </asp:Panel>
        </main>
    </form>
</body>
</html>
