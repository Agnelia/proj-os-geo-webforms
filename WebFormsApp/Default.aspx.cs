using System;
using System.Globalization;

namespace WebFormsApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void btnConvert_Click(object sender, EventArgs e)
        {
            pnlResult.Visible = false;
            lblError.Text = String.Empty;

            double lat, lon;
            if (!double.TryParse(txtLatitude.Text.Trim(), NumberStyles.Float, CultureInfo.InvariantCulture, out lat) ||
                !double.TryParse(txtLongitude.Text.Trim(), NumberStyles.Float, CultureInfo.InvariantCulture, out lon) ||
                double.IsNaN(lat) || double.IsInfinity(lat) ||
                double.IsNaN(lon) || double.IsInfinity(lon) ||
                lat < -90 || lat > 90 || lon < -180 || lon > 180)
            {
                lblError.Text = "Enter valid numbers (use '.' as decimal separator): latitude -90..90, longitude -180..180.";
                return;
            }

            try
            {
                var result = Sweref99Converter.FromWgs84(lat, lon);
                lblNorthing.Text = result.Northing.ToString("F3", CultureInfo.InvariantCulture);
                lblEasting.Text = result.Easting.ToString("F3", CultureInfo.InvariantCulture);
                pnlResult.Visible = true;
            }
            catch (Exception ex)
            {
                lblError.Text = "Transformation failed: " + Server.HtmlEncode(ex.Message);
            }
        }
    }
}
