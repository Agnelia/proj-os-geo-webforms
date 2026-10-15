# proj-os-geo-webforms
Wrap proj os geo to use in webforms project

## WebFormsApp

ASP.NET WebForms (.NET Framework 4.8) start page where you enter WGS84 latitude/longitude and get SWEREF 99 TM (EPSG:3006) northing/easting. Transformation uses [PROJ](https://proj.org) through the [SharpProj](https://www.nuget.org/packages/SharpProj) NuGet package (Windows x64 only).

Build: `nuget restore WebFormsApp/packages.config -PackagesDirectory packages`, then open in Visual Studio (IIS Express) or run `msbuild WebFormsApp/WebFormsApp.csproj`.
