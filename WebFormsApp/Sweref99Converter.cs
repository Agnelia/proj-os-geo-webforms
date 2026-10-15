using SharpProj;

namespace WebFormsApp
{
    public struct Sweref99Result
    {
        public double Northing;
        public double Easting;
    }

    /// <summary>Transforms WGS84 coordinates to SWEREF 99 TM (EPSG:3006) using PROJ via SharpProj.</summary>
    public static class Sweref99Converter
    {
        // Axis order is explicit (x = longitude/easting, y = latitude/northing) to avoid EPSG axis-order ambiguity.
        private const string Wgs84 = "+proj=longlat +datum=WGS84 +no_defs";
        private const string Sweref99Tm = "+proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs";

        public static Sweref99Result FromWgs84(double latitude, double longitude)
        {
            using (var context = new ProjContext())
            using (var from = CoordinateReferenceSystem.Create(Wgs84, context))
            using (var to = CoordinateReferenceSystem.Create(Sweref99Tm, context))
            using (var transform = CoordinateTransform.Create(from, to))
            {
                var p = transform.Apply(new PPoint(longitude, latitude));
                return new Sweref99Result { Easting = p.X, Northing = p.Y };
            }
        }
    }
}
