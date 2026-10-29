unit CemapaCertDigital_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 03/08/2010 08:53:19 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\dll certificado digital delphi\Add.tlb (1)
// LIBID: {8CAA5481-C900-3CAA-9F36-D400797BCAE2}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v2.0 mscorlib, (C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TCertificado) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CemapaCertDigitalMajorVersion = 1;
  CemapaCertDigitalMinorVersion = 0;

  LIBID_CemapaCertDigital: TGUID = '{8CAA5481-C900-3CAA-9F36-D400797BCAE2}';

  IID_ICertificado: TGUID = '{655F8964-AF73-33F4-B65F-907F02211DF3}';
  CLASS_Certificado: TGUID = '{286DA7F3-31BA-3EC0-911A-2BFF5D8D14E3}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICertificado = interface;
  ICertificadoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Certificado = ICertificado;


// *********************************************************************//
// Interface: ICertificado
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {655F8964-AF73-33F4-B65F-907F02211DF3}
// *********************************************************************//
  ICertificado = interface(IDispatch)
    ['{655F8964-AF73-33F4-B65F-907F02211DF3}']
    function BuscaNome: WideString; safecall;
    function BuscaNroSerie(const NroSerie: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICertificadoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {655F8964-AF73-33F4-B65F-907F02211DF3}
// *********************************************************************//
  ICertificadoDisp = dispinterface
    ['{655F8964-AF73-33F4-B65F-907F02211DF3}']
    function BuscaNome: WideString; dispid 1610743808;
    function BuscaNroSerie(const NroSerie: WideString): WideString; dispid 1610743809;
  end;

// *********************************************************************//
// The Class CoCertificado provides a Create and CreateRemote method to          
// create instances of the default interface ICertificado exposed by              
// the CoClass Certificado. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCertificado = class
    class function Create: ICertificado;
    class function CreateRemote(const MachineName: string): ICertificado;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCertificado
// Help String      : 
// Default Interface: ICertificado
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCertificadoProperties= class;
{$ENDIF}
  TCertificado = class(TOleServer)
  private
    FIntf:        ICertificado;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCertificadoProperties;
    function      GetServerProperties: TCertificadoProperties;
{$ENDIF}
    function      GetDefaultInterface: ICertificado;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICertificado);
    procedure Disconnect; override;
    function BuscaNome: WideString;
    function BuscaNroSerie(const NroSerie: WideString): WideString;
    property DefaultInterface: ICertificado read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCertificadoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCertificado
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCertificadoProperties = class(TPersistent)
  private
    FServer:    TCertificado;
    function    GetDefaultInterface: ICertificado;
    constructor Create(AServer: TCertificado);
  protected
  public
    property DefaultInterface: ICertificado read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoCertificado.Create: ICertificado;
begin
  Result := CreateComObject(CLASS_Certificado) as ICertificado;
end;

class function CoCertificado.CreateRemote(const MachineName: string): ICertificado;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Certificado) as ICertificado;
end;

procedure TCertificado.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{286DA7F3-31BA-3EC0-911A-2BFF5D8D14E3}';
    IntfIID:   '{655F8964-AF73-33F4-B65F-907F02211DF3}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCertificado.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICertificado;
  end;
end;

procedure TCertificado.ConnectTo(svrIntf: ICertificado);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCertificado.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCertificado.GetDefaultInterface: ICertificado;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCertificado.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCertificadoProperties.Create(Self);
{$ENDIF}
end;

destructor TCertificado.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCertificado.GetServerProperties: TCertificadoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCertificado.BuscaNome: WideString;
begin
  Result := DefaultInterface.BuscaNome;
end;

function TCertificado.BuscaNroSerie(const NroSerie: WideString): WideString;
begin
  Result := DefaultInterface.BuscaNroSerie(NroSerie);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCertificadoProperties.Create(AServer: TCertificado);
begin
  inherited Create;
  FServer := AServer;
end;

function TCertificadoProperties.GetDefaultInterface: ICertificado;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TCertificado]);
end;

end.
