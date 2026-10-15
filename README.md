# WGS84 to SWEREF 99 TM

An ASP.NET Web Forms application that converts WGS84 latitude and longitude
coordinates to SWEREF 99 TM (EPSG:3006) using PROJ through SharpProj.

## WebFormsApp

The start page is `WebFormsApp/Default.aspx`. The project targets .NET Framework
4.8 and requires Windows x64 because SharpProj uses the Windows x64 PROJ runtime.

### Run in Visual Studio

1. Install Visual Studio with the **ASP.NET and web development** workload and
   the .NET Framework 4.8 Developer Pack.
2. From the repository root, restore the NuGet dependencies:
   `nuget restore WebFormsApp/packages.config -PackagesDirectory packages`
3. Open `WebFormsApp/WebFormsApp.csproj` in Visual Studio and start it with IIS
   Express (F5).

### Build from a Windows command prompt

After installing the .NET Framework 4.8 Developer Pack and Visual Studio web
build tools, run these commands from the repository root:

```text
nuget restore WebFormsApp/packages.config -PackagesDirectory packages
msbuild WebFormsApp/WebFormsApp.csproj /p:Configuration=Debug /p:Platform=x64
```

Enter latitude and longitude in decimal degrees, with a period as the decimal
separator. The page displays northing and easting in metres.
